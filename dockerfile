# Use an official Python runtime as a parent image
FROM python:3.10

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /code

# Copy the dependencies file to the working directory
COPY requirements.txt /code/

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Copy the rest of the application code to the working directory
COPY . /code/

# Expose the port Django runs on
EXPOSE 8000

# Apply migrations
RUN python manage.py migrate

# Run Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
