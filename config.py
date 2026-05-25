import os
from dotenv import load_dotenv

load_dotenv()
db_connection = os.environ.get('DB_CONNECT')
documentation_url = os.environ.get('DOCS_URL')
allowed_origins = os.environ.get('ALLOWED_ORIGINS')

# allowed_origins = [
#     "http://localhost",
#     "https://localhost",
#     "http://localhost:8001","http://localhost:63343","https://localhost:63343"
# ]
