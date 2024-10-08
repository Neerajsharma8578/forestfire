# Base image: Use an official Python runtime as a base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the requirements.txt file to the container
# Fix: Ensure the correct path to your requirements.txt file, so dependencies can be installed
COPY requirements.txt ./

# Install Python dependencies
# Fix: Adding --no-cache-dir to reduce image size and avoid caching issues
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files into the container
COPY . .

# Expose the port the application will use
# Fix: Ensure the port matches what your app expects (5000 for Flask, 8000 for FastAPI, etc.)
EXPOSE 5000

# Fix: Use CMD instead of RUN to run the application at startup
# CMD runs when the container starts
# If your app uses Flask or FastAPI, you can specify the correct start command
CMD ["python", "app.py"]
