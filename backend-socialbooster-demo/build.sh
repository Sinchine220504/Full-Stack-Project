#!/bin/bash
pip install -r requirements.txt
python manage.py migrate
python manage.py collectstatic --noinput
echo "Build complete. Use gunicorn to start the server."