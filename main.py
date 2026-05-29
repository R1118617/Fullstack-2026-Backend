from fastapi import FastAPI
import config
from fastapi.middleware.cors import CORSMiddleware
from starlette.middleware import Middleware
# from config import db_connection
from routes import student1_endpoints
from routes import student2_endpoints
from routes import student3_endpoints
from routes import student4_endpoints

middleware = [
    Middleware(
        CORSMiddleware,
        allow_origins=config.allowed_origins,
        allow_credentials=True,
        allow_methods=['*'],
        allow_headers=['*']
    )
]

app = FastAPI(
    docs_url=None,
    redoc_url=None,
    openapi_url=None,
    middleware=middleware)
app.include_router(student1_endpoints.router)
app.include_router(student2_endpoints.router)
app.include_router(student3_endpoints.router)
app.include_router(student4_endpoints.router)


@app.get("/")
def root():
    return {"message": "Hello, World!"}
