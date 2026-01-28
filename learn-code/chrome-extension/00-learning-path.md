# Chrome Extension Learning Path

Learning how to build quality Chrome extensions from scratch.

## Learning Philosophy

**Goal**: Understand not just HOW to build extensions, but WHY things work the way they do.

**Approach**: Build progressively complex examples, understanding each piece deeply.

---

## Phase 1: Foundation (Step 0-2)

### Step 0: Mental Model
**Understand**: What IS a Chrome extension?
- Just HTML/CSS/JS files with special browser access
- Lives in the browser, not on a web server
- Can interact with web pages and browser features

**Key Concept**: Extensions are made of modular pieces that communicate with each other.

### Step 1: Your First Extension
**Build**: A "Hello World" popup extension
**Learn**:
- `manifest.json` structure
- How Chrome loads extensions
- Basic popup UI

**Files needed**: `manifest.json`, `popup.html`, `popup.js`

### Step 2: Understanding the Architecture
**Learn**: The 4 main extension components and when to use each
- Content Scripts (inject into web pages)
- Background Scripts (event handlers, persistence)
- Popup (UI when icon clicked)
- Options Page (settings/preferences)

---

## Phase 2: Core Concepts (Step 3-5)

### Step 3: Content Scripts
**Build**: Extension that highlights text on any webpage
**Learn**:
- How to inject scripts into pages
- DOM manipulation from extensions
- Content script isolation

### Step 4: Message Passing
**Build**: Popup that talks to content script
**Learn**:
- `chrome.runtime.sendMessage()`
- `chrome.tabs.sendMessage()`
- Why different parts need to communicate

### Step 5: Background Scripts & Events
**Build**: Extension that persists data/responds to browser events
**Learn**:
- Service workers (Manifest V3)
- Event-driven architecture
- Storage API (`chrome.storage`)

---

## Phase 3: Real Functionality (Step 6-8)

### Step 6: Chrome APIs
**Build**: Use 2-3 different Chrome APIs
**Learn**:
- `chrome.tabs` (manage tabs)
- `chrome.storage` (save data)
- `chrome.notifications` (show notifications)
- `chrome.contextMenus` (right-click menus)

### Step 7: Permissions & Security
**Learn**:
- What permissions mean
- Principle of least privilege
- Content Security Policy
- Safe vs unsafe practices

### Step 8: Complete Project
**Build**: A full-featured extension combining everything
**Example ideas**:
- Tab manager
- Note-taking tool
- Web scraper with storage
- Custom new tab page

---

## Phase 4: Quality & Best Practices (Step 9-10)

### Step 9: Code Quality
**Learn**:
- Project structure for larger extensions
- Error handling
- Performance considerations
- Debugging techniques

### Step 10: Publishing & Maintenance
**Learn**:
- Preparing for Chrome Web Store
- Icons, screenshots, descriptions
- User privacy and data handling
- Updates and versioning

---

## What Makes a "Good Quality" Extension?

### 1. **Performance**
- Doesn't slow down browser
- Efficient content scripts
- Proper event listeners (not always-on)

### 2. **Security**
- Minimal permissions
- No `eval()` or unsafe code
- Validate user input
- Follow Content Security Policy

### 3. **User Experience**
- Clear, intuitive UI
- Works reliably
- Helpful error messages
- Good documentation

### 4. **Code Quality**
- Modular, organized structure
- Commented where needed
- Error handling
- Maintainable

### 5. **Privacy**
- Transparent about data usage
- Store data locally when possible
- Don't collect unnecessary info

---

## Your Current Stage

**You're at Step 0** - Understanding the mental model.

**Next**: Move to Step 1 and build your first extension.

Ready to start building?
