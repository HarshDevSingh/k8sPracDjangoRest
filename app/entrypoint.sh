#!/bin/bash

python manage.py wait_for_db
python manage.py migrate --no-input
python manage.py collectstatic --no-input
python manage.py create_super_user --username "$DJANGO_SUPERUSER_USERNAME" --email "$DJANGO_SUPERUSER_EMAIL" --password "$DJANGO_SUPERUSER_PASSWORD" --no-input

# Set the path to the configuration file explicitly
PYTHON_FILE="guincorn_conf.py"
# Run Gunicorn with the Python file as the configuration
gunicorn -c "$PYTHON_FILE" app.wsgi


