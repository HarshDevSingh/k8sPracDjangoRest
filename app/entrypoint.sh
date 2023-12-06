#!/bin/bash

# Set the path to the configuration file explicitly
PYTHON_FILE="guincorn_conf.py"


python manage.py migrate --no-input
python manage.py collectstatic --no-input

# Run Gunicorn with the Python file as the configuration
gunicorn -c "$PYTHON_FILE" app.wsgi


