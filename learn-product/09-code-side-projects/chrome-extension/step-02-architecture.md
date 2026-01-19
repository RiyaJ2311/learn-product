# Step 2: Understanding Extension Architecture

## The Big Picture

Chrome extensions have **4 main components**. Not every extension needs all of them.

```
┌─────────────────────────────────────────────────────────────┐
│  CHROME BROWSER                                             │
│                                                             │
│  ┌──────────────────────────────────────────────────────┐  │
│  │  BACKGROUND SCRIPT (Service Worker)                  │  │
│  │  - Runs in background                                │  │
│  │  - Listens for events                                │  │
│  │  - Manages state                                     │  │
│  │  - Coordinates everything                            │  │
│  └────────┬─────────────────┬──────────────────────────┘  │
│           │                 │                              │
│           │                 │                              │
│  ┌────────▼───────┐  ┌──────▼────────┐                    │
│  │  POPUP         │  │  OPTIONS PAGE │                    │
│  │  - User clicks │  │  - Settings   │                    │
│  │    icon        │  │  - Prefs      │                    │
│  └────────────────┘  └───────────────┘                    │
│                                                             │
└─────────────────────────────────────────────────────────────┘
                        │
                        │ Injects into
                        ▼
┌─────────────────────────────────────────────────────────────┐
│  WEB PAGE (e.g., google.com)                               │
│                                                             │
│  ┌──────────────────────────────────────────────────────┐  │
│  │  CONTENT SCRIPT                                      │  │
│  │  - Injected into web pages                           │  │
│  │  - Can read/modify page content                      │  │
│  │  - Has access to page DOM                            │  │
│  └──────────────────────────────────────────────────────┘  │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Component 1: Popup

### When to Use
- Need a quick UI when user clicks the extension icon
- Show information or controls
- Temporary interaction

### Characteristics
- Opens when icon clicked
- Closes when user clicks away
- Does NOT persist (resets each time)
- Limited in size

### Examples
- Password manager popup
- Translation tool UI
- Quick notes

### Code Location
```json
// manifest.json
{
  "action": {
    "default_popup": "popup.html"
  }
}
```

---

## Component 2: Content Scripts

### When to Use
- Need to read or modify web page content
- Want to inject UI elements into pages
- Need to interact with the page's DOM

### Characteristics
- Runs inside web pages
- Has access to the DOM
- Isolated from page's JavaScript
- Can run on specific URLs or all pages

### Examples
- Ad blockers (hide elements)
- Grammar checkers (analyze text)
- Price comparisons (inject price data)

### Code Location
```json
// manifest.json
{
  "content_scripts": [
    {
      "matches": ["https://*/*"],
      "js": ["content.js"]
    }
  ]
}
```

---

## Component 3: Background Script (Service Worker)

### When to Use
- Need to respond to browser events
- Want to persist data or state
- Coordinate between popup and content scripts
- Run tasks periodically

### Characteristics
- Runs in the background
- Event-driven (wakes up when needed)
- No direct access to web pages
- Can use all Chrome APIs

### Examples
- Listen for tab changes
- Store user preferences
- Handle messages from other parts
- Set up context menus or keyboard shortcuts

### Code Location
```json
// manifest.json
{
  "background": {
    "service_worker": "background.js"
  }
}
```

---

## Component 4: Options Page

### When to Use
- Need a settings/preferences page
- Want users to configure the extension
- Complex configuration UI

### Characteristics
- Full HTML page
- More space than popup
- Accessed via extension management
- Persists settings to storage

### Examples
- Theme customization
- Feature toggles
- API key configuration

### Code Location
```json
// manifest.json
{
  "options_page": "options.html"
}
```

---

## How They Communicate

Components are **isolated** from each other. They communicate via **message passing**.

```
POPUP                    BACKGROUND               CONTENT SCRIPT
  │                          │                          │
  │──chrome.runtime.send────▶│                          │
  │                          │                          │
  │                          │──chrome.tabs.send───────▶│
  │                          │                          │
  │                          │◀─────response────────────│
  │◀────response─────────────│                          │
```

### Message Passing Code

**From popup to background:**
```javascript
// popup.js
chrome.runtime.sendMessage({action: "getData"}, function(response) {
  console.log(response);
});
```

**Background receives:**
```javascript
// background.js
chrome.runtime.onMessage.addListener(function(request, sender, sendResponse) {
  if (request.action === "getData") {
    sendResponse({data: "Here's your data"});
  }
});
```

---

## Decision Tree: What Do I Need?

```
START: What does your extension do?

├─ Just show UI when clicked?
│  └─ Use: POPUP only
│
├─ Modify web pages?
│  └─ Use: CONTENT SCRIPT (+ optional popup)
│
├─ Respond to browser events? (tab changes, bookmarks, etc)
│  └─ Use: BACKGROUND SCRIPT (+ optional popup)
│
├─ Store settings?
│  └─ Use: BACKGROUND SCRIPT + OPTIONS PAGE
│
└─ Complex app with all features?
   └─ Use: ALL COMPONENTS
```

---

## Real-World Examples

### Example 1: Simple Tab Counter
**Need**: Just show number of open tabs
**Uses**: Popup only
**Why**: Simple display, no persistence needed

### Example 2: Dark Mode for Websites
**Need**: Make websites dark
**Uses**: Content Script + Popup (toggle)
**Why**: Modifies page CSS, popup controls it

### Example 3: Bookmark Manager
**Need**: Organize bookmarks with tags
**Uses**: Background + Popup + Storage
**Why**: Listens for bookmark events, stores data, shows UI

### Example 4: Grammar Checker
**Need**: Highlight grammar errors on pages
**Uses**: Content Script + Background + Options
**Why**: Analyzes page text, background manages API calls, options for settings

---

## Manifest V3 vs V2

You'll see older tutorials using **Manifest V2**. Use **Manifest V3** (it's the current standard).

### Key Differences

| Feature | V2 (Old) | V3 (New) |
|---------|----------|----------|
| Background | Persistent pages | Service workers (event-based) |
| API namespace | `chrome.*` or `browser.*` | `chrome.*` |
| Host permissions | In `permissions` | In `host_permissions` |
| Action | `browser_action` or `page_action` | `action` |

**Always use V3** for new extensions.

---

## What You Learned

✓ The 4 main extension components
✓ When to use each component
✓ How components communicate
✓ How to decide what you need

## Next Step

Move to **Step 3** to build your first content script and learn DOM manipulation.

---

## Quick Reference

```json
// Minimal manifest with all components
{
  "manifest_version": 3,
  "name": "Full Extension",
  "version": "1.0",

  "action": {
    "default_popup": "popup.html"
  },

  "background": {
    "service_worker": "background.js"
  },

  "content_scripts": [{
    "matches": ["<all_urls>"],
    "js": ["content.js"]
  }],

  "options_page": "options.html",

  "permissions": ["storage", "tabs"]
}
```
