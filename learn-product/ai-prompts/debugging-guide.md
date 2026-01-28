# Self-Service Debugging Guide

A comprehensive guide for product managers and non-technical testers to independently debug and diagnose issues when testing products.

## The Problem This Solves

Instead of:
1. Finding an issue ❌
2. Taking a screenshot 📸
3. Sending to developer 💬
4. Developer asks: "Can you check the Network tab?" 🤔
5. You: "What's that? What am I looking for?" 😰
6. Back and forth continues... ⏰

You'll be able to:
1. Find an issue ✅
2. Open DevTools 🔧
3. Identify: Is this frontend/backend/UI? 🎯
4. Gather relevant evidence 📊
5. Report with all needed info 📝
6. Save everyone time! ⚡

---

## Quick Reference Card

Print or save this for easy access while testing:

```
┌─────────────────────────────────────────────────────────┐
│         WHEN SOMETHING BREAKS, CHECK:                    │
├─────────────────────────────────────────────────────────┤
│ 1. CONSOLE TAB → Look for red errors                    │
│ 2. NETWORK TAB → Look for red/failed requests           │
│ 3. ELEMENTS TAB → Check if UI elements exist            │
├─────────────────────────────────────────────────────────┤
│         ERROR TYPE QUICK IDENTIFICATION:                 │
├─────────────────────────────────────────────────────────┤
│ Red errors in Console → Frontend JavaScript error       │
│ Red 4xx/5xx in Network → Backend API error              │
│ Nothing red but looks wrong → UI/CSS issue              │
│ Spinner forever → Network request stuck/failed          │
│ White screen → Critical frontend error                  │
└─────────────────────────────────────────────────────────┘
```

---

## 🎯 7 Essential Debugging Skills You'll Master

After reading this guide, you'll be able to:

### 1. ✅ Understand Every Column in Network Requests

**Where:** Network Tab → Main view

| Column | What It Tells You | How to Use It |
|--------|-------------------|---------------|
| **Name** | What was requested | Find the API call related to your issue |
| **Status** | HTTP response code | Red numbers (4xx/5xx) = errors |
| **Type** | Request category | Filter for `xhr`/`fetch` to see API calls only |
| **Size** | Data transferred | Very small on error = probably error message |
| **Time** | Request duration | >3 seconds = investigate in Timing tab |

**Quick Action:** Click column header to sort (e.g., sort by Time to find slowest requests)

### 2. ✅ Read the Timing Tab to Identify Backend Slowness

**Where:** Network Tab → Click request → Timing tab

**Key Metric: TTFB (Time To First Byte)**
- **What it is:** How long backend takes to start responding
- **Good:** <500ms
- **Slow:** 500ms - 1s
- **Very slow:** >1s (backend performance issue!)

**Quick Diagnosis:**
- TTFB is slow → Backend/database issue
- Download is slow → Large response or slow connection
- SSL is slow → Certificate/encryption overhead

### 3. ✅ Check Auth Tokens in Application Tab

**Where:** Application Tab → Storage section

**For Login Issues, Check:**

| Location | What to Look For | If Missing/Wrong |
|----------|------------------|------------------|
| **Cookies** | `auth_token`, `session_id`, `jwt` | User not authenticated |
| **Local Storage** | `authToken`, `token`, `access_token` | Session lost |
| **Cookie Expires** | Expiration date | Token expired = logged out |

**Quick Actions:**
- Check if token exists
- Check expiration date (in Cookies tab)
- Mask sensitive tokens before sharing screenshots

### 4. ✅ Force Hover States to Test Button Styles

**Where:** Elements Tab → Select button → Styles panel → `:hov` button

**How to Use:**
1. Inspect the button (right-click → Inspect)
2. In Styles panel, click `:hov` button
3. Check `:hover`, `:active`, `:focus` states
4. See how button styles change

**When to Use:**
- Button looks broken on hover/click
- Hover effects don't appear
- Focus state not visible for keyboard users
- Testing all button states without actually hovering

### 5. ✅ See the Box Model to Understand Spacing Issues

**Where:** Elements Tab → Select element → Layout panel (or Computed tab → Box Model)

**What to Check:**

```
┌─────────────────────────────┐
│     margin (outside)        │
│  ┌─────────────────────┐    │
│  │    border           │    │
│  │  ┌───────────────┐  │    │
│  │  │ padding (inside)│  │    │
│  │  │  ┌─────────┐  │  │    │
│  │  │  │ content │  │  │    │
│  │  │  └─────────┘  │  │    │
│  │  └───────────────┘  │    │
│  └─────────────────────┘    │
└─────────────────────────────┘
```

**Common Issues:**
- Too much space? → Check margin values
- Text too close to edges? → Check padding
- Element too wide? → Check padding + border + content width
- Can edit values by clicking them to test fixes!

### 6. ✅ Test on Mobile with Proper Device Simulation

**Where:** DevTools top-left → 📱 Device icon (or `Cmd+Shift+M`)

**Essential Checks:**

| Test | How to Check | What to Look For |
|------|--------------|------------------|
| **Layout** | Select device (iPhone, iPad) | No horizontal scroll, text readable |
| **Touch targets** | Inspect buttons | Minimum 44×44px (check box model) |
| **Breakpoints** | Resize width or select devices | Layout adapts at key widths |
| **Slow connection** | Network throttling → Slow 3G | Loading states, timeouts |
| **Touch interactions** | Click and drag | Swipe gestures work |

**Quick Test Devices:**
- iPhone SE (375×667) - Small phone
- iPhone 13 Pro (390×844) - Standard phone
- iPad Air (820×1180) - Tablet

### 7. ✅ Run Lighthouse Audits for Overall Quality Checks

**Where:** Lighthouse Tab (or >> → Lighthouse)

**What to Do:**
1. Click "Generate report"
2. Wait ~30 seconds
3. Review scores (green = good, yellow = needs work, red = poor)

**What It Checks:**
- **Performance** (90+) → Fast load times, responsive
- **Accessibility** (90+) → Usable by everyone
- **Best Practices** (90+) → Secure, modern code
- **SEO** (90+) → Search engine friendly

**When to Use:**
- Before major releases
- After performance improvements
- Regular health checks
- When users complain about speed

---

## 📚 How to Use This Guide

**First Time:** Read through the sections relevant to your issue using the "Quick Reference: Which Tab to Use When" table.

**During Testing:** Keep DevTools open, refer to the Quick Reference Card, and capture evidence as you go.

**Reporting Bugs:** Use the Bug Report Template at the end with all the evidence you gathered.

**Learning:** Try the Practice Exercises to build confidence without pressure.

---

## Opening Browser DevTools

| Browser | Method 1 | Method 2 | Method 3 |
|---------|----------|----------|----------|
| **Chrome** | `Cmd+Option+I` (Mac)<br>`F12` (Windows) | Right-click → Inspect | View → Developer → Developer Tools |
| **Firefox** | `Cmd+Option+I` (Mac)<br>`F12` (Windows) | Right-click → Inspect Element | Tools → Browser Tools → Web Developer Tools |
| **Safari** | `Cmd+Option+I`<br>(Enable in Preferences → Advanced) | Right-click → Inspect Element | Develop → Show Web Inspector |
| **Edge** | `F12` | Right-click → Inspect | ... → More tools → Developer tools |

**Pro Tip:** Keep DevTools open while testing! Open it BEFORE reproducing the issue so you don't miss any errors.

---

## Understanding DevTools Tabs

### 🎮 The Tabs You'll Use Most

```
┌──────────┬──────────┬──────────┬──────────┬──────────┐
│ Elements │ Console  │ Network  │ Sources  │ Application│
│   (UI)   │ (Errors) │  (APIs)  │  (Code)  │   (Data)  │
└──────────┴──────────┴──────────┴──────────┴──────────┘
```

| Tab | What It Shows | When to Use It |
|-----|---------------|----------------|
| **Console** | JavaScript errors, logs, warnings | First place to check when something breaks |
| **Network** | All requests to servers (APIs, images, etc.) | When data doesn't load or save |
| **Elements** | HTML structure and CSS styles | When UI looks wrong or is missing |
| **Application** | Cookies, localStorage, session data | When login issues or data persistence problems |
| **Sources** | Actual code files | Advanced debugging (usually skip this) |

---

## 🔴 1. Console Tab - Finding Frontend Errors

### What You'll See

The Console shows:
- ❌ **Errors** (red) - Something broke
- ⚠️ **Warnings** (yellow) - Something might be wrong
- ℹ️ **Info** (blue) - Just FYI messages
- 📝 **Logs** (gray) - Debug information

### Console Tab Sub-Features

#### Filter Bar (Top of Console)

```
┌────────────────────────────────────────────────────┐
│ [Default levels ▾] [Filter text...] [⚙️] [🚫]    │
└────────────────────────────────────────────────────┘
```

| Feature | What It Does | When to Use |
|---------|--------------|-------------|
| **Filter dropdown** | Show/hide Errors, Warnings, Info, Logs | Hide noise, focus on errors only |
| **Filter text box** | Search for specific text | Find errors mentioning "login" or "user" |
| **Settings (⚙️)** | Console preferences | Enable timestamps, preserve log |
| **Clear (🚫)** | Clear all console messages | Start fresh before reproducing issue |

