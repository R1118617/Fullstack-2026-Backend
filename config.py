import os
from dotenv import load_dotenv

load_dotenv()
db_connection = os.environ.get('DB_CONNECT')
allowed_origins = os.environ.get('ALLOWED_ORIGINS')
