from fastapi import Depends, FastAPI, UploadFile

from backend.app import schemas
from backend.app.core.oauth2 import get_current_user
from backend.app.database import database
from backend.app.database.database import engine
from backend.app.routers.authentication import router as auth_router
from backend.app.routers.user import router as user_router

app = FastAPI()
database.Base.metadata.create_all(engine)
app.include_router(user_router)
app.include_router(auth_router)


@app.post("/upload/", tags=["uploads"])
async def create_upload_file(
    file: UploadFile, current_user: schemas = Depends(get_current_user)
):
    return {"filename": file.filename}
