# Screen Recording Script - Campaign Tracker Demo

A 3-5 minute script for demonstrating the Campaign Tracker System.

## Preparation (Before Recording)

1. **Setup**
   - Backend running and accessible
   - Frontend running and connected to backend
   - At least 3-5 sample campaigns created
   - Browser console open (to show no errors)

2. **Browser Setup**
   - Clear browser cache
   - Use incognito/private window (optional)
   - Full screen browser window
   - Zoom level: 100%

## Recording Script (3-5 minutes)

### Introduction (0:00 - 0:30)

**Script:**
> "Welcome to the Campaign Tracker System demo. This is a full-stack application built with Django REST Framework for the backend and Next.js for the frontend. It allows digital marketing agencies to manage their campaigns with full CRUD functionality, data visualization, and third-party API integration."

**Actions:**
- Show the home page with campaigns list
- Point out the clean, modern UI
- Mention the tech stack briefly

---

### Feature 1: CRUD Operations - Create (0:30 - 1:00)

**Script:**
> "Let me demonstrate the CRUD operations, starting with creating a new campaign."

**Actions:**
1. Click "New Campaign" button
2. Fill in the form:
   - Name: "Holiday Campaign 2024"
   - Platform: Select "Meta"
   - Budget: Enter "7500"
   - Status: Select "Active"
   - Start Date: Select a future date
   - End Date: Select a date after start date
3. Click "Create Campaign"
4. Show success (campaign appears in list)

**Script:**
> "As you can see, the campaign was created successfully and immediately appears in our campaigns list."

---

### Feature 2: CRUD Operations - Read & View Details (1:00 - 1:30)

**Script:**
> "Now let's view the campaign details and explore the currency conversion feature."

**Actions:**
1. Click on a campaign name or "View" button
2. Show campaign detail page
3. Point out all campaign information displayed
4. Scroll to "Currency Conversion" section
5. Click "Convert Budget" button
6. Show the currency conversions (USD, EUR, GBP, INR)
7. Point out exchange rates

**Script:**
> "Here we can see all campaign details, and I've integrated a currency exchange API that converts the campaign budget to multiple currencies using live exchange rates. This demonstrates our third-party API integration requirement."

---

### Feature 3: CRUD Operations - Update (1:30 - 2:00)

**Script:**
> "Let me show you how to update a campaign."

**Actions:**
1. Click "Edit Campaign" button
2. Change status from "Active" to "Paused"
3. Update budget to "8000"
4. Click "Save Changes"
5. Show updated campaign in detail view

**Script:**
> "The campaign has been updated successfully. Notice how the changes are immediately reflected."

---

### Feature 4: Dashboard with Data Visualization (2:00 - 3:00)

**Script:**
> "Now let's explore the dashboard, which features data visualization with charts."

**Actions:**
1. Navigate to Dashboard (click "Dashboard" in nav)
2. Point out the statistics cards:
   - Total Campaigns
   - Total Budget
   - Active Campaigns
   - Number of Platforms
3. Scroll to "Campaigns by Status" pie chart
4. Explain the chart: "This pie chart shows the distribution of campaigns by their status - Active, Paused, and Completed."
5. Scroll to "Budget by Platform" bar chart
6. Explain: "This bar chart shows the total budget allocated to each platform - Google Ads, Meta, LinkedIn, etc."

**Script:**
> "The dashboard provides real-time insights into campaign performance. All charts automatically update when campaigns are created, modified, or deleted."

**Actions:**
7. Go back to campaigns list
8. Create another campaign quickly (or delete one)
9. Return to dashboard
10. Show that charts have updated

**Script:**
> "As you can see, the charts automatically reflect the changes we just made."

---

### Feature 5: CRUD Operations - Delete (3:00 - 3:30)

**Script:**
> "Finally, let me demonstrate the delete functionality."

**Actions:**
1. Go back to campaigns list
2. Click "Delete" on a campaign
3. Confirm deletion in the dialog
4. Show campaign removed from list
5. Go to dashboard to show charts updated

**Script:**
> "The campaign has been deleted, and as expected, the dashboard statistics have updated accordingly."

---

### Feature 6: API Integration Recap (3:30 - 4:00)

**Script:**
> "Let me quickly recap the third-party API integration we saw earlier."

**Actions:**
1. Go to any campaign detail page
2. Show currency conversion section again
3. Click "Convert Budget"
4. Point out the live exchange rates

**Script:**
> "This feature integrates with a currency exchange API to provide real-time currency conversions. The API is called from the backend, ensuring secure API key management."

---

### Conclusion & Technical Highlights (4:00 - 4:30)

**Script:**
> "To summarize, this application demonstrates:
> 
> 1. **Full CRUD functionality** - Create, Read, Update, and Delete operations work seamlessly through both the UI and REST APIs
> 
> 2. **Data Visualization** - Interactive dashboard with pie charts and bar charts that update in real-time
> 
> 3. **Third-Party API Integration** - Currency exchange API integration for budget conversion
> 
> 4. **Production-Ready** - The application is fully deployed and functional in production environments
> 
> The backend is built with Django and Django REST Framework, using PostgreSQL for data persistence. The frontend is built with Next.js and TypeScript, featuring a modern, responsive UI. All code follows best practices and is ready for production deployment."

**Actions:**
- Show the application one more time
- Maybe show browser console (no errors)
- End with a clean view of the dashboard

---

## Tips for Recording

1. **Pacing**
   - Speak clearly and at a moderate pace
   - Pause briefly after each action
   - Don't rush through features

2. **Visual Clarity**
   - Use mouse highlighting when clicking
   - Zoom in on important elements if needed
   - Keep cursor movements smooth

3. **Error Handling**
   - If something doesn't work, show how errors are handled gracefully
   - This demonstrates good UX

4. **Transitions**
   - Use smooth transitions between pages
   - Don't click too fast
   - Let pages load completely

5. **Audio**
   - Record in a quiet environment
   - Use a good microphone
   - Test audio levels before recording

6. **Editing**
   - Trim any long loading times
   - Add text overlays for key points (optional)
   - Add background music (optional, keep it subtle)

---

## Alternative Shorter Version (3 minutes)

If you need a shorter version:

1. **Introduction** (0:00 - 0:20)
   - Quick intro and tech stack

2. **Create Campaign** (0:20 - 0:50)
   - Show form and create campaign

3. **Dashboard** (0:50 - 1:50)
   - Show statistics and charts
   - Explain visualization

4. **Currency Conversion** (1:50 - 2:20)
   - Show API integration

5. **Update & Delete** (2:20 - 2:50)
   - Quick update and delete

6. **Conclusion** (2:50 - 3:00)
   - Quick summary

---

## What to Highlight

✅ **Clean UI/UX** - Modern, professional interface
✅ **Full CRUD** - All operations working smoothly
✅ **Real-time Updates** - Charts update automatically
✅ **API Integration** - Third-party API working
✅ **Production Ready** - Deployed and functional
✅ **Error Handling** - Graceful error messages
✅ **Responsive Design** - Works on different screen sizes

---

## Post-Recording Checklist

- [ ] Video is clear and audible
- [ ] All features demonstrated
- [ ] No errors shown
- [ ] Timing is appropriate (3-5 minutes)
- [ ] Audio quality is good
- [ ] Visual quality is good
- [ ] Key points are clear
