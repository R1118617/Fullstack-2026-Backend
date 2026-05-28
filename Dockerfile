FROM python:3.10.0-alpine

# Set workdirectory
WORKDIR /code

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
