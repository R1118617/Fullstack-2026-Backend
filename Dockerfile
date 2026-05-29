# Start from standard python-image
FROM python:3.10-slim

# Copy requirements file and install dependencies on container
COPY ./requirements.txt /code/requirements.txt

# Install necessary binaries
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copy the application
# I (R1118617) did not create a subdir for the code so we're screwed and need to copy all things separate...
COPY ./config.py /code
COPY ./database.py /code
COPY ./main.py /code
COPY ./models /code/models/
COPY ./queries /code/queries/
COPY ./routes /code/routes/
COPY ./sql_files /code/sql_files/

# If we had setup a subdir we could simply fullfill this task as mentioned below:
#COPY ./app /code

# Environment variable (local testing)
# The DB_CONNECT string is stored in Render.
# The setting DOCS_URL is not needed since we disabled the URL for security-reasons
ENV ALLOWED_ORIGINS=["https://localhost:63342","http://localhost:63342","http://localhost:8080","https://localhost:8080","http://127.0.0.1:8080","https://127.0.0.1:8080"]

# Set workdirectory
WORKDIR /code/

#  Listen on port 8000 from outside the container
EXPOSE 8000

# Start the fastAPI app using Uvicorn after booting the container and listen on all IP's
CMD ["python", "-m",  "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
