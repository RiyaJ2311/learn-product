# Step 3: Content Scripts - Interacting with Web Pages

## What You'll Build

An extension that **highlights all links** on any webpage with a custom color.

## What You'll Learn

- How content scripts inject into web pages
- DOM manipulation from extensions
- How to target specific websites
- Content script isolation

---

## What Are Content Scripts?

**Content scripts** are JavaScript files that run in the context of web pages.

### Key Characteristics

| Property | Value |
|----------|-------|
| **Runs in** | Web pages (not the extension) |
| **Can access** | Page DOM, limited Chrome APIs |
| **Cannot access** | Page's JavaScript variables, most Chrome APIs |
| **Purpose** | Read/modify page content |

### The Isolation Model

```
┌─────────────────────────────────────────────────┐
│  WEB PAGE (e.g., google.com)                   │
│                                                 │
│  ┌───────────────────┐  ┌──────────────────┐   │
│  │  Page's JavaScript│  │ Content Script   │   │
│  │  - window.foo     │  │ - Your extension │   │
│  │  - Not accessible │  │ - Can see DOM    │   │
│  │    to you         │  │ - Isolated scope │   │
│  └───────────────────┘  └──────────────────┘   │
│           │                      │              │
│           └──────┬───────────────┘              │
│                  │                              │
│           ┌──────▼────────┐                     │
│           │   Shared DOM  │                     │
│           │   <html>...   │                     │
│           └───────────────┘                     │
└─────────────────────────────────────────────────┘
```

Both can see and modify the DOM, but have separate JavaScript contexts.

---

## Project: Link Highlighter

### File Structure

```
step-03-link-highlighter/
├── manifest.json
├── content.js
├── popup.html
└── popup.js
```

---

## File 1: manifest.json

```json
{
  "manifest_version": 3,
  "name": "Link Highlighter",
  "version": "1.0",
  "description": "Highlights all links on a webpage",

  "action": {
    "default_popup": "popup.html"
  },

  "content_scripts": [
    {
      "matches": ["<all_urls>"],
      "js": ["content.js"],
      "run_at": "document_idle"
    }
  ],

  "permissions": [
    "activeTab"
  ]
}
```

### New Fields Explained

| Field | Purpose |
|-------|---------|
| `content_scripts` | Array of content scripts to inject |
| `matches` | Which URLs to run on (`<all_urls>` = everywhere) |
| `js` | JavaScript files to inject |
| `run_at` | When to inject: `document_start`, `document_end`, or `document_idle` |
| `permissions` | `activeTab` lets us access the current tab when user clicks icon |

### URL Matching Patterns

```javascript
// Examples:
"matches": ["<all_urls>"]                    // Every website
"matches": ["https://*/*"]                   // All HTTPS sites
"matches": ["https://github.com/*"]          // Only GitHub
"matches": ["https://*.google.com/*"]        // All Google domains
"matches": ["https://twitter.com/*",
            "https://x.com/*"]               // Multiple sites
```

---

## File 2: content.js

```javascript
// This script runs on every webpage

console.log('Link Highlighter loaded!');

// Function to highlight all links
function highlightLinks() {
  // Get all <a> tags on the page
  const links = document.querySelectorAll('a');

  console.log(`Found ${links.length} links`);

  // Loop through each link
  links.forEach(link => {
    // Add a background color
    link.style.backgroundColor = '#ffeb3b';
    link.style.padding = '2px 4px';
    link.style.borderRadius = '3px';
  });
}

// Run when the page loads
highlightLinks();

// Listen for messages from the popup
chrome.runtime.onMessage.addListener(function(request, sender, sendResponse) {
  if (request.action === 'highlight') {
    highlightLinks();
    sendResponse({status: 'Links highlighted!'});
  } else if (request.action === 'count') {
    const linkCount = document.querySelectorAll('a').length;
    sendResponse({count: linkCount});
  }
});
```

### Understanding the Code

**Line by line:**

```javascript
console.log('Link Highlighter loaded!');
```
- Console logs from content scripts appear in the **page's console** (F12), not the extension popup console

```javascript
const links = document.querySelectorAll('a');
```
- `document` refers to the web page's DOM
- Content scripts can use all standard DOM APIs

```javascript
links.forEach(link => {
  link.style.backgroundColor = '#ffeb3b';
});
```
- Direct style manipulation
- This modifies the actual page

```javascript
chrome.runtime.onMessage.addListener(...)
```
- Listen for messages from other parts of the extension
- Content scripts can use limited Chrome APIs

---

## File 3: popup.html

```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <style>
    body {
      width: 300px;
      padding: 20px;
      font-family: Arial, sans-serif;
    }
    button {
      background: #4285f4;
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 4px;
      cursor: pointer;
      width: 100%;
      margin-bottom: 10px;
    }
    button:hover {
      background: #357ae8;
    }
    #result {
      margin-top: 10px;
      padding: 10px;
      background: #f0f0f0;
      border-radius: 4px;
      min-height: 20px;
    }
  </style>
</head>
<body>
  <h2>Link Highlighter</h2>
  <p>Control the links on this page:</p>

  <button id="highlightBtn">Highlight Links</button>
  <button id="countBtn">Count Links</button>

  <div id="result"></div>

  <script src="popup.js"></script>
</body>
</html>
```

---

## File 4: popup.js

