#!/bin/bash
# Start script for Render - runs migrations then starts gunicorn
cd backend-socialbooster-demo || exit
python manage.py migrate --noinput
gunicorn socialbooster.wsgi:application --bind 0.0.0.0:$PORT
