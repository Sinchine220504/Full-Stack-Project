# Render Deployment Fix - Backend

## Problem
Render is running `python manage.py runserver` instead of `gunicorn`, causing port binding issues.

## Solution

### Option 1: Set Start Command in Render Dashboard (Recommended)

1. Go to your Render dashboard: https://dashboard.render.com
2. Click on your web service
3. Go to **Settings** tab
4. Scroll to **"Start Command"**
5. Set it to:
   ```
   gunicorn socialbooster.wsgi:application --bind 0.0.0.0:$PORT
   ```
6. Click **"Save Changes"**
7. Render will automatically redeploy

### Option 2: Use render.yaml (If using Blueprint)

If you're using Render Blueprint, the `render.yaml` file has been created. Make sure:
- The file is in the **root** of your repository (not in backend folder)
- Or move it to `backend-socialbooster-demo/render.yaml` if deploying from subdirectory

### Option 3: Ensure Procfile is Detected

The Procfile exists at `backend-socialbooster-demo/Procfile`. If Render is deploying from root:

1. In Render dashboard → Settings
2. Set **Root Directory** to: `backend-socialbooster-demo`
3. Render should automatically detect the Procfile

## Required Environment Variables in Render

Make sure these are set in Render dashboard → Environment:

```
SECRET_KEY=<generate-a-random-secret-key>
DEBUG=False
ALLOWED_HOSTS=your-app-name.onrender.com,localhost,127.0.0.1
USE_SQLITE=False
DB_NAME=<from-postgres-database>
DB_USER=<from-postgres-database>
DB_PASSWORD=<from-postgres-database>
DB_HOST=<from-postgres-database>
DB_PORT=5432
```

## Database Setup

1. In Render dashboard, create a **PostgreSQL** database
2. Copy the connection details
3. Add them to environment variables

## After Fixing

1. Save the start command
2. Render will redeploy automatically
3. Check the logs - you should see gunicorn starting
4. Your API will be available at: `https://your-app.onrender.com/api/campaigns/`
