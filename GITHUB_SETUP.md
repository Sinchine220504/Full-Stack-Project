# GitHub Setup Guide

Follow these steps to upload your Campaign Tracker project to GitHub.

## Prerequisites

- GitHub account (create one at https://github.com if you don't have one)
- Git installed (check with `git --version`)

## Step 1: Create GitHub Repositories

1. Go to https://github.com and sign in
2. Click the **"+"** icon → **"New repository"**
3. Create **TWO repositories**:

   **Repository 1:**
   - Name: `backend-socialbooster-demo`
   - Description: `Django REST Framework backend for Campaign Tracker System`
   - Visibility: Public (or Private)
   - **DO NOT** initialize with README, .gitignore, or license
   - Click **"Create repository"**

   **Repository 2:**
   - Name: `frontend-socialbooster-demo`
   - Description: `Next.js frontend for Campaign Tracker System`
   - Visibility: Public (or Private)
   - **DO NOT** initialize with README, .gitignore, or license
   - Click **"Create repository"**

## Step 2: Initialize Backend Repository

Open PowerShell and run:

```powershell
cd "D:\Full Stack Project\backend-socialbooster-demo"

# Initialize git
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: Django REST Framework backend"

# Add remote (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/backend-socialbooster-demo.git

# Push to GitHub
git branch -M main
git push -u origin main
```

## Step 3: Initialize Frontend Repository

Open a **new** PowerShell window and run:

```powershell
cd "D:\Full Stack Project\frontend-socialbooster-demo"

# Initialize git
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: Next.js frontend"

# Add remote (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/frontend-socialbooster-demo.git

# Push to GitHub
git branch -M main
git push -u origin main
```

## Step 4: Verify Upload

1. Go to your GitHub profile
2. You should see both repositories:
   - `backend-socialbooster-demo`
   - `frontend-socialbooster-demo`
3. Click on each repository to verify all files are uploaded

## Important Notes

### Files NOT Uploaded (by design):
- `.env` files (contains sensitive data)
- `venv/` folder (Python virtual environment)
- `node_modules/` folder (Node.js dependencies)
- `db.sqlite3` (database file)
- `.next/` folder (Next.js build files)

These are excluded via `.gitignore` files, which is correct!

### Environment Variables:

**For Backend:**
Create `.env.example` file (already exists) that shows what variables are needed:
```env
SECRET_KEY=your-secret-key-here
DEBUG=True
ALLOWED_HOSTS=localhost,127.0.0.1
USE_SQLITE=True
DB_NAME=socialbooster
DB_USER=postgres
DB_PASSWORD=your-password
DB_HOST=localhost
DB_PORT=5432
```

**For Frontend:**
Create `.env.example` file (already exists) that shows:
```env
NEXT_PUBLIC_API_URL=http://localhost:8000
```

## Troubleshooting

### If you get "remote origin already exists":
```powershell
git remote remove origin
git remote add origin https://github.com/YOUR_USERNAME/repo-name.git
```

### If you get authentication errors:
1. Use GitHub Personal Access Token instead of password
2. Go to GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
3. Generate new token with `repo` scope
4. Use token as password when prompted

### If you want to update code later:
```powershell
git add .
git commit -m "Your commit message"
git push
```

## Next Steps After Upload

1. Add repository descriptions on GitHub
2. Add topics/tags: `django`, `nextjs`, `postgresql`, `rest-api`, `full-stack`
3. Update README files with your GitHub repository URLs
4. Consider adding GitHub Actions for CI/CD (optional)

---

**Your repositories will be live at:**
- `https://github.com/YOUR_USERNAME/backend-socialbooster-demo`
- `https://github.com/YOUR_USERNAME/frontend-socialbooster-demo`
