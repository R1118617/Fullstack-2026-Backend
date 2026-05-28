FROM python:3.10.0-alpine

# Set workdirectory
WORKDIR /code

# Copy requirements file and install dependencies
COPY ./requirements.txt /code/requirement.txt

# Install necessary binaries
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copy the rest of your application code
COPY ./app /code

#  Listen on port 8000 from outside the container
EXPOSE 8000

# Start fastAPI app using Uvicorn, listen on all defined IP's on port 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
