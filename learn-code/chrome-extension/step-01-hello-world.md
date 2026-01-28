# Step 1: Your First Extension

## What You'll Build

A simple extension with:
- A button in your Chrome toolbar
- When clicked, shows a popup with "Hello World"

## What You'll Learn

- How `manifest.json` works
- How Chrome loads extensions
- Basic popup structure

---

## The Files You Need

```
chrome-extension/
├── step-01-hello-world/
│   ├── manifest.json
│   ├── popup.html
│   └── popup.js
```

---

## File 1: manifest.json

**What it does**: Tells Chrome about your extension.

```json
{
  "manifest_version": 3,
  "name": "My First Extension",
  "version": "1.0",
  "description": "A simple hello world extension",
  "action": {
    "default_popup": "popup.html",
    "default_title": "Click me!"
  }
}
```

### Understanding Each Line

| Field | Purpose |
|-------|---------|
| `manifest_version` | Always 3 (latest version) |
| `name` | Shows up in Chrome extensions list |
| `version` | Your extension version (update when you make changes) |
| `description` | Short explanation of what it does |
| `action` | Defines the toolbar button behavior |
| `default_popup` | Which HTML file to show when clicked |

---

## File 2: popup.html

**What it does**: The UI that appears when you click the extension icon.

```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <style>
    body {
      width: 300px;
      height: 200px;
      padding: 20px;
      font-family: Arial, sans-serif;
    }
    h1 {
      color: #4285f4;
    }
    button {
      background: #4285f4;
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 4px;
      cursor: pointer;
    }
    button:hover {
      background: #357ae8;
    }
  </style>
</head>
<body>
  <h1>Hello World!</h1>
  <p>This is your first Chrome extension.</p>
  <button id="clickMe">Click Me</button>
  <p id="output"></p>

  <script src="popup.js"></script>
</body>
</html>
```

### Key Points

- Set explicit `width` and `height` for popups
- Style it like any webpage
- Load JS at the bottom (before `</body>`)

---

## File 3: popup.js

**What it does**: Makes the popup interactive.

```javascript
// Wait for DOM to load
document.addEventListener('DOMContentLoaded', function() {
  const button = document.getElementById('clickMe');
  const output = document.getElementById('output');

  button.addEventListener('click', function() {
    output.textContent = 'Button clicked! 🎉';
  });
});
```

### Key Points

- Always wait for `DOMContentLoaded`
- Use standard DOM manipulation
- Just like regular web development

---

## Load It in Chrome

### Steps:

1. **Open Chrome** and go to: `chrome://extensions`

2. **Enable Developer Mode** (toggle in top-right corner)

3. **Click "Load unpacked"**

4. **Select your `step-01-hello-world` folder**

5. **Done!** You should see your extension in the toolbar

### Troubleshooting

| Problem | Solution |
|---------|----------|
| Don't see the icon | Click the puzzle piece icon, pin your extension |
| Red error badge | Check the error message, usually a typo in manifest.json |
| Popup doesn't show | Make sure popup.html is in the same folder as manifest.json |

---

## Try These Modifications

### Challenge 1: Change the Colors
Modify the CSS to use your favorite colors.

### Challenge 2: Add a Counter
Make the button count how many times it's been clicked.

```javascript
let count = 0;
button.addEventListener('click', function() {
  count++;
  output.textContent = `Clicked ${count} times!`;
});
```

### Challenge 3: Add an Icon
Create or download a small PNG icon (128x128), save as `icon.png`, and add to manifest:

```json
{
  "manifest_version": 3,
  "name": "My First Extension",
  "version": "1.0",
  "description": "A simple hello world extension",
  "action": {
    "default_popup": "popup.html",
    "default_title": "Click me!"
  },
  "icons": {
    "128": "icon.png"
  }
}
```

---

## What You Learned

✓ How to structure a basic extension
✓ What manifest.json does
✓ How to create a popup UI
✓ How to load extensions in Chrome

## Next Step

Move to **Step 2** to understand the full architecture and when to use different components.
