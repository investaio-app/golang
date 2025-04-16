FROM python:3.10-slim

# Optional: Add cached apt packages if needed, or build base image yourself

WORKDIR /app

# Copy requirements and offline packages
COPY backend/requirements.txt .
COPY packages/ /packages/

# Install Python packages offline
RUN pip install --no-index --find-links=/packages -r requirements.txt

# Copy the Django project code
COPY backend/ .

# Default command to start the Django server (or use gunicorn)
CMD ["gunicorn", "myproject.wsgi:application", "--bind", "0.0.0.0:8000"]
