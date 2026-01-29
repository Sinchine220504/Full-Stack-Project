# API Endpoints - cURL Examples

All API endpoints in cURL format for the Campaign Tracker System.

**Base URL:** `https://full-stack-project-2-wp86.onrender.com`

---

## 1. List All Campaigns

```bash
curl https://full-stack-project-2-wp86.onrender.com/api/campaigns/
```

**With pretty JSON output:**
```bash
curl https://full-stack-project-2-wp86.onrender.com/api/campaigns/ | python -m json.tool
```

---

## 2. Get Campaign Details

```bash
curl https://full-stack-project-2-wp86.onrender.com/api/campaigns/1/
```

**Replace `1` with actual campaign ID**

---

## 3. Create Campaign

```bash
curl -X POST https://full-stack-project-2-wp86.onrender.com/api/campaigns/ \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Summer Sale 2024",
    "platform": "Google Ads",
    "budget": 5000.00,
    "status": "Active",
    "start_date": "2024-06-01",
    "end_date": "2024-08-31"
  }'
```

**One-liner version:**
```bash
curl -X POST https://full-stack-project-2-wp86.onrender.com/api/campaigns/ -H "Content-Type: application/json" -d '{"name":"Summer Sale 2024","platform":"Google Ads","budget":5000.00,"status":"Active","start_date":"2024-06-01","end_date":"2024-08-31"}'
```

---

## 4. Update Campaign (Full - PUT)

```bash
curl -X PUT https://full-stack-project-2-wp86.onrender.com/api/campaigns/1/ \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Summer Sale 2024 Updated",
    "platform": "Meta",
    "budget": 6000.00,
    "status": "Paused",
    "start_date": "2024-06-01",
    "end_date": "2024-08-31"
  }'
```

**One-liner:**
```bash
curl -X PUT https://full-stack-project-2-wp86.onrender.com/api/campaigns/1/ -H "Content-Type: application/json" -d '{"name":"Summer Sale 2024 Updated","platform":"Meta","budget":6000.00,"status":"Paused","start_date":"2024-06-01","end_date":"2024-08-31"}'
```

---

## 5. Update Campaign (Partial - PATCH)

```bash
curl -X PATCH https://full-stack-project-2-wp86.onrender.com/api/campaigns/1/ \
  -H "Content-Type: application/json" \
  -d '{
    "status": "Completed"
  }'
```

**Update only budget:**
```bash
curl -X PATCH https://full-stack-project-2-wp86.onrender.com/api/campaigns/1/ \
  -H "Content-Type: application/json" \
  -d '{
    "budget": 7500.00
  }'
```

**One-liner:**
```bash
curl -X PATCH https://full-stack-project-2-wp86.onrender.com/api/campaigns/1/ -H "Content-Type: application/json" -d '{"status":"Completed"}'
```

---

## 6. Delete Campaign

```bash
curl -X DELETE https://full-stack-project-2-wp86.onrender.com/api/campaigns/1/
```

**With verbose output:**
```bash
curl -X DELETE https://full-stack-project-2-wp86.onrender.com/api/campaigns/1/ -v
```

---

## 7. Get Dashboard Statistics

```bash
curl https://full-stack-project-2-wp86.onrender.com/api/campaigns/stats/
```

**With pretty JSON:**
```bash
curl https://full-stack-project-2-wp86.onrender.com/api/campaigns/stats/ | python -m json.tool
```

---

## 8. Convert Campaign Budget to Currencies

```bash
curl https://full-stack-project-2-wp86.onrender.com/api/campaigns/1/convert_budget/
```

**Replace `1` with actual campaign ID**

**With pretty JSON:**
```bash
curl https://full-stack-project-2-wp86.onrender.com/api/campaigns/1/convert_budget/ | python -m json.tool
```

---

## Complete Workflow Example

### Step 1: Create a Campaign
```bash
curl -X POST https://full-stack-project-2-wp86.onrender.com/api/campaigns/ \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Holiday Campaign 2024",
    "platform": "Meta",
    "budget": 7500.00,
    "status": "Active",
    "start_date": "2024-12-01",
    "end_date": "2024-12-31"
  }'
```

**Save the response to get the campaign ID (e.g., ID = 1)**

### Step 2: List All Campaigns
```bash
curl https://full-stack-project-2-wp86.onrender.com/api/campaigns/
```

### Step 3: Get Campaign Details
```bash
curl https://full-stack-project-2-wp86.onrender.com/api/campaigns/1/
```

### Step 4: Get Dashboard Stats
```bash
curl https://full-stack-project-2-wp86.onrender.com/api/campaigns/stats/
```

### Step 5: Convert Budget
```bash
curl https://full-stack-project-2-wp86.onrender.com/api/campaigns/1/convert_budget/
```

### Step 6: Update Campaign
```bash
curl -X PATCH https://full-stack-project-2-wp86.onrender.com/api/campaigns/1/ \
  -H "Content-Type: application/json" \
  -d '{"status":"Paused"}'
```

### Step 7: Delete Campaign
```bash
curl -X DELETE https://full-stack-project-2-wp86.onrender.com/api/campaigns/1/
```

---

## Windows PowerShell Format

If you're using PowerShell on Windows, use these formats:

### GET Request
```powershell
curl.exe https://full-stack-project-2-wp86.onrender.com/api/campaigns/
```

### POST Request
```powershell
curl.exe -X POST https://full-stack-project-2-wp86.onrender.com/api/campaigns/ `
  -H "Content-Type: application/json" `
  -d '{\"name\":\"Test Campaign\",\"platform\":\"Google Ads\",\"budget\":1000.00,\"status\":\"Active\",\"start_date\":\"2024-01-01\",\"end_date\":\"2024-12-31\"}'
```

**Note:** Use backticks (`) for line continuation in PowerShell, and escape quotes with `\"`

---

## Testing with Postman

You can also import these into Postman:

1. **Base URL:** `https://full-stack-project-2-wp86.onrender.com`
2. **Endpoints:**
   - GET `/api/campaigns/`
   - POST `/api/campaigns/`
   - GET `/api/campaigns/{id}/`
   - PUT `/api/campaigns/{id}/`
   - PATCH `/api/campaigns/{id}/`
   - DELETE `/api/campaigns/{id}/`
   - GET `/api/campaigns/stats/`
   - GET `/api/campaigns/{id}/convert_budget/`

---

## Quick Reference

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/campaigns/` | List all |
| POST | `/api/campaigns/` | Create |
| GET | `/api/campaigns/{id}/` | Get details |
| PUT | `/api/campaigns/{id}/` | Full update |
| PATCH | `/api/campaigns/{id}/` | Partial update |
| DELETE | `/api/campaigns/{id}/` | Delete |
| GET | `/api/campaigns/stats/` | Dashboard stats |
| GET | `/api/campaigns/{id}/convert_budget/` | Currency conversion |

---

## Tips

1. **Pretty JSON:** Add `| python -m json.tool` or `| jq` to format JSON output
2. **Verbose:** Add `-v` flag to see request/response headers
3. **Save Response:** Add `-o response.json` to save output to file
4. **Include Headers:** Add `-i` to include response headers in output

---

**All endpoints are ready to test!** 🚀
