1. Dockerfile:

```Dockerfile
# Use an official Python runtime as a parent image
FROM python:3.7-slim as build

# Set the working directory in the container to /app
WORKDIR /app

# Add the current directory contents into the container at /app
ADD . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Use multi-stage builds
FROM build AS production

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]
```

This Dockerfile uses Python 3.7 as the base image, sets the working directory to /app, adds the current directory contents into the container at /app, installs the necessary dependencies using pip, exposes port 80, and runs app.py when the container launches.

2. Containerization script:

```bash
#!/bin/bash

# Build the Docker image
docker build -t my-python-app .

# Run the Docker container
docker run -p 4000:80 my-python-app
```

This script builds the Docker image using the Dockerfile in the current directory and tags it as "my-python-app". It then runs the Docker container, mapping the host's port 4000 to the container's port 80.