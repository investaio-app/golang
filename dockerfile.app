FROM django-base:latest

WORKDIR /app

COPY backend/ .

CMD ["gunicorn", "velzon.wsgi:application", "--bind", "0.0.0.0:8000"]
