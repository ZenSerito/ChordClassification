from fastapi import FastAPI, UploadFile

from backend.app.database import database
from backend.app.database.database import engine
from backend.app.routers.user import router as user_router

app = FastAPI()
database.Base.metadata.create_all(engine)
app.include_router(user_router)


@app.post("/uploadfile/")
async def create_upload_file(file: UploadFile):
    return {"filename": file.filename}