**Pro Tip:** Type `-fetch` in filter box to hide all fetch-related messages!

#### Console Settings (Click ⚙️ icon)

| Setting | What It Does | Why Enable It |
|---------|--------------|---------------|
| **Preserve log** | Keep logs across page refreshes | Essential! Don't lose errors when page reloads |
| **Show timestamps** | Display time each message occurred | Track when errors happened in sequence |
| **Autocomplete from history** | Remember what you typed before | Faster debugging commands |
| **Group similar** | Collapse repeated messages | Reduce clutter |

**Must-Enable:** ✅ Preserve log, ✅ Show timestamps

#### Right-Click Options on Error Messages

| Option | What It Does | When to Use |
|--------|--------------|-------------|
| **Copy message** | Copy just the error text | Quick copy for bug reports |
| **Copy stack trace** | Copy the full error with file locations | Developers need this for debugging |
| **Save as...** | Save all console output to file | Long debugging session with many errors |
| **Search Google for...** | Search the error message | Learn what the error means |

### How to Read Console Errors

```javascript
❌ Uncaught TypeError: Cannot read property 'name' of undefined
    at handleSubmit (app.js:245)
    at onClick (button.js:12)
```

**Breaking this down:**

| Part | What It Means |
|------|---------------|
| `Uncaught TypeError` | **Error Type** - The code tried to do something impossible |
| `Cannot read property 'name' of undefined` | **What Broke** - Tried to access `name` on something that doesn't exist |
| `at handleSubmit (app.js:245)` | **Where** - File name and line number |
| `at onClick (button.js:12)` | **Stack Trace** - The chain of functions that led here |

### Common Console Errors & What They Mean

| Error Message | Plain English | Likely Cause |
|---------------|---------------|--------------|
| `Uncaught TypeError: Cannot read property 'X' of undefined` | Code tried to access data that doesn't exist | Backend didn't return expected data, or frontend bug |
| `404 Not Found` | Something couldn't be loaded | Broken link, missing file, or wrong URL |
| `CORS policy` | Server blocked the request | Backend needs to allow frontend to access it |
| `Uncaught ReferenceError: X is not defined` | Code references something that doesn't exist | Frontend code bug |
| `Failed to fetch` | Network request couldn't complete | API down, no internet, or wrong endpoint |
| `401 Unauthorized` | Not allowed to access this | Login expired or missing permissions |
| `500 Internal Server Error` | Server crashed | Backend bug |

### What to Capture

