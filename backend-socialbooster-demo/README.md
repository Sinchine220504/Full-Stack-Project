# Campaign Tracker Backend API

A Django REST Framework backend for managing marketing campaigns with full CRUD operations, dashboard statistics, and currency exchange API integration.

## Tech Stack

- **Framework**: Django 4.2.7
- **API**: Django REST Framework 3.14.0
- **Database**: PostgreSQL (Supabase)
- **Python**: 3.8+

## Project Overview

This backend provides RESTful APIs for a Campaign Tracker System, allowing users to:
- Create, read, update, and delete campaigns
- View dashboard statistics (campaigns by status, budget by platform, total budget)
- Convert campaign budgets to different currencies using exchange rate API

## Local Setup Instructions

### Prerequisites

- Python 3.8 or higher
- PostgreSQL database (local or Supabase)
- pip (Python package manager)

### Step 1: Clone the Repository

```bash
git clone <repository-url>
cd backend-socialbooster-demo
```

### Step 2: Create Virtual Environment

```bash
# Windows
python -m venv venv
venv\Scripts\activate

# macOS/Linux
python3 -m venv venv
source venv/bin/activate
```

### Step 3: Install Dependencies

```bash
pip install -r requirements.txt
```

### Step 4: Environment Variables

Create a `.env` file in the root directory (copy from `.env.example`):

```env
SECRET_KEY=your-secret-key-here
DEBUG=True
ALLOWED_HOSTS=localhost,127.0.0.1

DB_NAME=your-database-name
DB_USER=your-database-user
DB_PASSWORD=your-database-password
DB_HOST=your-database-host.supabase.co
DB_PORT=5432

EXCHANGE_RATE_API_KEY=
```

### Step 5: Database Setup

#### Option A: Using Supabase

