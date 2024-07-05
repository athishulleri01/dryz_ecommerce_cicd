#!/bin/sh
python manage.py makemigrations

python manage.py migrate
# collect all static files to the root directory
python manage.py collectstatic --no-input


# start the gunicorn worker processws at the defined port
gunicorn dryz.wsgi:application --bind 0.0.0.0:8000 &

wait