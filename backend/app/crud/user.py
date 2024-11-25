from fastapi import HTTPException, status
from sqlalchemy.orm import Session

from backend.app.core.hashing import Hash
from backend.app.models.user import User as models_User
from backend.app.schemas.user import User as Schemas_User


def create(request: Schemas_User, db: Session):
    hashed_password = Hash.bcrypt(request.password)
    new_user = models_User(
        name=request.name, email=request.email, password=hashed_password
    )
    db.add(new_user)
    db.commit()
    db.refresh(new_user)
    print(Hash.verify(hashed_password, request.password))
    return new_user


def read(id: int, db: Session):
    user = db.query(models_User).filter(models_User.id == id).first()
    if not user:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"User with the id {id} is not available",
        )
    return user
