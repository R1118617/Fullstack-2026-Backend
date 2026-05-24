from fastapi import FastAPI
import config
from fastapi.middleware.cors import CORSMiddleware
from starlette.middleware import Middleware
from routes import student4_endpoints

middleware = [
    Middleware(
        CORSMiddleware,
        allow_origins=['https://example.org'],
        allow_credentials=True,
        allow_methods=['*'],
        allow_headers=['*']
    )
]

#app = FastAPI()
app = FastAPI(docs_url=config.documentation_url,middleware=middleware)

app.include_router(student4_endpoints.router)

@app.get("/")
def root():
    return {"message": "Hello, World!"}
