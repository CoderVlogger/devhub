# Use base python image with python3
FROM python:3

ENV PYTHONUNBUFFERED 1

# Create app directory
RUN mkdir /app
WORKDIR /app

# Add requirements.txt to the image
ADD ./src/entrypoint.sh /app/
ADD ./requirements/docker.txt /app/requirements-docker.txt
RUN pip install -r requirements-docker.txt

# Copy
ADD ./src /app/
