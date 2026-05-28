FROM python:3.10.0-alpine

# Set workdirectory
WORKDIR /code

# Setup environment variables (because .env is not replicated)
ENV DB_CONNECT=postgresql://${{ DB_CONNECT_USER }}:${{ DB_CONNECT_PASSWORD }}@${{ DB_CONNECT_URL }}/${{ DB_CONNECT_DATABASE }}?sslmode=require&channel_binding=require
ENV DOCS_URL=/docs
ENV ALLOWED_ORIGINS=[https://localhost:8080,http://127.0.0.1:8080,https://127.0.0.1:8080]

# Copy requirements file and install dependencies
COPY ./requirements.txt /code/requirement.txt

# Install necessary binaries
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copy the application
# I (R1118617) did not create a subdir for the code so we're screwed and need to copy all things separate...
COPY ./config.py /code
COPY ./database.py /code
COPY ./main.py /code
COPY ./models /code
COPY ./queries /code
COPY ./routes /code
# If we had setup a subdir we could simply fullfill this task using:
# COPY ./app /code

#  Listen on port 8000 from outside the container
EXPOSE 8000

# Start fastAPI app using Uvicorn, listen on all defined IP's on port 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
