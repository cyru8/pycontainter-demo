# set base image (host OS)
From python:3.8

# set the working directory in the container
WORKDIR /code

# copy the dependencies file to the workking directory
COPY requirements.txt .

# Install the dependencies
RUN pip install -r requirements.txt

# copy the content of the local src directory to the workig directory
COPY src/ .

# command to run on the container once the above actions are completed.
CMD ["python", "./server.py"]
