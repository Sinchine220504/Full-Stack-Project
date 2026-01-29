#!/bin/bash
# Start script for Render
gunicorn socialbooster.wsgi:application --bind 0.0.0.0:$PORT