```javascript
document.addEventListener('DOMContentLoaded', function() {
  const highlightBtn = document.getElementById('highlightBtn');
  const countBtn = document.getElementById('countBtn');
  const result = document.getElementById('result');

  // Highlight button clicked
  highlightBtn.addEventListener('click', function() {
    // Send message to content script
    chrome.tabs.query({active: true, currentWindow: true}, function(tabs) {
      chrome.tabs.sendMessage(tabs[0].id, {action: 'highlight'}, function(response) {
        result.textContent = response.status;
      });
    });
  });

  // Count button clicked
  countBtn.addEventListener('click', function() {
    chrome.tabs.query({active: true, currentWindow: true}, function(tabs) {
      chrome.tabs.sendMessage(tabs[0].id, {action: 'count'}, function(response) {
        result.textContent = `Found ${response.count} links on this page!`;
      });
    });
  });
});
```

### Understanding Message Passing

**Step 1: Get the current tab**
```javascript
chrome.tabs.query({active: true, currentWindow: true}, function(tabs) {
  // tabs[0] is the current tab
});
```

**Step 2: Send message to that tab**
```javascript
chrome.tabs.sendMessage(
  tabs[0].id,                    // Which tab
  {action: 'highlight'},         // The message
  function(response) {           // Response handler
    console.log(response);
  }
);
```

**Step 3: Content script receives and responds**
```javascript
chrome.runtime.onMessage.addListener(function(request, sender, sendResponse) {
  if (request.action === 'highlight') {
    // Do something
    sendResponse({status: 'Done!'});
  }
});
```

---

## Testing Your Extension

### Load It

1. Go to `chrome://extensions`
2. Load unpacked → select `step-03-link-highlighter` folder
3. Visit any website (e.g., google.com)

### Test It

1. Open the extension popup
2. Click "Count Links" - should show number of links
3. Click "Highlight Links" - links should turn yellow

### Debug It

**To see content script console logs:**
- Open the page's DevTools (F12)
- Check Console tab
- You'll see "Link Highlighter loaded!" and link counts

**To see popup console logs:**
- Right-click extension icon → "Inspect popup"
- This opens DevTools for the popup

---

## Common Patterns

### Pattern 1: Wait for Page Load

```javascript
// Run when DOM is ready
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', highlightLinks);
} else {
  highlightLinks();
}
```

### Pattern 2: Observe Dynamic Content

```javascript
// Watch for new elements added to page
const observer = new MutationObserver(function(mutations) {
  mutations.forEach(function(mutation) {
    mutation.addedNodes.forEach(function(node) {
      if (node.tagName === 'A') {
        // New link added, highlight it
        highlightLink(node);
      }
    });
  });
});

observer.observe(document.body, {
  childList: true,
  subtree: true
});
```

### Pattern 3: Inject CSS Instead of JS

```json
// manifest.json
{
  "content_scripts": [{
    "matches": ["<all_urls>"],
    "css": ["content.css"],
    "js": ["content.js"]
  }]
}
```

```css
/* content.css */
a {
  background-color: #ffeb3b !important;
  padding: 2px 4px !important;
  border-radius: 3px !important;
}
```

---

## Content Script Limitations

### ✅ CAN Access

- Page DOM
- Standard JavaScript APIs
- Limited Chrome APIs:
  - `chrome.runtime`
  - `chrome.storage`
  - `chrome.i18n`

### ❌ CANNOT Access

- Page's JavaScript variables/functions
- Most Chrome APIs (use background script instead)
- `window` object from the page

### Example of Isolation

```javascript
// On the page (in page's JavaScript):
window.myData = "secret";

// In content script:
console.log(window.myData); // undefined! Different window object
```

To access page variables, you need to inject a `<script>` tag:

```javascript
const script = document.createElement('script');
script.textContent = 'console.log(window.myData);';
document.head.appendChild(script);
```

But this is generally **not recommended** - keep content scripts isolated.

---

## Challenges

### Challenge 1: Color Picker
Add a color picker to the popup so users can choose highlight color.

**Hint:** Use `chrome.storage` to save the color preference.

### Challenge 2: Toggle Highlight
Add a toggle button to turn highlighting on/off.

**Hint:** Track state and add/remove styles accordingly.

### Challenge 3: Specific Sites Only
Modify `matches` to only run on specific websites (e.g., news sites).

### Challenge 4: Highlight Search Results
On Google search pages, highlight all search result titles in a different color.

**Hint:** Use selector `h3` or inspect Google's current HTML structure.

---

## Common Issues & Solutions

| Issue | Cause | Solution |
|-------|-------|----------|
| "Cannot read property of null" | Script runs before DOM loads | Use `document_idle` in manifest |
| Changes disappear on page navigation | SPA (Single Page App) doesn't reload | Use MutationObserver |
| Can't access page variables | Content script isolation | Inject a `<script>` tag (not recommended) |
| Script doesn't run on HTTPS sites | `matches` pattern too narrow | Use `https://*/*` or `<all_urls>` |

---

## Security Note

Content scripts run with the **extension's privileges**, not the page's. Be careful:

- **Don't** use `eval()` on page data
- **Don't** trust page input without validation
- **Don't** expose sensitive extension data to the page

---

## What You Learned

✓ How to inject content scripts into web pages
✓ DOM manipulation from extensions
✓ Message passing between popup and content scripts
✓ URL matching patterns
✓ Content script isolation model
✓ Debugging content scripts

## Next Step

Move to **Step 4** to learn about Background Scripts and build a more complex extension that persists data and responds to browser events.

---

## Quick Reference: Content Script APIs

```javascript
// Send message to background/popup
chrome.runtime.sendMessage({data: "hello"}, function(response) {
  console.log(response);
});

// Listen for messages
chrome.runtime.onMessage.addListener(function(request, sender, sendResponse) {
  sendResponse({received: true});
});

// Access storage
chrome.storage.sync.get(['key'], function(result) {
  console.log(result.key);
});

chrome.storage.sync.set({key: 'value'});
```
