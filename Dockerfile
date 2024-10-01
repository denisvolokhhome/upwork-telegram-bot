# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the requirements file into the container at /usr/src/app
COPY requirements.txt .

# Install any necessary dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code to the container
COPY . .

# Set environment variables (these will be overridden by the .env file)
ENV TOKEN=""
ENV DB_CONNECTION=""
ENV DB_NAME=""
ENV DEVS=""

# Make port 8000 available to the world outside this container (optional, if you want to expose a web interface)
EXPOSE 8000

# Run the application
CMD ["python", "bot.py"]
