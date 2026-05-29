import os
from dotenv import load_dotenv

load_dotenv()
#db_connection = os.environ.get('DB_CONNECT')
documentation_url = os.environ.get('DOCS_URL')
#allowed_origins = os.environ.get('ALLOWED_ORIGINS', "http://localhost:63342,http://127.0.0.1:63342,http://localhost:8000")
allowed_origins = os.environ.get('ALLOWED_ORIGINS')
db_user = os.environ.get('DB_CONNECT_USER')
db_password = os.environ.get('DB_CONNECT_PASSWORD')
db_url = os.environ.get('DB_CONNECT_URL')
db_dbname = os.environ.get('DB_CONNECT_DATABASE')
db_connection = "postgresql://".db_user + ":" + db_password + "@" + db_url + "/"+ db_dbname + "?sslmode=require&channel_binding=require"
