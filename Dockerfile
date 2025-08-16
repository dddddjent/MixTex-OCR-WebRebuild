# Use an official Python runtime as a parent image
FROM python:3.11-bullseye

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY webapi/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the webapi source code
COPY webapi/ .

# Copy the model files
COPY model/ ./model

# Expose the port the app runs on
EXPOSE 8000

# Run the application
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]