**Screenshot should include:**
1. ✅ The full error message (don't cut it off)
2. ✅ The file name and line number
3. ✅ The timestamp (when it happened)
4. ✅ Any red errors that appeared at the same time

**How to Copy:**
- Right-click the error → "Copy message" or "Save as..."
- Or select the text and copy it

---

## 🌐 2. Network Tab - Finding API Issues

### What You'll See

Every time your browser talks to a server, it appears here as a "request."

```
Name                    Status  Type    Size    Time
─────────────────────────────────────────────────────
login                   200     xhr     1.2kb   145ms
users/123              200     xhr     3.4kb   89ms
profile-pic.jpg        200     img     45kb    234ms
update-settings        500     xhr     234b    1.2s  ← ❌ ERROR
analytics              200     xhr     567b    45ms
```

### Understanding the Columns

| Column | What It Means | What to Look For |
|--------|---------------|------------------|
| **Name** | What was requested | Look for names related to the feature that broke |
| **Status** | Response code (see below) | Red numbers = problems |
| **Type** | Request type | `xhr` or `fetch` = API calls<br>`doc` = pages<br>`img` = images |
| **Size** | How much data | Very small on error = probably error message |
| **Time** | How long it took | Very long = slow/timeout |

### HTTP Status Codes Cheat Sheet

```
┌─────────────────────────────────────────────────────┐
│  2xx = ✅ SUCCESS                                    │
├─────────────────────────────────────────────────────┤
│  200 OK - Request worked                            │
│  201 Created - New resource created successfully    │
│  204 No Content - Success but no data to return     │
├─────────────────────────────────────────────────────┤
│  3xx = 🔀 REDIRECT                                   │
├─────────────────────────────────────────────────────┤
│  301/302 - Redirected to another URL                │
├─────────────────────────────────────────────────────┤
│  4xx = ❌ CLIENT ERROR (Frontend/User Problem)      │
├─────────────────────────────────────────────────────┤
│  400 Bad Request - Sent invalid data                │
│  401 Unauthorized - Not logged in                   │
│  403 Forbidden - Logged in but not allowed          │
│  404 Not Found - Endpoint doesn't exist             │
│  429 Too Many Requests - Rate limited               │
├─────────────────────────────────────────────────────┤
│  5xx = 🔥 SERVER ERROR (Backend Problem)            │
├─────────────────────────────────────────────────────┤
│  500 Internal Server Error - Backend crashed        │
│  502 Bad Gateway - Server communication failed      │
│  503 Service Unavailable - Server is down           │
│  504 Gateway Timeout - Request took too long        │
└─────────────────────────────────────────────────────┘
```

### Network Tab Top Controls

```
┌──────────────────────────────────────────────────────┐
│ [🔴] [🚫] [🔍] [⚙️] [No throttling ▾] [All ▾]      │
│                                                       │
│ Name         Status  Type    Size    Time    [...]   │
└──────────────────────────────────────────────────────┘
```

| Control | What It Does | When to Use |
|---------|--------------|-------------|
| **🔴 Record** | Start/stop recording requests | Usually keep ON |
| **🚫 Clear** | Clear all requests | Start fresh |
| **🔍 Filter** | Show/hide by search term | Find specific API calls |
| **⚙️ Settings** | Network preferences | Enable "Preserve log" |
| **Throttling** | Simulate slow internet | Test on slow connections |
| **Filter dropdown** | XHR, JS, CSS, Img, etc. | Show only API calls (XHR/Fetch) |

**Must-Enable in Settings (⚙️):**
- ✅ **Preserve log** - Keep requests across page navigation
- ✅ **Disable cache** - Always get fresh data (while DevTools is open)

### How to Inspect a Network Request

1. **Find the failed request** (it's red or has 4xx/5xx status)
2. **Click on it**
3. **A panel opens with tabs:**

```
┌───────────────────────────────────────────────────────┐
│ Headers | Payload | Preview | Response | Timing | ... │
├───────────────────────────────────────────────────────┤
│                                                        │
│  [Content shows here]                                  │
│                                                        │
└───────────────────────────────────────────────────────┘
```

### Deep Dive: Network Request Sub-Tabs

#### 1. Headers Tab

Shows metadata about the request and response.

```
General
────────
Request URL: https://api.example.com/users/123
Request Method: POST
Status Code: 500 Internal Server Error
Remote Address: 192.168.1.1:443

Response Headers
────────────────
content-type: application/json
date: Tue, 15 Jan 2024 10:30:00 GMT
server: nginx/1.18.0

Request Headers
───────────────
accept: application/json
authorization: Bearer eyJhbGci...
content-type: application/json
```

**What to Look At:**

| Section | What to Check | Why It Matters | Example |
|---------|---------------|----------------|---------|
| **General → Request URL** | Is the URL correct? | Typos cause 404s | Should be `/api/users` not `/api/user` |
| **General → Request Method** | GET/POST/PUT/DELETE? | Wrong method = error | Can't POST to read-only endpoint |
| **General → Status Code** | 2xx/4xx/5xx? | Determines error type | 500 = backend bug |
| **Request Headers → authorization** | Is auth token present? | Missing = 401 error | `Bearer eyJ...` should exist |
| **Request Headers → content-type** | What format you're sending | Must match what API expects | `application/json` for JSON data |
| **Response Headers → content-type** | What format backend returned | Mismatch causes parse errors | Expected JSON but got HTML? |
| **Response Headers → location** | Where redirect goes | For 301/302 redirects | New URL after redirect |

**Common Issues to Spot:**

| What You See | What It Means | Action |
|-------------|---------------|--------|
| No `authorization` header on API call | Not logged in | Check Application tab for auth token |
| `content-type: text/html` when expecting JSON | Server returned error page | Check Response tab for actual error |
| Request URL has typo | Frontend bug | Report the wrong URL |
| `access-control-allow-origin` missing | CORS error | Backend needs to add CORS headers |

#### 2. Payload Tab (or "Request" tab in some browsers)

Shows the data you sent to the server.

**Only appears for:** POST, PUT, PATCH requests (not GET/DELETE)

```json
{
  "email": "test@example.com",
  "password": "********",
  "remember": true
}
```

**What to Look At:**

| Check | Why | Example Issue |
|-------|-----|---------------|
| **Are required fields present?** | Missing fields cause 400 errors | Forgot to send `email` field |
| **Are values in correct format?** | Wrong format rejected | Email without `@` |
| **Is data what you expect?** | Frontend might be sending wrong values | Sending `userId: null` |
| **File size (for uploads)** | Too large = timeout | 50MB file on slow connection |

**When to Capture:**
- ✅ Any 400 error (Bad Request) - shows what invalid data you sent
- ✅ Any unexpected backend error - helps devs see what triggered it
- ✅ Data not saving correctly - verify frontend sent the right data

#### 3. Preview Tab

**Formatted, interactive view** of the response.

- For JSON: Shows expandable tree structure
- For HTML: Shows rendered page
- For Images: Shows the image
- For PDFs: Shows the PDF

**When to Use:**
- ✅ **Quick look at API response** - easier to read than raw JSON
- ✅ **Expand nested data** - click arrows to explore deep objects
- ✅ **Check if expected data is there** - scan for fields you need

**Example:**
```json
{
  "user": {
    "id": 123,
    "name": "John Doe",
    "email": "john@example.com",
    "profile": {
      "avatar": "...",
      "bio": "..."
    }
  },
  "error": null ← ✅ No error!
}
```

vs. error response:
```json
{
  "user": null,
  "error": {
    "code": "USER_NOT_FOUND",
    "message": "User with ID 123 does not exist"  ← ❌ Here's the problem!
  }
}
```

#### 4. Response Tab

**Raw response data** exactly as sent by the server.

**When to Use:**
- ✅ Copy the exact error message for bug reports
- ✅ Preview tab isn't working (malformed JSON)
- ✅ Developer asks for "raw response"

**Difference from Preview:**
- **Preview** = Formatted for humans, interactive
- **Response** = Raw text, copy-pasteable

**What to Capture:**
- ✅ For 4xx/5xx errors: Copy the entire response
- ✅ For unexpected data: Copy to show what backend actually returned

#### 5. Timing Tab

Shows **how long each phase** of the request took.

```
┌─────────────────────────────────────────┐
│ Queueing           0.5ms                │
│ Stalled            2.1ms                │
│ DNS Lookup         15ms                 │
│ Initial Connection 45ms                 │
│ SSL               120ms                 │
│ Request sent       0.8ms                │
│ Waiting (TTFB)    850ms  ← SLOW!        │
│ Content Download   35ms                 │
│                                          │
│ Total:            1068ms                │
└─────────────────────────────────────────┘
```

**What Each Phase Means:**

| Phase | What's Happening | If Slow, Means... |
|-------|------------------|-------------------|
| **Queueing** | Waiting for browser to start | Too many requests at once |
| **Stalled** | Waiting for connection | Browser connection limit |
| **DNS Lookup** | Converting domain to IP | DNS issues (rare) |
| **Initial Connection** | Establishing TCP connection | Network latency, server far away |
| **SSL** | SSL handshake | Certificate issues, encryption overhead |
| **Request sent** | Uploading request data | Large payload or slow upload |
| **Waiting (TTFB)** | Backend processing | **Backend is slow!** Most important metric |
| **Content Download** | Downloading response | Large response or slow connection |

**When to Check:**

| Symptom | Look For | Likely Issue |
|---------|----------|--------------|
| **Infinite loading spinner** | Total time >10s | Backend timeout |
| **Slow page loads** | TTFB >1s | Slow backend/database |
| **"Pending" requests** | Stalled >5s | Too many concurrent requests |
| **Upload fails** | Request sent >30s | File too large |

**What to Capture:**
- 📸 Screenshot of Timing tab if request takes >3 seconds
- 📝 Note which phase is slowest

#### 6. Cookies Tab

Shows cookies sent with this request.

```
Name          Value              Domain          Path    Expires
────────────────────────────────────────────────────────────────
session_id    abc123xyz          .example.com    /       Session
auth_token    eyJhbGci...       .example.com    /       2024-01-20
tracking_id   xyz789            .example.com    /       2025-01-15
```

**When to Check:**
- ✅ Login issues (is session cookie present?)
- ✅ "Remember me" not working (is cookie persistent?)
- ✅ Multi-domain issues (cookie domain wrong?)

#### 7. Initiator Tab

Shows **what triggered** this request.

```
Initiator
─────────
app.js:245      ← This line of code made the request
  ↳ handleSubmit (button.js:12)
    ↳ onClick (main.js:89)
```

**When to Use:**
- ✅ Understanding request flow (why did this fire?)
- ✅ Unwanted requests (who's calling this API?)
- ✅ Developer debugging (trace back to source)

### Network Tab Right-Click Menu

Right-click any request for these options:

| Option | What It Does | When to Use |
|--------|--------------|-------------|
| **Copy → Copy URL** | Copy just the URL | Share API endpoint |
| **Copy → Copy as cURL** | Copy as command-line request | **Best for bug reports!** Developers can replay it |
| **Copy → Copy as fetch** | Copy as JavaScript code | Test in Console |
| **Copy → Copy response** | Copy response body | Share error message |
| **Replay XHR** | Resend the request | Test if error persists |
| **Block request URL** | Prevent this request | Test how app handles missing data |
| **Open in Sources panel** | View the code that made request | Advanced debugging |

### What to Capture for Network Errors

**For each failed request, capture:**

1. **General tab (Headers → General):**
   ```
   ✅ Request URL: https://api.example.com/users/123
   ✅ Request Method: POST
   ✅ Status Code: 500 Internal Server Error
   ```

2. **Request Headers (if relevant):**
   ```
   ✅ Authorization: Bearer eyJ... (is auth token present?)
   ✅ Content-Type: application/json
   ```

3. **Request Payload (what you sent):**
   ```json
   ✅ {
     "name": "John",
     "email": "test@example.com"
   }
   ```

4. **Response (what backend returned):**
   ```json
   ✅ {
     "error": "Email already exists",
     "code": "DUPLICATE_EMAIL"
   }
   ```

**Pro Tip:** Right-click the request → "Copy" → "Copy as cURL" to copy the entire request in a format developers love!

---

## 🎨 3. Elements Tab - Finding UI Issues

### What You'll See

The HTML structure of the page:

```html
<body>
  <div class="container">
    <header>
      <h1>Dashboard</h1>
      <button class="btn-primary">Save</button>
    </header>
  </div>
</body>
```

### When to Use This

- ✅ Button/text is there in code but not visible
- ✅ Element is wrong size or position
- ✅ Wrong colors or fonts
- ✅ Element is overlapped by something else

### How to Inspect an Element

**Method 1: Inspect Tool**
1. Click the "Select element" icon (top-left of DevTools) 🔍
2. Hover over elements on the page
3. Click the element you want to inspect

**Method 2: Right-Click**
1. Right-click the element directly on the page
2. Select "Inspect" or "Inspect Element"

### What to Look For

**In the HTML panel (left side):**

```html
<button class="btn-primary" disabled>
  Submit
</button>
```

| Check | What It Tells You |
|-------|-------------------|
| Is the element there? | If you can't find it in the HTML, it didn't render |
| Is it hidden? | Look for `display: none` or `visibility: hidden` |
| Is it disabled? | Look for `disabled` attribute |
| What's the text content? | Is the text actually there? |

**In the Styles panel (right side):**

```css
.btn-primary {
  display: none; ← ❌ This is why it's hidden!
  color: #ffffff;
  background: #007bff;
}
```

| Check | What It Tells You |
|-------|-------------------|
| `display: none` | Element is hidden |
| `visibility: hidden` | Element is invisible but takes up space |
| `opacity: 0` | Element is transparent |
| `z-index: -1` | Element is behind other elements |
| Strikethrough styles | Style is being overridden by another rule |

### Common UI Issues & How to Identify

| Symptom | What to Check | Likely Cause |
|---------|---------------|--------------|
| **Button is there but can't click it** | Check for `pointer-events: none` or element overlapping | CSS issue or modal overlay |
| **Text is cut off** | Check `overflow: hidden` or fixed `height` | Layout CSS issue |
| **Element doesn't exist** | Search for it in Elements tab (Cmd+F) | Frontend didn't render it (check Console for errors) |
| **Wrong color/font** | Check Styles panel for computed values | CSS not applied or wrong class |
| **Element in wrong position** | Check `position`, `top`, `left`, `margin` | Layout CSS issue |

### Elements Tab Right-Side Sub-Panels

When you select an element in Elements tab, the right side shows detailed panels:

```
┌──────────────────────────────────────────────┐
│ Styles | Computed | Layout | Event Listeners │
│ ─────────────────────────────────────────────│
│                                               │
│  [Panel content here]                         │
└──────────────────────────────────────────────┘
```

#### 1. Styles Panel

Shows **CSS rules** applied to the selected element.

```css
element.style {
  color: red;  ← Inline styles (highest priority)
}

.btn-primary {
  background: blue;
  color: white;
  padding: 10px;
  display: none;  ← ❌ This hides it!
}

button {
  cursor: pointer;
  border: none;  ← Line-through = overridden
}
```

**What to Look At:**

| Thing | What It Means | What to Do |
|-------|---------------|------------|
| **`element.style`** | Inline styles (highest priority) | These override everything |
| **Line-through text** | Style is overridden by something else | Scroll up to find the winning rule |
| **Grayed-out property** | Invalid CSS or not applicable | Typo or doesn't work on this element |
| **`:hov` checkbox** | Force hover/active/focus states | Test hover styles without hovering |
| **`.cls` button** | Add/remove classes live | Test how element looks with different classes |
| **Filter box** | Search for specific properties | Find all `color` or `display` rules |

**Common Things to Check:**

| Check | Why | How |
|-------|-----|-----|
| **`display: none`** | Element is hidden | Search for "display" in filter box |
| **`visibility: hidden`** | Element is invisible | Search for "visibility" |
| **`opacity: 0`** | Element is transparent | Search for "opacity" |
| **`pointer-events: none`** | Can't click it | Search for "pointer-events" |
| **`z-index: -1`** | Behind other elements | Search for "z-index" |
| **`position: absolute` with offscreen values** | Moved off screen | Check `top`, `left`, `right`, `bottom` |

**Force Element State (`:hov` button):**

Click `:hov` to force states:
- `:hover` - See hover styles
- `:active` - See click/press styles
- `:focus` - See keyboard focus styles
- `:visited` - See visited link styles

**When to Use:** Button looks fine normally but breaks on hover/click

**Live Edit CSS:**
- Click any property value to edit it
- Changes apply immediately
- Helps understand what CSS is causing the issue
- ⚠️ Changes are temporary (lost on refresh)

#### 2. Computed Panel

Shows **final calculated values** for all CSS properties.

```
┌─────────────────────────────────┐
│ [Filter properties]             │
├─────────────────────────────────┤
│ background-color: rgb(0,0,255)  │
│ color: rgb(255,255,255)         │
│ display: none                   │
│ font-size: 16px                 │
│ height: 40px                    │
│ margin-top: 20px                │
│ padding: 10px 20px              │
│ width: 120px                    │
│ z-index: auto                   │
└─────────────────────────────────┘
```

**Difference from Styles:**
- **Styles** = All the CSS rules (including overridden ones)
- **Computed** = The actual final values that are applied

**When to Use:**

| Scenario | Why Computed is Better |
|----------|------------------------|
| **"What color is this actually?"** | Shows computed RGB/hex value |
| **"How wide is this?"** | Shows calculated width (not just CSS) |
| **"Why is there space?"** | Shows computed margin/padding |
| **"What's the actual font size?"** | Shows inherited + calculated size |

**Pro Tips:**
- Check **`display`** property first if element is missing
- Check **`width`** and **`height`** if element is collapsed
- Check **`margin`** and **`padding`** if spacing looks wrong
- Click arrow next to value to see which CSS rule set it

#### 3. Layout Panel (or "Box Model")

Shows the **box model** - how spacing works.

```
┌─────────────────────────────────────┐
│           margin: 20                │
│   ┌─────────────────────────────┐   │
│   │      border: 2              │   │
│   │   ┌──────────────────────┐  │   │
│   │   │   padding: 10        │  │   │
│   │   │  ┌───────────────┐   │  │   │
│   │   │  │   120 x 40    │   │  │   │  ← Content size
│   │   │  └───────────────┘   │  │   │
│   │   └──────────────────────┘  │   │
│   └─────────────────────────────┘   │
└─────────────────────────────────────┘

Total width = margin + border + padding + content = 164px
```

**What Each Layer Means:**

| Layer | What It Is | When to Check |
|-------|------------|---------------|
| **Content (center)** | Actual element size | Element too small/large? |
| **Padding** | Space inside element | Text too close to edges? |
| **Border** | Element border | Border unexpectedly thick? |
| **Margin** | Space outside element | Too much space between elements? |

**Common Issues to Spot:**

| Symptom | Look For | Fix |
|---------|----------|-----|
| **Element too wide** | Padding + border adding unexpected width | Reduce padding or use `box-sizing: border-box` |
| **Too much space between elements** | Large margins | Reduce margin |
| **Element collapsed (0 height)** | No content or padding | Add min-height or padding |
| **Overlapping elements** | Negative margins | Check for `margin: -10px` |

**You Can Edit Values:**
- Click any number in the box model
- Change it to see effect immediately
- Helps figure out right spacing

#### 4. Event Listeners Panel

Shows **JavaScript events** attached to the element.

```
click
  ├─ handler1 @ app.js:245
  └─ handler2 @ button.js:12

mouseenter
  └─ handler @ hover.js:89

keydown
  └─ handler @ keyboard.js:34
```

**When to Use:**

| Scenario | What to Check |
|----------|---------------|
| **Button doesn't respond to clicks** | Is there a `click` listener? |
| **Hover doesn't work** | Is there a `mouseenter`/`mouseover` listener? |
| **Keyboard shortcut doesn't work** | Is there a `keydown`/`keypress` listener? |
| **Form doesn't submit** | Is there a `submit` listener? |

**What Each Column Means:**

| Column | Info |
|--------|------|
| **Event type** | click, mouseenter, keydown, etc. |
| **handler** | Function name that runs |
| **@ file:line** | Where the code is |
| **useCapture** | Event bubbling (advanced) |

**Testing:**
- If listener is there but doesn't work → Check Console for JavaScript errors
- If listener is missing → Frontend bug, event not attached

#### 5. Properties Panel

Shows **all JavaScript properties** of the element (advanced).

```
button
├─ className: "btn-primary disabled"
├─ disabled: true  ← ❌ That's why you can't click it!
├─ innerHTML: "Submit"
├─ offsetHeight: 40
├─ offsetWidth: 120
├─ onclick: function()
└─ style: CSSStyleDeclaration {...}
```

**When to Use:**
- ✅ Check if `disabled: true` (can't click)
- ✅ Check if `hidden: true` (hidden)
- ✅ Check actual computed dimensions
- ✅ Advanced debugging (usually skip this)

#### 6. Accessibility Panel

Shows **accessibility information** (a11y).

```
┌──────────────────────────────────┐
│ Name: "Submit"                   │
│ Role: button                     │
│ Keyboard-focusable: Yes          │
│ Contrast ratio: 4.5:1 ✅         │
└──────────────────────────────────┘
```

**What to Check:**

| Property | What It Means | If Wrong |
|----------|---------------|----------|
| **Name** | What screen readers announce | Missing = inaccessible |
| **Role** | What type of element it is | Wrong = confusing to screen readers |
| **Keyboard-focusable** | Can you tab to it? | No = keyboard users can't access |
| **Contrast ratio** | Text vs background contrast | <4.5 = hard to read |

**When to Use:**
- ✅ Accessibility audit
- ✅ Contrast issues (text hard to read)
- ✅ Screen reader testing
- ✅ Keyboard navigation issues

### Elements Tab Top Controls

```
┌─────────────────────────────────────────────┐
│ [🔍] [📱] [🎨] [:hov] [.cls] [⚙️]          │
└─────────────────────────────────────────────┘
```

| Icon | What It Does | When to Use |
|------|--------------|-------------|
| **🔍 Inspect** | Select element by clicking on page | Finding the element to inspect |
| **📱 Device mode** | Toggle mobile view | Test responsive design |
| **🎨 Color picker** | Pick colors from page | Check exact color values |
| **:hov** | Force element states | Test hover/active/focus styles |
| **.cls** | Add/remove classes | Test with different classes |

### Element Context Menu (Right-Click in Elements Tab)

| Option | What It Does | When to Use |
|--------|--------------|-------------|
| **Edit as HTML** | Edit element's HTML directly | Test how changes look |
| **Copy → Copy element** | Copy HTML | Share element structure |
| **Copy → Copy selector** | Copy CSS selector | Tell developer which element |
| **Delete element** | Remove element temporarily | See page without it |
| **Hide element** | Hide element temporarily | See if this element is causing issues |
| **Scroll into view** | Scroll page to show element | Element is off-screen |
| **Capture node screenshot** | Screenshot just this element | Document specific UI component |

---

## 🗂️ 4. Application Tab - Finding Data Issues

### What You'll See

Storage areas where the app keeps data:

```
Application
├── 📦 Storage
│   ├── Local Storage      ← Permanent data
│   ├── Session Storage    ← Temporary data (cleared on close)
│   ├── IndexedDB         ← Large structured data
│   └── Cookies           ← Small pieces of data
├── 🗄️ Cache
│   ├── Cache Storage     ← Service worker cache
│   └── Application Cache ← Old caching (deprecated)
├── 🔧 Service Workers    ← Background scripts
├── 📱 Manifest          ← PWA info
└── 🔒 Trust Tokens      ← Privacy features
```

### When to Use This

- ✅ Login issues (check for auth tokens)
- ✅ Data persists when it shouldn't (or vice versa)
- ✅ "Remember me" not working
- ✅ Settings not saving
- ✅ Offline functionality not working
- ✅ Data showing old/stale content

### Deep Dive: Application Sub-Sections

#### 1. Local Storage

**What:** Permanent storage (until manually cleared or code deletes it)
**Capacity:** ~5-10MB per domain
**Persists:** Yes, survives browser restarts

```
Key                    Value                              Size
──────────────────────────────────────────────────────────────
authToken              eyJhbGciOiJIUzI1...               256 B
userId                 12345                              5 B
theme                  dark                               4 B
lastVisited            2024-01-15T10:30:00Z              20 B
preferences            {"notifications":true,"lang":"en"}  42 B
```

**What to Look For:**

| Key Pattern | What It Usually Stores | When to Check |
|-------------|------------------------|---------------|
| `token`, `authToken`, `jwt`, `access_token` | Authentication | Login issues, "logged out unexpectedly" |
| `userId`, `user`, `currentUser` | User data | Profile not loading |
| `theme`, `settings`, `preferences` | App settings | Settings not saving |
| `cart`, `checkout` | E-commerce data | Cart emptying unexpectedly |
| `lastVisited`, `cache_*` | App state/cache | App showing old data |

**Common Issues:**

| Symptom | Check | Likely Cause |
|---------|-------|--------------|
| **Logged out on refresh** | Is auth token present? | Token expired or cleared |
| **Settings don't persist** | Check for settings key | Not saving to localStorage |
| **Old data showing** | Check timestamp values | Cache not invalidating |
| **Storage full error** | Total size > 5MB | Too much data stored |

**Actions You Can Take:**
- Right-click key → **Delete** (remove one item)
- Right-click → **Clear All** (wipe all localStorage)
- Double-click value → **Edit** (change value live)

**When to Capture:**
- 📸 Screenshot of localStorage when auth issues occur
- ⚠️ **Mask sensitive data** (tokens, passwords, personal info)

#### 2. Session Storage

**What:** Temporary storage (cleared when tab closes)
**Capacity:** ~5-10MB per domain
**Persists:** No, cleared when tab/window closes

```
Key                Value
─────────────────────────────────
tempFormData       {"email":"test@..."}
currentStep        3
wizardProgress     "payment"
```

**Difference from Local Storage:**

| | Local Storage | Session Storage |
|---|---------------|-----------------|
| **Persists on close** | Yes | No |
| **Shared across tabs** | Yes | No (each tab has own) |
| **Use case** | Long-term data | Temporary session data |

**When to Check:**
- ✅ Multi-step forms losing data on refresh
- ✅ Wizard/onboarding flow issues
- ✅ Tab-specific state problems

#### 3. Cookies

**What:** Small data pieces sent with every request
**Capacity:** ~4KB per cookie
**Persists:** Depends on expiration date

```
Name         Value        Domain          Path   Expires              HttpOnly  Secure  SameSite
───────────────────────────────────────────────────────────────────────────────────────────────
session_id   abc123       .example.com    /      2024-01-20 10:30    ✓         ✓       Lax
auth_token   eyJ...       .example.com    /      Session             ✓         ✓       Strict
tracking     xyz789       .example.com    /      2025-01-15 00:00    ✗         ✗       None
```

**What Each Column Means:**

| Column | What It Is | Why It Matters |
|--------|------------|----------------|
| **Name** | Cookie identifier | What it's called in code |
| **Value** | Actual data stored | The auth token, session ID, etc. |
| **Domain** | Which domain can access | `.example.com` = all subdomains |
| **Path** | Which paths can access | `/` = entire site, `/app` = just /app |
| **Expires** | When it's deleted | "Session" = deleted when browser closes |
| **HttpOnly** | Only server can access | If ✓, JavaScript can't read it (more secure) |
| **Secure** | Only sent over HTTPS | If ✓, won't send over HTTP |
| **SameSite** | When to send cookie | Strict/Lax/None controls CSRF protection |

**Common Issues:**

| Symptom | Check | Likely Cause |
|---------|-------|--------------|
| **Logged out randomly** | Expires = "Session" | Cookie deleted when browser closes |
| **Logged out on refresh** | Check Expires date | Cookie expired |
| **Cookie not being sent** | Check Domain and Path | Wrong domain/path setting |
| **Login works on www but not on subdomain** | Check Domain | Domain doesn't include subdomain |
| **CORS errors** | Check SameSite | SameSite blocking cross-site requests |

**Actions You Can Take:**
- Right-click cookie → **Delete** (remove one cookie)
- Right-click → **Clear all** (delete all cookies for domain)
- Double-click value → **Edit** (change cookie value)
- **Filter box** at top → Search for specific cookies

**When to Capture:**
- 📸 Screenshot of cookies for login issues
- 📝 Note expiration dates if "logged out unexpectedly"
- ⚠️ **Mask sensitive tokens** before sharing

#### 4. IndexedDB

**What:** Database for storing large amounts of structured data
**Capacity:** Can be gigabytes (requests user permission)
**Persists:** Yes, like localStorage but much larger

```
IndexedDB
└── my-app-db (v1)
    ├── users (3 records)
    ├── messages (128 records)
    └── files (15 records)
```

**When to Check:**
- ✅ Offline-first apps (data should sync when online)
- ✅ Apps with large datasets (email, documents, media)
- ✅ Progressive Web Apps (PWAs)
- ✅ "Data not syncing" issues

**What to Look At:**
- Number of records (is data being saved?)
- Click into a record to see its structure
- Check if expected data is there

**Common Issues:**

| Symptom | Check | Likely Cause |
|---------|-------|--------------|
| **No offline access** | Is database empty? | Data not being cached |
| **Old data showing** | Check record timestamps | Not syncing with server |
| **Quota exceeded error** | Database size | Too much data stored |

#### 5. Cache Storage (Service Worker Cache)

**What:** Files cached by service workers for offline access
**Use Case:** PWAs, offline functionality

```
Cache Storage
├── v1-static (45 files, 2.3 MB)
│   ├── index.html
│   ├── app.js
│   ├── styles.css
│   └── ...
└── v1-dynamic (12 files, 890 KB)
    ├── /api/users
    ├── /api/posts
    └── ...
```

**When to Check:**
- ✅ App not updating (showing old version)
- ✅ Offline mode not working
- ✅ PWA issues
- ✅ Getting stale data

**Common Issues:**

| Symptom | Check | Solution |
|---------|-------|----------|
| **Old code running** | Check cache for old files | Clear cache storage |
| **Offline doesn't work** | Is cache populated? | Check service worker registration |
| **Changes not appearing** | Are new files cached? | Hard refresh or clear cache |

**Actions:**
- Right-click cache → **Delete** (remove entire cache)
- Click into cache → Right-click item → **Delete** (remove one file)
- **Bypass for network** in Network tab to skip cache

#### 6. Service Workers

**What:** Background scripts that handle caching, push notifications, offline functionality

```
Service Workers
└── https://example.com/
    Status: Activated
    Version: sw.js (2024-01-15 10:30)
    [Update] [Unregister] [Push]
```

**Status Values:**

| Status | What It Means |
|--------|---------------|
| **Installing** | Being set up |
| **Activated** | Running and active |
| **Redundant** | Old version, replaced |
| **Error** | Failed to install ❌ |

**When to Check:**
- ✅ Offline functionality broken
- ✅ Push notifications not working
- ✅ App not updating
- ✅ PWA issues

**Common Issues:**

| Symptom | Check | Solution |
|---------|-------|----------|
| **App not updating** | Old service worker active | Click "Update" or "Unregister" |
| **Offline broken** | Status = Error | Check Console for error |
| **Push notifications fail** | Service worker not registered | Check registration code |

**Actions:**
- **Update** - Force update to new version
- **Unregister** - Remove service worker (requires page refresh to reinstall)
- **Skip waiting** - Activate new version immediately

#### 7. Storage Overview

Shows total storage used across all types.

```
┌──────────────────────────────────────────┐
│  Storage Usage                            │
├──────────────────────────────────────────┤
│  Local Storage:        245 KB            │
│  Session Storage:       12 KB            │
│  IndexedDB:            3.2 MB            │
│  Cache Storage:        15.8 MB           │
│  Cookies:              8 KB              │
│  ─────────────────────────────           │
│  Total:                19.3 MB / 50 MB   │
│                                           │
│  [Clear site data]                       │
└──────────────────────────────────────────┘
```

**When to Check:**
- ✅ "Quota exceeded" errors
- ✅ Understanding what's using space
- ✅ Need to clear all data at once

**Actions:**
- **Clear site data** button - Wipes EVERYTHING (use carefully!)
- Shows breakdown by storage type

### Application Tab Pro Tips

#### Clear All Data for Testing

**Application tab → Storage (left sidebar) → Clear site data**

Clears:
- ✅ Local Storage
- ✅ Session Storage
- ✅ IndexedDB
- ✅ Cookies
- ✅ Cache Storage

**When to Use:** Start fresh, test first-time user experience

#### Simulate Different Storage States

- **Test quota exceeded:** Fill localStorage with large data
- **Test token expiration:** Edit token to expired value
- **Test missing auth:** Delete auth token
- **Test old data:** Edit timestamp values

#### Security Check

Look for sensitive data that shouldn't be in localStorage:
- ❌ Passwords (should never be stored!)
- ❌ Credit card numbers
- ❌ Unencrypted personal data
- ⚠️ Tokens should be in HttpOnly cookies (more secure than localStorage)

---

## 💾 5. Sources Tab - Code and Debugging (Advanced)

**Skip this section if you're not technical** - This is for developers, but good to know it exists.

### What You'll See

```
Sources
├── Page
│   ├── example.com
│   │   ├── app.js
│   │   ├── components/
│   │   └── utils/
├── Filesystem (if workspace added)
├── Overrides (for testing local changes)
└── Snippets (saved code snippets)
```

### When Developers Use This

- Setting breakpoints (pause code execution)
- Step through code line by line
- View variable values during execution
- Edit code and test changes live

### What You Might Need It For

**Scenario: Developer asks "Can you check the value of this variable?"**

1. Open Sources tab
2. Press `Cmd+P` (Mac) or `Ctrl+P` (Windows)
3. Type file name they mentioned
4. They'll guide you from there

**When to Capture:**
- 📸 Screenshot if developer asks for specific file content
- 🎥 Screen recording of steps if behavior is complex

---

## ⚡ 6. Performance Tab - Speed Issues

**Use when:** Pages are slow, animations are janky, or users complain about performance.

### What You'll See

After recording, you'll see a timeline showing:
- Loading phases
- JavaScript execution
- Rendering time
- User interactions

```
┌────────────────────────────────────────────┐
│ [🔴 Record] [↻ Reload & Record] [🗑️]      │
├────────────────────────────────────────────┤
│  Timeline (shows bars of activity)         │
│  ████████░░░░░████░░░░░░░██████░░░░░      │
│  Loading  JS   Render  JS  Render          │
│                                             │
│  FPS: 60 ────────────────────────────      │
│                                             │
│  CPU: ████░░░░░░░░░████░░░░░░░░░░░        │
└────────────────────────────────────────────┘
```

### How to Use It

1. **Open Performance tab**
2. **Click record button (🔴)**
3. **Perform the slow action** (load page, scroll, click button)
4. **Click stop button**
5. **Look at the timeline**

### What to Look For

| Indicator | What to Check | Problem If... |
|-----------|---------------|---------------|
| **FPS (Frames per second)** | Smooth = 60fps | Drops below 30fps = janky |
| **Long yellow bars** | JavaScript taking long | >50ms = blocks page |
| **Long purple bars** | Rendering/painting | >16ms = causes frame drops |
| **Red triangles** | Performance warnings | Click for details |
| **Large gaps** | Network waiting | Slow API or images |

### Common Issues

| Symptom | Look For | Meaning |
|---------|----------|---------|
| **Page load slow** | Waterfall at start | See which resources take longest |
| **Scrolling janky** | Frame rate drops during scroll | Too much JavaScript during scroll |
| **Animation stutters** | FPS drops below 60 | Rendering too complex |
| **Click delay** | Long yellow bar after click | JavaScript blocking UI |

### What to Capture

- 📸 Screenshot of performance timeline
- 📝 Note FPS during slow period
- 📝 Note which actions cause slowdown

**Pro Tip:** Look for "Long Tasks" (>50ms) - these freeze the UI

---

## 🧠 7. Memory Tab - Memory Leaks (Advanced)

**Use when:** App gets slower over time, or browser crashes.

### What It Shows

Memory usage over time - helps find memory leaks.

```
┌────────────────────────────────────────┐
│ Heap snapshot                          │
│ - See what's using memory right now    │
│                                         │
│ Allocation timeline                    │
│ - See memory over time                 │
│                                         │
│ Allocation sampling                    │
│ - Which functions allocate memory      │
└────────────────────────────────────────┘
```

### When to Use

- ✅ Tab gets slower the longer it's open
- ✅ Browser crashes after using app for a while
- ✅ Memory usage keeps growing
- ✅ Developer asks for heap snapshot

### Simple Memory Check

1. **Open Memory tab**
2. **Take heap snapshot** (select it and click "Take snapshot")
3. **Use the app for a while**
4. **Take another snapshot**
5. **Compare snapshots** - memory should not grow indefinitely

**What to Report:**
- 📈 "Memory grows from 50MB to 500MB over 10 minutes"
- 📸 Screenshots of memory usage over time

**Usually:** Let developers handle the details of memory profiling

---

## 🔒 8. Security Tab - HTTPS and Certificate Issues

### What You'll See

```
┌────────────────────────────────────────┐
│ ✅ This page is secure (HTTPS)         │
│                                         │
│ Certificate                             │
│ - Valid from: 2024-01-01               │
│ - Valid to: 2025-01-01                 │
│ - Issued by: Let's Encrypt             │
│                                         │
│ Connection                              │
│ - TLS 1.3                               │
│ - Modern cipher suite                   │
└────────────────────────────────────────┘
```

### When to Check

- ✅ "Not secure" warning in address bar
- ✅ Mixed content warnings (HTTP on HTTPS page)
- ✅ Certificate errors
- ✅ Login issues related to security

### Common Issues

| Warning | What It Means | Action |
|---------|---------------|--------|
| **"Not secure"** | Page is HTTP not HTTPS | Don't enter sensitive data |
| **"Mixed content"** | HTTPS page loading HTTP resources | Some features may be blocked |
| **Certificate error** | SSL certificate invalid | Site might be compromised or misconfigured |
| **Certificate expired** | Old certificate | Site needs to renew certificate |

### What to Capture

- 📸 Screenshot of security warnings
- 📝 Certificate details if asked
- 📝 Which resources are mixed content

---

## 🌐 9. Lighthouse Tab - Overall Quality Audit

**Built into Chrome DevTools** - Runs automated tests.

### What It Tests

```
┌─────────────────────────────────┐
│ Performance    🟢 95            │
│ Accessibility  🟡 78            │
│ Best Practices 🟢 92            │
│ SEO           🟢 100            │
│ PWA           🔴 45             │
└─────────────────────────────────┘
```

### How to Use It

1. **Open Lighthouse tab** (might be under >> more tabs)
2. **Select categories** to test
3. **Select device** (Mobile or Desktop)
4. **Click "Generate report"**
5. **Wait for analysis** (~30 seconds)
6. **Review scores and recommendations**

### What Each Category Checks

| Category | What It Measures | Use When |
|----------|------------------|----------|
| **Performance** | Load speed, responsiveness | Page feels slow |
| **Accessibility** | Can everyone use this? | Testing for disabilities |
| **Best Practices** | Security, modern standards | General health check |
| **SEO** | Search engine optimization | Marketing cares about search ranking |
| **PWA** | Progressive Web App features | Offline capability, install-ability |

### Color Codes

| Color | Score | Meaning |
|-------|-------|---------|
| 🟢 Green | 90-100 | Good |
| 🟡 Yellow | 50-89 | Needs improvement |
| 🔴 Red | 0-49 | Poor |

### What to Capture

- 📸 Screenshot of all scores
- 📋 Key issues from each section
- 📝 Specific failing items (click "View report" for details)

**Best for:** Quick overall health check of a page

---

## 📱 10. Device Mode / Responsive Testing

### How to Access

Click the **📱 device icon** at top-left of DevTools (or press `Cmd+Shift+M` / `Ctrl+Shift+M`)

### What You'll See

```
┌────────────────────────────────────────────────┐
│ [iPhone 13 Pro ▾] [↻] [⚙️] [75% ▾]             │
├────────────────────────────────────────────────┤
│  ┌──────────────────────────────┐              │
│  │                               │              │
│  │     [Mobile view of site]     │              │
│  │                               │              │
│  └──────────────────────────────┘              │
│         390 x 844 (portrait)                    │
└────────────────────────────────────────────────┘
```

### Device Mode Controls

| Control | What It Does | When to Use |
|---------|--------------|-------------|
| **Device dropdown** | Select preset device (iPhone, iPad, etc.) | Test on specific device |
| **Dimensions** | Set custom width × height | Test specific breakpoints |
| **Rotate button** | Switch portrait ↔ landscape | Test both orientations |
| **Throttling** | Simulate slow network/CPU | Test on slow connections |
| **Zoom** | Change viewport scale | See how page scales |
| **Show media queries** | Highlight breakpoints | See where design changes |

### Preset Devices

Common devices available:

```
Phones:
├── iPhone SE (375 × 667)
├── iPhone 12/13 Pro (390 × 844)
├── iPhone 14 Pro Max (430 × 932)
├── Samsung Galaxy S20 (360 × 800)
└── Pixel 5 (393 × 851)

Tablets:
├── iPad Mini (768 × 1024)
├── iPad Air (820 × 1180)
└── iPad Pro (1024 × 1366)

Other:
└── Responsive (custom size)
```

### What to Test in Device Mode

#### 1. Layout Issues

| Check | What to Look For |
|-------|------------------|
| **Does layout break?** | Overlapping elements, cut-off text |
| **Is text readable?** | Font size too small (<16px) |
| **Do images scale?** | Stretched or pixelated images |
| **Horizontal scroll?** | Should not scroll sideways (usually a bug) |

#### 2. Touch Targets

| Check | Requirement |
|-------|-------------|
| **Button size** | Minimum 44×44px (Apple) or 48×48px (Android) |
| **Spacing** | 8px between tap targets |
| **Clickable area** | Large enough to tap with thumb |

**How to Check:**
1. Hover over button/link in Elements tab
2. Look at box model dimensions
3. Should be at least 44×44px

#### 3. Breakpoints

**Show Media Queries:**
1. Click **⚙️** (settings) in device toolbar
2. Check "Show media queries"
3. Colored bars appear showing breakpoints

```
┌────────────────────────────────────────┐
│ [Blue bar: 0-640px] [Green: 641-1024] │
└────────────────────────────────────────┘
```

**Test at each breakpoint:**
- Resize to trigger each media query
- Check layout changes are intentional
- Look for broken states between breakpoints

#### 4. Network Throttling

**Simulate slow connections:**

| Profile | Speed | Use Case |
|---------|-------|----------|
| **Online** | Full speed | Normal testing |
| **Fast 3G** | 1.6 Mbps | Slower mobile networks |
| **Slow 3G** | 400 Kbps | Very slow connections |
| **Offline** | No connection | Test offline functionality |

**What to Test:**
- ✅ Do images load progressively?
- ✅ Are loading states shown?
- ✅ Does app handle timeouts gracefully?
- ✅ Is there offline messaging?

#### 5. CPU Throttling

**Simulate slow devices:**

| Throttle | Use Case |
|----------|----------|
| **No throttling** | Modern devices |
| **4x slowdown** | Budget phones |
| **6x slowdown** | Very old devices |

**What to Test:**
- ✅ Do animations still feel smooth?
- ✅ Does app respond to clicks quickly?
- ✅ Are long-running scripts a problem?

### Device Mode Settings (⚙️)

Click the settings icon in device toolbar:

| Setting | What It Does | Why Enable |
|---------|--------------|------------|
| **Show media queries** | Display breakpoint bars | Visualize responsive design |
| **Show rulers** | Add pixel rulers | Measure element sizes |
| **Show device frame** | Show phone bezel | Realistic device preview |
| **Add custom device** | Create your own preset | Test specific dimensions |

### Common Mobile Issues to Look For

| Issue | How to Spot | How to Check |
|-------|-------------|--------------|
| **Text too small** | Hard to read at 100% zoom | Should be ≥16px |
| **Buttons too small** | Hard to tap accurately | Should be ≥44×44px |
| **Horizontal scroll** | Page wider than screen | Check for fixed-width elements |
| **Viewport not set** | Page looks zoomed out | Check for viewport meta tag |
| **Hover effects on mobile** | Hover doesn't work on touch | Need touch alternatives |
| **Modal closes when scrolling** | Touch events misconfigured | Test scrolling in modals |

### What to Capture for Mobile Bugs

- 📸 Screenshot at specific device size (include device name)
- 📝 Device dimensions (e.g., "iPhone 13 Pro - 390×844")
- 📝 Orientation (portrait or landscape)
- 📝 Network throttling setting if relevant
- 🎥 Video of touch interactions if gestures don't work

### Touch Simulation

In device mode, mouse clicks simulate touch events:
- **Click** = Tap
- **Click and drag** = Swipe
- **Long click** = Long press

**Test:**
- ✅ Swipe gestures (carousels, galleries)
- ✅ Long press menus
- ✅ Pull-to-refresh
- ✅ Pinch zoom (if allowed)

### Orientation Testing

**Switch between portrait and landscape:**
1. Click rotate button (🔄)
2. Check layout adapts correctly
3. Look for:
   - Broken layouts
   - Disappearing content
   - Incorrect media queries

---

## 🎨 Quick Reference: Which Tab to Use When

Use this table to quickly decide which DevTools tab to open:

| Symptom | Open This Tab | Look For |
|---------|---------------|----------|
| **Button doesn't work** | Console | Red JavaScript errors |
| **Data doesn't load** | Network | Failed requests (4xx/5xx) |
| **Infinite loading** | Network | Pending requests, timeouts |
| **Element not visible** | Elements | `display: none`, hidden styles |
| **Wrong spacing/size** | Elements → Layout | Box model (margin, padding) |
| **Wrong colors/fonts** | Elements → Styles | CSS rules |
| **Can't click element** | Elements → Styles | `pointer-events: none`, overlapping |
| **Logged out randomly** | Application → Cookies | Expired or missing auth cookie |
| **Settings don't save** | Application → Local Storage | Check if data is being stored |
| **Old content showing** | Application → Cache | Stale cache |
| **Page is slow** | Performance | FPS drops, long tasks |
| **Memory growing** | Memory | Heap snapshots |
| **Mobile layout broken** | Device Mode | Responsive breakpoints |
| **Touch target too small** | Device Mode + Elements | Button dimensions <44px |
| **HTTPS warning** | Security | Certificate issues |
| **Overall health check** | Lighthouse | All categories |

---

## 🔧 DevTools Global Settings

Click **⚙️ Settings** (or press F1 in DevTools) to access global preferences:

### Appearance Settings

| Setting | Recommendation | Why |
|---------|----------------|-----|
| **Theme** | Dark/Light | Your preference |
| **Panel layout** | Auto | Adjusts to screen size |
| **Color format** | Hex | Most common format |
| **Show rulers** | On | Measure element sizes |

### Console Settings

| Setting | Recommendation | Why |
|---------|----------------|-----|
| **Preserve log** | ✅ ON | Don't lose errors on refresh |
| **Show timestamps** | ✅ ON | Know when errors occurred |
| **Group similar** | ✅ ON | Reduce console clutter |
| **Autocomplete** | ✅ ON | Faster typing |

### Network Settings

| Setting | Recommendation | Why |
|---------|----------------|-----|
| **Preserve log** | ✅ ON | Keep requests across navigation |
| **Disable cache** | ON while testing | Always get fresh files |
| **Color-code requests** | ✅ ON | Easier to scan |
| **Large request rows** | ON | More readable |

### Sources Settings

| Setting | Recommendation | Why |
|---------|----------------|-----|
| **Enable JavaScript** | ✅ ON | Unless testing without JS |
| **Search in anonymous** | OFF | Less noise in search |
| **Automatically reveal files** | ON | Easier navigation |

### Shortcuts

Press **?** in DevTools to see all keyboard shortcuts!

**Most Useful:**

| Action | Shortcut (Mac) | Shortcut (Windows) |
|--------|----------------|---------------------|
| **Open DevTools** | `Cmd+Option+I` | `F12` |
| **Toggle device mode** | `Cmd+Shift+M` | `Ctrl+Shift+M` |
| **Open command menu** | `Cmd+Shift+P` | `Ctrl+Shift+P` |
| **Search all files** | `Cmd+Option+F` | `Ctrl+Shift+F` |
| **Reload page** | `Cmd+R` | `Ctrl+R` |
| **Hard reload (clear cache)** | `Cmd+Shift+R` | `Ctrl+Shift+R` |
| **Toggle console** | `Esc` | `Esc` |
| **Focus filter** | `Cmd+F` | `Ctrl+F` |

---

## 🔍 Debugging Decision Tree

Use this flowchart to determine what to check:

```
                   Something broke!
                         |
         ┌───────────────┴───────────────┐
         │                               │
    UI looks wrong              Feature doesn't work
         │                               │
         │                    ┌──────────┴──────────┐
         │                    │                     │
         v                Nothing         Shows error/
   Elements Tab          happens         crashes
         |                    │                     │
    Check:                    │                     │
    • Is element there?       │                     v
    • Is it hidden?           v              Console Tab
    • Wrong styles?      Network Tab               |
                              |              Check for red
                         Check for:              errors
                         • Failed requests          |
                         • 4xx/5xx errors      If JavaScript
                         • Stuck requests          error:
                              |               FRONTEND ISSUE
                         If API error:             |
                         • Check Response     If mentions API:
                         • Check Payload      BACKEND ISSUE
                              |
                    ┌─────────┴─────────┐
                    │                   │
                 4xx code           5xx code
                    │                   │
              CLIENT ERROR         SERVER ERROR
                    │                   │
                Frontend           Backend
                  issue               issue
```

---

## 🎯 Quick Diagnosis Guide

### Scenario 1: Button doesn't work when clicked

**Step-by-step:**
1. ✅ Open **Console** tab
2. ✅ Click the button again
3. ✅ Look for new red errors

**If you see an error:**
→ **Frontend JavaScript issue**
📸 Capture: Full console error + screenshot of button

**If no error:**
4. ✅ Open **Network** tab
5. ✅ Click the button again
6. ✅ Look for new requests (they appear at the bottom)

**If you see a failed request (red):**
→ **Backend API issue**
📸 Capture: Network request details (URL, status, response)

**If no network request appears:**
→ **Event handler not attached or button disabled**
📸 Capture: Inspect element, check for `disabled` attribute

---

### Scenario 2: Data doesn't load (blank page, empty list, etc.)

**Step-by-step:**
1. ✅ Open **Network** tab BEFORE loading the page
2. ✅ Refresh the page
3. ✅ Look for requests related to the missing data

**If you see failed requests (red):**
4. ✅ Click on the failed request
5. ✅ Check the **Response** tab

**If it says 401 Unauthorized:**
→ **Login expired or missing authentication**
📸 Capture: Network request + Application tab (check for auth token)

**If it says 404 Not Found:**
→ **API endpoint doesn't exist or wrong URL**
📸 Capture: Request URL from Network tab

**If it says 500:**
→ **Backend crashed**
📸 Capture: Request details + Response (error message)

**If all requests are green (200):**
6. ✅ Check **Console** tab for JavaScript errors
→ **Frontend rendering issue**
📸 Capture: Console errors

---

### Scenario 3: Infinite loading spinner

**Step-by-step:**
1. ✅ Open **Network** tab
2. ✅ Look for requests that are:
   - Still "pending" (not finished)
   - Taking a very long time (>10 seconds)

**If you see pending requests:**
→ **API timeout or network issue**
📸 Capture: Network tab showing pending request + Timing tab

**If no pending requests:**
3. ✅ Check **Console** tab
→ **Frontend didn't handle loading state properly**
📸 Capture: Console + video of the loading spinner

---

### Scenario 4: Error message appears

**Step-by-step:**
1. ✅ Read the error message carefully
2. ✅ Open **Network** tab
3. ✅ Find the request that happened right before the error

**Check the status code:**
- `400` → You sent invalid data (check **Payload** tab)
- `401` → Not logged in (check **Application** tab for auth token)
- `403` → Logged in but not allowed (permissions issue)
- `404` → Wrong URL (check **Request URL**)
- `429` → Too many requests (rate limited)
- `500` → Backend crashed (check **Response** for details)

📸 Capture: Screenshot of error message + Network request details

---

### Scenario 5: Page is completely blank (white screen)

**Step-by-step:**
1. ✅ Open **Console** tab immediately
2. ✅ Look for red errors at the top

**If you see "Uncaught Error" or similar:**
→ **Critical frontend JavaScript error - app crashed**
📸 Capture: Full console with all errors

**If no errors:**
3. ✅ Open **Network** tab
4. ✅ Look for the main HTML request (usually first in the list)

**If it's 404 or 500:**
→ **Page doesn't exist or server issue**
📸 Capture: Network tab showing failed HTML request

---

## 📸 Evidence Gathering Checklist

When you find an issue, gather this info:

### ✅ Always Capture

- [ ] **Screenshot of the issue** (what you see on the page)
- [ ] **Full URL** (from address bar)
- [ ] **Time it happened** (or timestamp from DevTools)
- [ ] **What you did right before** (steps to reproduce)

### ✅ If Console Has Errors

- [ ] Screenshot of **full error message** (don't crop it!)
- [ ] Copy the error text (right-click → Copy)
- [ ] Note the **file name and line number**

### ✅ If Network Request Failed

- [ ] Request **URL** (from Headers → General)
- [ ] **Status code** (e.g., 404, 500)
- [ ] Request **Method** (GET, POST, PUT, DELETE)
- [ ] **Response** body (what the server returned)
- [ ] **Payload** (what you sent to server) - if it's a POST/PUT
- [ ] Screenshot of the Network tab showing the failed request

### ✅ If UI Issue

- [ ] Screenshot of **Inspect Element** showing the HTML
- [ ] Screenshot of **Styles panel** showing computed styles
- [ ] Note if element is hidden, disabled, or has pointer-events disabled

### ✅ If Login/Session Issue

- [ ] Check **Application** tab → Local Storage
- [ ] Check **Application** tab → Cookies
- [ ] Screenshot showing auth token (mask if sensitive!)
- [ ] Check if token is expired (look at expiration date in cookies)

---

## 🎓 Error Classification Made Simple

Use this table to quickly categorize any issue:

| Where You Found It | What You See | Issue Type | Who Fixes It |
|-------------------|--------------|------------|--------------|
| **Console** | Red JavaScript error | Frontend | Frontend Dev |
| **Network** | 4xx status code (400, 401, 403, 404) | API Request Issue | Could be Frontend (wrong request) or Backend (wrong endpoint) |
| **Network** | 5xx status code (500, 502, 503) | Backend | Backend Dev |
| **Elements** | Element hidden or wrong styles | UI/CSS | Frontend Dev |
| **Elements** | Element doesn't exist in HTML | Frontend Rendering | Frontend Dev |
| **Application** | Missing or expired auth token | Authentication | Backend or Frontend depending on flow |
| **Neither** | Nothing errors but looks wrong | UI/UX Design | Designer or Frontend Dev |

---

## 🚀 Advanced Tips

### Filter Network Requests

In Network tab, use the filter bar:

```
Type filters:  [All] [XHR] [JS] [CSS] [Img] [Media] [Font] [Doc]
```

- Click **XHR** or **Fetch** to see only API calls
- This hides images, fonts, and other noise

### Search All Files

- Open Console or Network tab
- Press `Cmd+F` (Mac) or `Ctrl+F` (Windows)
- Search for text like error codes, user IDs, or API endpoints

### Preserve Log

In Console and Network tabs:

- [ ] Check "Preserve log" checkbox

This keeps logs even when the page refreshes or redirects!

### Clear Console/Network

- Click the "🚫" (clear) icon to start fresh
- Useful when you want to reproduce the issue cleanly

### Slow Network Simulation

In Network tab:

- Click dropdown that says "No throttling"
- Select "Slow 3G" or "Fast 3G"

Test how your app handles slow connections!

### Copy Request as cURL

In Network tab:

1. Right-click a request
2. Copy → Copy as cURL
3. Paste in your bug report

This lets developers replay the exact request!

---

## 📋 Bug Report Template

When you report issues, use this template:

```markdown
## Issue Description
[Brief summary of what went wrong]

## Steps to Reproduce
1. Go to [URL]
2. Click on [button]
3. Fill in [field] with [value]
4. Observe [issue]

## Expected Behavior
[What should happen]

## Actual Behavior
[What actually happens]

## Environment
- Browser: [Chrome 120, Safari 17, etc.]
- Device: [Mac, Windows, iPhone, etc.]
- Timestamp: [2024-01-15 14:30:00]
- URL: [Full URL where issue occurs]

## Evidence

### Screenshots
[Attach screenshots here]

### Console Errors (if any)
```
[Paste console error text here]
```

### Network Errors (if any)
- Request URL: `[URL]`
- Status Code: `[e.g., 500]`
- Request Method: `[GET/POST/etc.]`
- Response:
```json
{
  "error": "..."
}
```

### Issue Type
- [ ] Frontend JavaScript Error
- [ ] Backend API Error (4xx)
- [ ] Backend Server Error (5xx)
- [ ] UI/CSS Issue
- [ ] Authentication Issue
- [ ] Other: ___________

## Additional Context
[Any other relevant information]
```

---

## 🎯 Practice Exercises

To get comfortable with debugging, try these exercises:

### Exercise 1: Intentional Errors
1. Open any website
2. Open Console
3. Type: `throw new Error("Testing error display")`
4. Press Enter
5. Observe how errors appear

### Exercise 2: Inspect Network
1. Open Network tab
2. Visit any website
3. Identify:
   - Which requests loaded images?
   - Which requests were API calls (XHR)?
   - Which request was the slowest?

### Exercise 3: Edit Live CSS
1. Right-click any element → Inspect
2. In Styles panel, change colors/sizes
3. See changes live
4. This helps understand how CSS affects appearance

### Exercise 4: Simulate Mobile
1. Open DevTools
2. Click "Toggle Device Toolbar" (phone icon)
3. Select a device (iPhone, iPad, etc.)
4. Test how the site looks on mobile

---

## 🔗 Helpful Resources

### Official Documentation
- [Chrome DevTools Docs](https://developer.chrome.com/docs/devtools/)
- [Firefox Developer Tools](https://firefox-source-docs.mozilla.org/devtools-user/)
- [Safari Web Inspector](https://developer.apple.com/safari/tools/)

### HTTP Status Codes
- [httpstatuses.com](https://httpstatuses.com/) - Full list with explanations
- [http.cat](https://http.cat/) - Status codes with cat pictures!

### Video Tutorials
- Search YouTube: "Chrome DevTools Tutorial"
- Search YouTube: "How to use browser inspector"

---

## 💡 Key Takeaways

1. **Keep DevTools open while testing** - Catch errors as they happen
2. **Console = Frontend errors**, **Network = Backend errors**
3. **Status codes tell the story**: 2xx = good, 4xx = client issue, 5xx = server issue
4. **Copy, don't describe** - Copy error messages, don't paraphrase
5. **"Preserve log"** checkbox is your friend
6. **Right-click → Inspect** is how you start investigating UI issues
7. **You don't need to understand code** to gather useful debugging info

---

## 🎉 You're Now a Debugging Detective!

Remember: Your goal isn't to fix the issue yourself (unless you want to learn that too!). Your goal is to:

1. ✅ **Identify** where the problem is (frontend/backend/UI)
2. ✅ **Capture** the right evidence
3. ✅ **Report** with enough detail for developers to fix it quickly

This saves everyone time and makes you a more effective tester!

---

## Quick Reference: The 3-Second Check

Next time something breaks, do this:

1. **Open DevTools** (F12)
2. **Check Console** - Red errors? → Frontend issue
3. **Check Network** - Red requests? → Backend issue
4. **Capture evidence** - Screenshot + copy error text
5. **Report** - Use the bug report template

That's it! You're equipped to debug like a pro. 🎉
