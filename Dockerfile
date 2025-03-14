# Write a Dockerfile to build a container for a Python application.
# Step 1: Use an official Python image as the base image
FROM python:3.8-slim

# Step 2: Set the working directory inside the container
WORKDIR /app
# Step 3: Copy the requirements.txt file into the container
COPY requirements.txt .
# Step 4: Install Python dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Copy the rest of the application code into the container
COPY . .

# Step 6: Expose the port the app will run on (if it's a web app like Flask)
EXPOSE 5000

# Step 7: Define the default command to run the application
CMD ["python", "app.py"]
