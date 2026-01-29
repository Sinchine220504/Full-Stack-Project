# Netlify Deployment Guide - Frontend

Complete guide to deploy your Next.js frontend to Netlify.

## Prerequisites

- GitHub repository with frontend code pushed
- Netlify account (free at https://netlify.com)
- Backend API deployed and accessible (for production API URL)

---

## Step 1: Prepare Your Frontend

### 1.1 Ensure Build Works Locally

Test that your build works:

```powershell
cd "D:\Full Stack Project\frontend-socialbooster-demo"
npm install
npm run build
```

If build succeeds, you're ready to deploy!

### 1.2 Commit Netlify Configuration

The `netlify.toml` file has been created. Make sure it's committed:

```powershell
cd "D:\Full Stack Project"
git add frontend-socialbooster-demo/netlify.toml
git commit -m "Add Netlify configuration"
git push origin main
```

---

## Step 2: Deploy to Netlify

### 2.1 Create Netlify Account

1. Go to https://netlify.com
2. Click **"Sign up"**
3. Choose **"Sign up with GitHub"** (recommended)
4. Authorize Netlify to access your GitHub account

### 2.2 Add New Site from Git

1. In Netlify dashboard, click **"Add new site"**
2. Select **"Import an existing project"**
3. Choose **"Deploy with GitHub"**
4. Authorize Netlify if prompted
5. Select your repository: `Sinchine220504/Full-Stack-Project`

### 2.3 Configure Build Settings

Netlify should auto-detect Next.js, but verify these settings:

**Base directory:**
```
frontend-socialbooster-demo
```

**Build command:**
```
npm run build
```

**Publish directory:**
```
.next
```

**OR** leave it empty if using `netlify.toml` (it will use the config file)

### 2.4 Set Environment Variables

**Before deploying**, click **"Show advanced"** → **"New variable"** and add:

**Variable name:** `NEXT_PUBLIC_API_URL`  
**Value:** Your backend API URL (e.g., `https://your-backend.onrender.com`)

**Important:** 
- Replace `your-backend.onrender.com` with your actual backend URL
- Do NOT include trailing slash
- Must start with `https://`

### 2.5 Deploy

1. Click **"Deploy site"**
2. Wait for build to complete (2-5 minutes)
3. You'll see a success message with your site URL

---

## Step 3: Verify Deployment

### 3.1 Check Your Site

1. Click on your site URL (e.g., `https://random-name-123.netlify.app`)
2. The frontend should load
3. Open browser console (F12) to check for errors

### 3.2 Test Functionality

1. **Create a campaign** - Should work if backend is accessible
2. **View dashboard** - Charts should load
3. **Test currency conversion** - Should call backend API

### 3.3 Check Build Logs

If something doesn't work:
1. Go to Netlify dashboard
2. Click on your site
3. Go to **"Deploys"** tab
4. Click on the latest deploy
5. Check **"Deploy log"** for errors

---

## Step 4: Custom Domain (Optional)

### 4.1 Add Custom Domain

1. In Netlify dashboard → **Site settings** → **Domain management**
2. Click **"Add custom domain"**
3. Enter your domain (e.g., `campaign-tracker.com`)
4. Follow DNS configuration instructions

### 4.2 SSL Certificate

Netlify automatically provides SSL certificates via Let's Encrypt (free).

---

## Troubleshooting

### Build Fails

**Error: "Module not found"**
- Check that all dependencies are in `package.json`
- Run `npm install` locally to verify

**Error: "Build command failed"**
- Check build logs in Netlify
- Test build locally: `npm run build`
- Ensure Node.js version is 18+ (set in `netlify.toml`)

### Frontend Can't Connect to Backend

**Error: "Failed to fetch" or CORS errors**
- Verify `NEXT_PUBLIC_API_URL` is set correctly in Netlify environment variables
- Check backend CORS settings include your Netlify domain
- Backend URL should be: `https://your-backend.onrender.com` (no trailing slash)

**To update environment variable:**
1. Netlify dashboard → Site settings → Environment variables
2. Edit `NEXT_PUBLIC_API_URL`
3. Redeploy site

### API Calls Return 404

- Verify backend is deployed and running
- Check backend URL in Netlify environment variables
- Test backend API directly: `https://your-backend.onrender.com/api/campaigns/`

### Charts Not Rendering

- Check browser console for errors
- Verify dashboard stats API is accessible
- Ensure backend `/api/campaigns/stats/` endpoint works

---

## Updating Your Site

### Automatic Deploys

Netlify automatically deploys when you push to GitHub:
1. Make changes to your code
2. Commit and push to GitHub:
   ```powershell
   git add .
   git commit -m "Your changes"
   git push origin main
   ```
3. Netlify will automatically detect and deploy

### Manual Deploy

1. Netlify dashboard → **"Deploys"** tab
2. Click **"Trigger deploy"** → **"Deploy site"**

---

## Environment Variables Reference

### Required for Production

```
NEXT_PUBLIC_API_URL=https://your-backend.onrender.com
```

### Example Backend URLs

- **Render:** `https://your-app.onrender.com`
- **Railway:** `https://your-app.railway.app`
- **AWS:** `https://your-app.execute-api.region.amazonaws.com`

---

## Netlify Configuration File

The `netlify.toml` file in your frontend folder contains:

```toml
[build]
  command = "npm run build"
  publish = ".next"

[[plugins]]
  package = "@netlify/plugin-nextjs"

[build.environment]
  NODE_VERSION = "18"
```

This tells Netlify:
- How to build your Next.js app
- Where to find the built files
- Which Node.js version to use

---

## Quick Checklist

- [ ] Frontend code pushed to GitHub
- [ ] Netlify account created
- [ ] Site connected to GitHub repository
- [ ] Base directory set to `frontend-socialbooster-demo`
- [ ] Environment variable `NEXT_PUBLIC_API_URL` set
- [ ] Build successful
- [ ] Site accessible via Netlify URL
- [ ] Frontend connects to backend API
- [ ] CRUD operations work
- [ ] Dashboard charts render
- [ ] Currency conversion works

---

## Your Netlify Site URL

After deployment, your site will be available at:
- **Default:** `https://random-name-123.netlify.app`
- **Custom:** `https://your-domain.com` (if configured)

---

## Next Steps

1. **Deploy Backend** (if not done):
   - Render: https://render.com
   - Railway: https://railway.app

2. **Update Environment Variable**:
   - Once backend is deployed, update `NEXT_PUBLIC_API_URL` in Netlify

3. **Test Everything**:
   - Create, read, update, delete campaigns
   - Check dashboard visualization
   - Test currency conversion

4. **Create Screen Recording**:
   - Show live deployment working
   - Demonstrate all features

---

**Your frontend will be live at:** `https://your-site.netlify.app` 🚀