1. Create a project on [Supabase](https://supabase.com)
2. Go to Project Settings > Database
3. Copy the connection details to your `.env` file

#### Option B: Local PostgreSQL

1. Install PostgreSQL locally
2. Create a database:
```sql
CREATE DATABASE socialbooster;
```

3. Update `.env` with local credentials:
```env
DB_HOST=localhost
DB_PORT=5432
DB_NAME=socialbooster
DB_USER=postgres
DB_PASSWORD=your-password
```

### Step 6: Run Migrations

```bash
python manage.py migrate
```

### Step 7: Create Superuser (Optional)

```bash
python manage.py createsuperuser
```

### Step 8: Run Development Server

```bash
python manage.py runserver
```

The API will be available at `http://localhost:8000`

## API Endpoints

### Campaign CRUD Operations

- **POST** `/api/campaigns/` - Create a new campaign
- **GET** `/api/campaigns/` - List all campaigns
- **GET** `/api/campaigns/{id}/` - Get campaign details
- **PUT** `/api/campaigns/{id}/` - Update campaign (full update)
- **PATCH** `/api/campaigns/{id}/` - Update campaign (partial update)
- **DELETE** `/api/campaigns/{id}/` - Delete a campaign

### Dashboard Statistics

- **GET** `/api/campaigns/stats/` - Get dashboard statistics
  - Returns: status counts, platform budgets, total budget, total campaigns

### Currency Conversion

- **GET** `/api/campaigns/{id}/convert_budget/` - Convert campaign budget to multiple currencies

## API Request/Response Examples

### Create Campaign

**Request:**
```bash
POST /api/campaigns/
Content-Type: application/json

{
  "name": "Summer Sale 2024",
  "platform": "Google Ads",
  "budget": 5000.00,
  "status": "Active",
  "start_date": "2024-06-01",
  "end_date": "2024-08-31"
}
```

**Response:**
```json
{
  "id": 1,
  "name": "Summer Sale 2024",
  "platform": "Google Ads",
  "budget": "5000.00",
  "status": "Active",
  "start_date": "2024-06-01",
  "end_date": "2024-08-31",
  "created_at": "2024-01-15T10:30:00Z",
  "updated_at": "2024-01-15T10:30:00Z"
}
```

### Get Dashboard Stats

**Request:**
```bash
GET /api/campaigns/stats/
```

**Response:**
```json
{
  "status_counts": {
    "Active": 5,
    "Paused": 2,
    "Completed": 3
  },
  "platform_budgets": {
    "Google Ads": 15000.00,
    "Meta": 8000.00,
    "LinkedIn": 5000.00
  },
  "total_budget": 28000.00,
  "total_campaigns": 10
}
```

### Convert Budget

**Request:**
```bash
GET /api/campaigns/1/convert_budget/
```

**Response:**
```json
{
  "campaign_id": 1,
  "campaign_name": "Summer Sale 2024",
  "original_budget": 5000.00,
  "currency": "USD",
  "conversions": {
    "USD": 5000.00,
    "EUR": 4500.00,
    "GBP": 3900.00,
    "INR": 415000.00
  },
  "exchange_rates": {
    "EUR": 0.90,
    "GBP": 0.78,
    "INR": 83.00
  }
}
```

## Testing Guide

### Using cURL

```bash
# Create a campaign
curl -X POST http://localhost:8000/api/campaigns/ \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Test Campaign",
    "platform": "Meta",
    "budget": 1000.00,
    "status": "Active",
    "start_date": "2024-01-01",
    "end_date": "2024-12-31"
  }'

# Get all campaigns
curl http://localhost:8000/api/campaigns/

# Get campaign details
curl http://localhost:8000/api/campaigns/1/

# Update campaign
curl -X PATCH http://localhost:8000/api/campaigns/1/ \
  -H "Content-Type: application/json" \
  -d '{"status": "Paused"}'

# Delete campaign
curl -X DELETE http://localhost:8000/api/campaigns/1/

# Get dashboard stats
curl http://localhost:8000/api/campaigns/stats/

# Convert budget
curl http://localhost:8000/api/campaigns/1/convert_budget/
```

### Using Postman

1. Import the collection (if available)
2. Set base URL: `http://localhost:8000`
3. Test each endpoint

## Deployment

### Deploy to Render

1. Create a new Web Service on [Render](https://render.com)
2. Connect your GitHub repository
3. Set build command: `pip install -r requirements.txt`
4. Set start command: `gunicorn socialbooster.wsgi:application`
5. Add environment variables from `.env.example`
6. Add PostgreSQL database addon
7. Update `ALLOWED_HOSTS` in settings.py to include your Render domain

### Deploy to Railway

1. Create a new project on [Railway](https://railway.app)
2. Connect your GitHub repository
3. Add PostgreSQL service
4. Set environment variables
5. Railway will auto-detect Django and deploy

### Environment Variables for Production

```env
SECRET_KEY=<generate-strong-secret-key>
DEBUG=False
ALLOWED_HOSTS=your-domain.com,*.render.com,*.railway.app

DB_NAME=<production-db-name>
DB_USER=<production-db-user>
DB_PASSWORD=<production-db-password>
DB_HOST=<production-db-host>
DB_PORT=5432
```

### Post-Deployment Checklist

- [ ] Database migrations run successfully
- [ ] Environment variables configured
- [ ] CORS settings updated for frontend domain
- [ ] Static files collected (if needed)
- [ ] API endpoints tested
- [ ] Health check endpoint working

## Project Structure

```
backend-socialbooster-demo/
├── campaigns/
│   ├── migrations/
│   ├── __init__.py
│   ├── admin.py
│   ├── apps.py
│   ├── models.py
│   ├── serializers.py
│   ├── urls.py
│   └── views.py
├── socialbooster/
│   ├── __init__.py
│   ├── settings.py
│   ├── urls.py
│   ├── wsgi.py
│   └── asgi.py
├── .env.example
├── .gitignore
├── manage.py
├── requirements.txt
└── README.md
```

## Troubleshooting

### Database Connection Issues

- Verify PostgreSQL is running
- Check database credentials in `.env`
- Ensure database exists
- Check network connectivity to Supabase

### CORS Errors

- Update `CORS_ALLOWED_ORIGINS` in `settings.py` with your frontend URL
- Ensure `corsheaders` is in `INSTALLED_APPS` and `MIDDLEWARE`

### Migration Issues

```bash
# Reset migrations (development only)
python manage.py migrate campaigns zero
python manage.py migrate
```

## License

MIT License
