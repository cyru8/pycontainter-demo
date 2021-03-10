# first stage
From python:3.8 AS builder
COPY requirements.txt

# Install dependencies to the local user directory (e.g: /local/.local)
RUN pip install --user -r requirements.txt

# Second Unnamed Stage 
From python:3.8-slim
#set the working directory in the container
WORKDIR /code

# copy only the dependencies installatioon from the 1st stage image
COPY --from=builder /root/.local /root/.local
COPY ./src .

# update PATH environment variable
ENV PATH=/root/.local:$PATH

# command to run on the container once the above actions are completed.
CMD ["python", "./server.py"]
