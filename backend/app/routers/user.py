from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from backend.app.crud.user import create, read
from backend.app.database.database import get_db
from backend.app.schemas.user import ShowUser, User

router = APIRouter(prefix="/user", tags=["Users"])


@router.post("/create", response_model=ShowUser)
def create_user(request: User, db: Session = Depends(get_db)):
    return create(request, db)


@router.get("/get/{id}", response_model=ShowUser)
def get_user(id: int, db: Session = Depends(get_db)):
    return read(id, db)
