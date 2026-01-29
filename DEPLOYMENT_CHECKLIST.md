# Production Deployment Checklist

Complete checklist for deploying the Campaign Tracker System to production.

## Pre-Deployment

### Backend Checklist

- [ ] **Code Review**
  - [ ] All code reviewed and tested
  - [ ] No debug statements left in code
  - [ ] Error handling implemented
  - [ ] Input validation in place

- [ ] **Environment Variables**
  - [ ] `SECRET_KEY` generated (use Django's `get_random_secret_key()`)
  - [ ] `DEBUG` set to `False`
  - [ ] `ALLOWED_HOSTS` includes production domain
  - [ ] Database credentials configured
  - [ ] CORS origins updated for frontend domain

- [ ] **Database**
  - [ ] PostgreSQL database created (Supabase)
  - [ ] Database migrations tested locally
  - [ ] Backup strategy in place
  - [ ] Connection string verified

- [ ] **Security**
  - [ ] Secret key is secure and not in version control
  - [ ] `.env` file added to `.gitignore`
  - [ ] CORS configured correctly
  - [ ] CSRF protection enabled
  - [ ] SQL injection protection (Django ORM)
  - [ ] XSS protection enabled

- [ ] **Dependencies**
  - [ ] `requirements.txt` updated
  - [ ] All dependencies pinned to specific versions
  - [ ] No development dependencies in production

- [ ] **Static Files** (if needed)
  - [ ] `STATIC_ROOT` configured
  - [ ] `collectstatic` command tested

### Frontend Checklist

- [ ] **Code Review**
  - [ ] All code reviewed and tested
  - [ ] No console.log statements left
  - [ ] Error handling implemented
  - [ ] Loading states implemented

- [ ] **Environment Variables**
  - [ ] `NEXT_PUBLIC_API_URL` set to production backend URL
  - [ ] No hardcoded API URLs

- [ ] **Build**
  - [ ] `npm run build` succeeds without errors
  - [ ] No TypeScript errors
  - [ ] No linting errors
  - [ ] Production build tested locally

- [ ] **Performance**
  - [ ] Images optimized
  - [ ] Code splitting implemented
  - [ ] Bundle size optimized

## Deployment Steps

### Backend Deployment (Render/Railway)

#### Render Deployment

- [ ] **Create Render Account**
  - [ ] Sign up at https://render.com
  - [ ] Connect GitHub account

- [ ] **Create Web Service**
  - [ ] Click "New" → "Web Service"
  - [ ] Connect repository: `backend-socialbooster-demo`
  - [ ] Set name: `socialbooster-backend`
  - [ ] Set region: Choose closest to users
  - [ ] Set branch: `main` or `master`

- [ ] **Configure Build**
  - [ ] Build Command: `pip install -r requirements.txt`
  - [ ] Start Command: `gunicorn socialbooster.wsgi:application`
  - [ ] Environment: `Python 3`

- [ ] **Add PostgreSQL Database**
  - [ ] Click "New" → "PostgreSQL"
  - [ ] Set name: `socialbooster-db`
  - [ ] Copy connection details

- [ ] **Set Environment Variables**
  ```
  SECRET_KEY=<generate-new-secret-key>
  DEBUG=False
  ALLOWED_HOSTS=your-app.onrender.com,*.onrender.com
  DB_NAME=<from-postgres-details>
  DB_USER=<from-postgres-details>
  DB_PASSWORD=<from-postgres-details>
  DB_HOST=<from-postgres-details>
  DB_PORT=5432
  ```

- [ ] **Deploy**
  - [ ] Click "Create Web Service"
  - [ ] Wait for deployment to complete
  - [ ] Check build logs for errors

- [ ] **Run Migrations**
  - [ ] Open Render shell or use CLI
  - [ ] Run: `python manage.py migrate`
  - [ ] Verify migrations successful

- [ ] **Verify Deployment**
  - [ ] Visit backend URL
  - [ ] Test API endpoints
  - [ ] Check logs for errors

#### Railway Deployment

- [ ] **Create Railway Account**
  - [ ] Sign up at https://railway.app
  - [ ] Connect GitHub account

- [ ] **Create New Project**
  - [ ] Click "New Project"
  - [ ] Select "Deploy from GitHub repo"
  - [ ] Select `backend-socialbooster-demo`

- [ ] **Add PostgreSQL Service**
  - [ ] Click "+ New"
  - [ ] Select "PostgreSQL"
  - [ ] Copy connection details

- [ ] **Configure Service**
  - [ ] Railway auto-detects Django
  - [ ] Verify start command: `python manage.py migrate && gunicorn socialbooster.wsgi:application`

- [ ] **Set Environment Variables**
  - [ ] Go to Variables tab
  - [ ] Add all required variables (same as Render)

- [ ] **Deploy**
  - [ ] Railway auto-deploys on push
  - [ ] Check deployment logs
  - [ ] Verify service is running

- [ ] **Run Migrations**
  - [ ] Open Railway shell
  - [ ] Run: `python manage.py migrate`

### Frontend Deployment (Vercel/Netlify)

#### Vercel Deployment

- [ ] **Create Vercel Account**
  - [ ] Sign up at https://vercel.com
  - [ ] Connect GitHub account

- [ ] **Import Project**
  - [ ] Click "Add New" → "Project"
  - [ ] Import `frontend-socialbooster-demo`
  - [ ] Framework Preset: Next.js (auto-detected)

- [ ] **Configure Project**
  - [ ] Root Directory: `frontend-socialbooster-demo`
  - [ ] Build Command: `npm run build` (default)
  - [ ] Output Directory: `.next` (default)

- [ ] **Set Environment Variables**
  ```
  NEXT_PUBLIC_API_URL=https://your-backend-url.onrender.com
  ```

- [ ] **Deploy**
  - [ ] Click "Deploy"
  - [ ] Wait for build to complete
  - [ ] Verify deployment successful

- [ ] **Verify Deployment**
  - [ ] Visit frontend URL
  - [ ] Test all pages
  - [ ] Test API connections

#### Netlify Deployment

- [ ] **Create Netlify Account**
  - [ ] Sign up at https://netlify.com
  - [ ] Connect GitHub account

- [ ] **Add New Site**
  - [ ] Click "Add new site" → "Import an existing project"
  - [ ] Select `frontend-socialbooster-demo`

- [ ] **Configure Build Settings**
  - [ ] Build command: `npm run build`
  - [ ] Publish directory: `.next`
  - [ ] Base directory: `frontend-socialbooster-demo`

- [ ] **Set Environment Variables**
  - [ ] Go to Site settings → Environment variables
  - [ ] Add: `NEXT_PUBLIC_API_URL`

- [ ] **Deploy**
  - [ ] Click "Deploy site"
  - [ ] Wait for build
  - [ ] Verify deployment

## Post-Deployment

### Backend Verification

- [ ] **API Endpoints**
  - [ ] `GET /api/campaigns/` returns 200
  - [ ] `POST /api/campaigns/` creates campaign
  - [ ] `GET /api/campaigns/stats/` returns stats
  - [ ] `GET /api/campaigns/{id}/convert_budget/` works

- [ ] **Database**
  - [ ] Migrations applied
  - [ ] Can create/read/update/delete records
  - [ ] Database connection stable

- [ ] **CORS**
  - [ ] Frontend can make API requests
  - [ ] No CORS errors in browser console

- [ ] **Logs**
  - [ ] No errors in application logs
  - [ ] Logging configured correctly

### Frontend Verification

- [ ] **Pages Load**
  - [ ] Home page (`/`) loads
  - [ ] Dashboard (`/dashboard`) loads
  - [ ] Create campaign page loads
  - [ ] Campaign detail pages load

- [ ] **CRUD Operations**
  - [ ] Create campaign works
  - [ ] View campaigns works
  - [ ] Edit campaign works
  - [ ] Delete campaign works

- [ ] **Dashboard**
  - [ ] Charts render correctly
  - [ ] Statistics display correctly
  - [ ] Charts update after CRUD operations

- [ ] **Currency Conversion**
  - [ ] Convert budget button works
  - [ ] Currency conversions display
  - [ ] Exchange rates shown

- [ ] **Error Handling**
  - [ ] Error messages display correctly
  - [ ] Loading states work
  - [ ] Network errors handled

### Integration Testing

- [ ] **End-to-End Flow**
  - [ ] Create campaign from frontend
  - [ ] View campaign in list
  - [ ] Edit campaign
  - [ ] View dashboard (verify charts update)
  - [ ] Convert budget
  - [ ] Delete campaign

- [ ] **Cross-Browser Testing**
  - [ ] Chrome
  - [ ] Firefox
  - [ ] Safari
  - [ ] Edge

- [ ] **Mobile Responsiveness**
  - [ ] Mobile view works
  - [ ] Tables are responsive
  - [ ] Forms are usable

## Monitoring & Maintenance

- [ ] **Monitoring Setup**
  - [ ] Error tracking (Sentry, etc.)
  - [ ] Uptime monitoring
  - [ ] Performance monitoring

- [ ] **Backup Strategy**
  - [ ] Database backups configured
  - [ ] Backup schedule set
  - [ ] Backup restoration tested

- [ ] **Documentation**
  - [ ] README updated with production URLs
  - [ ] API documentation updated
  - [ ] Deployment guide documented

- [ ] **Security**
  - [ ] SSL certificates configured (HTTPS)
  - [ ] Security headers configured
  - [ ] Regular security updates scheduled

## Rollback Plan

- [ ] **Backend Rollback**
  - [ ] Previous version tagged in Git
  - [ ] Rollback procedure documented
  - [ ] Database migration rollback tested

- [ ] **Frontend Rollback**
  - [ ] Previous deployment available
  - [ ] Rollback procedure documented

## Final Checklist

- [ ] All tests passing
- [ ] No critical bugs
- [ ] Performance acceptable
- [ ] Security measures in place
- [ ] Documentation complete
- [ ] Team notified of deployment
- [ ] Monitoring active
- [ ] Backup strategy in place

---

## Quick Reference

### Backend URLs
- **Render**: `https://socialbooster-backend.onrender.com`
- **Railway**: `https://socialbooster-backend.railway.app`

### Frontend URLs
- **Vercel**: `https://socialbooster-demo.vercel.app`
- **Netlify**: `https://socialbooster-demo.netlify.app`

### Database
- **Supabase**: `https://app.supabase.com`

### Environment Variables Template

**Backend (.env)**
```env
SECRET_KEY=your-secret-key-here
DEBUG=False
ALLOWED_HOSTS=your-domain.com,*.render.com
DB_NAME=postgres
DB_USER=postgres
DB_PASSWORD=your-password
DB_HOST=your-host.supabase.co
DB_PORT=5432
```

**Frontend (.env.local)**
```env
NEXT_PUBLIC_API_URL=https://your-backend-url.com
```
