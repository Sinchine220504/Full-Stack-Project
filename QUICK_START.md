# Quick Start Guide

Get the Campaign Tracker System up and running in minutes!

## Prerequisites Check

- [ ] Python 3.8+ installed (`python --version`)
- [ ] Node.js 18+ installed (`node --version`)
- [ ] PostgreSQL database (local or Supabase account)
- [ ] Git installed

## Step 1: Backend Setup (5 minutes)

```bash
# Clone or navigate to backend directory
cd backend-socialbooster-demo

# Create virtual environment
python -m venv venv

# Activate virtual environment
# Windows:
venv\Scripts\activate
# macOS/Linux:
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Create .env file
# Copy .env.example to .env and fill in your database credentials

# Run migrations
python manage.py migrate

# Create a superuser (optional)
python manage.py createsuperuser

# Start development server
python manage.py runserver
```

✅ Backend running at `http://localhost:8000`

## Step 2: Frontend Setup (3 minutes)

```bash
# Open a new terminal, navigate to frontend directory
cd frontend-socialbooster-demo

# Install dependencies
npm install

# Create .env.local file
# Add: NEXT_PUBLIC_API_URL=http://localhost:8000

# Start development server
npm run dev
```

✅ Frontend running at `http://localhost:3000`

## Step 3: Test the Application

1. **Open browser**: Go to `http://localhost:3000`
2. **Create a campaign**: Click "New Campaign" and fill the form
3. **View dashboard**: Click "Dashboard" to see charts
4. **Test currency conversion**: View a campaign and click "Convert Budget"

## Common Issues

### Backend won't start
- Check if port 8000 is available
- Verify database credentials in `.env`
- Ensure virtual environment is activated

### Frontend can't connect to backend
- Verify backend is running on port 8000
- Check `NEXT_PUBLIC_API_URL` in `.env.local`
- Ensure CORS is configured in backend settings

### Database connection errors
- Verify PostgreSQL is running (if local)
- Check Supabase connection string (if using Supabase)
- Ensure database exists

## Next Steps

- Read the full [README.md](./README.md) for detailed documentation
- Check [API_DOCUMENTATION.md](./API_DOCUMENTATION.md) for API details
- Review [DEPLOYMENT_CHECKLIST.md](./DEPLOYMENT_CHECKLIST.md) for production deployment

## Need Help?

- Check the troubleshooting sections in the README files
- Review error messages in browser console (F12)
- Check backend logs in terminal

---

**You're all set!** 🎉
