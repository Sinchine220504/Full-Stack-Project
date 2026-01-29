# Setting Up PostgreSQL on Render

## Step 1: Create PostgreSQL Database

1. Go to https://dashboard.render.com
2. Click **"New +"** → **"PostgreSQL"**
3. Fill in:
   - **Name**: `socialbooster-db`
   - **Database**: `socialbooster` (or leave default)
   - **User**: `socialbooster_user` (or leave default)
   - **Region**: Choose closest to your web service
   - **PostgreSQL Version**: 15 (or latest)
   - **Plan**: Free (for demo) or paid (for production)
4. Click **"Create Database"**
5. Wait 2-3 minutes for database to be created

## Step 2: Get Database Connection Details

1. Click on your database
2. Go to **"Connections"** tab
3. Copy these values:
   - **Internal Database URL** (for Render services)
   - Or individual values:
     - Host
     - Port (usually 5432)
     - Database name
     - User
     - Password

## Step 3: Update Web Service Environment Variables

1. Go to your **Web Service** settings
2. Go to **Environment** tab
3. Add/Update these variables:

```
SECRET_KEY=<generate-random-secret-key>
DEBUG=False
ALLOWED_HOSTS=full-stack-project-x6lm.onrender.com,localhost,127.0.0.1,*.onrender.com
RENDER=true
USE_SQLITE=False
DB_NAME=<database-name-from-step-2>
DB_USER=<user-from-step-2>
DB_PASSWORD=<password-from-step-2>
DB_HOST=<host-from-step-2>
DB_PORT=5432
```

**OR** if you have the full connection string:

```
DATABASE_URL=postgresql://user:password@host:port/dbname
```

## Step 4: Link Database to Web Service (Optional but Recommended)

1. In your **Web Service** settings
2. Go to **Environment** tab
3. Scroll to **"Add Environment Variable"**
4. Click **"Link Database"**
5. Select your PostgreSQL database
6. Render will automatically add the connection variables

## Step 5: Redeploy

1. After setting environment variables, Render will auto-redeploy
2. Or manually trigger: **Manual Deploy** → **Deploy latest commit**

## Step 6: Run Migrations

After deployment, migrations should run automatically if you have this in your build command:

```
pip install -r requirements.txt && python manage.py migrate
```

If not, you can run migrations manually:
1. Go to your service → **Shell** tab
2. Run: `python manage.py migrate`

## Verify It Works

1. Check your service logs - should see no database errors
2. Visit: `https://your-app.onrender.com/api/campaigns/`
3. Should return `[]` (empty array) - means database is connected!

---

## Quick Setup (Using Internal Database URL)

If Render provides an internal database URL, you can use it directly:

1. Copy the **Internal Database URL** from database settings
2. Add to web service environment:
   ```
   DATABASE_URL=postgresql://user:pass@host:port/dbname
   ```
3. Update `settings.py` to use `DATABASE_URL` if needed

---

## Troubleshooting

### "Error loading psycopg2"
- Make sure `psycopg2-binary` is in `requirements.txt` ✅ (already there)

### "Connection refused"
- Check database is running (should show "Available" in dashboard)
- Verify host, port, and credentials are correct

### "Database does not exist"
- Check database name matches exactly
- Some Render databases have a default name

### Migrations not running
- Add `python manage.py migrate` to build command
- Or run manually in Shell tab

---

## Free Tier Limitations

- **Database size**: 1 GB
- **Connections**: Limited
- **Backups**: Manual only
- **Suitable for**: Demo/testing

For production, consider paid plans or other providers.
