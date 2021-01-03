# Inherit from Image & overwrite some of the parameters below
FROM python:3.7-alpine
MAINTAINER Keshav

# No bufferring of output
ENV PYTHNUNBUFFERED 1

# copy from requirements file to Docker Image
COPY ./requirements.txt /requirements.txt

# Install from the requirements.txt just copied above
RUN pip install -r /requirements.txt

# Create a directory inside the image to store application source code
RUN mkdir /app

# Any application we run on Docker container will use this folder as defalult location
WORKDIR /app

# Copy from local folder to the folder in the image
COPY ./app /app

# Create a user to run the application using Docker
# -D means user it has permission to only run application
RUN adduser -D user

# Set USER variable to user just created
USER user
