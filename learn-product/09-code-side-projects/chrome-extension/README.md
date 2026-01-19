# Chrome Extension Mental Model

A Chrome extension is essentially **a small web app that lives in your browser** with special permissions to interact with web pages and browser features.

## Core Components to Understand

| File | Purpose |
|------|---------|
| `manifest.json` | The "config file" - tells Chrome what your extension does, what permissions it needs, which scripts to load |
| `popup.html/js` | The UI that appears when you click the extension icon |
| `content.js` | Script that runs **inside** web pages (can read/modify page content) |
| `background.js` | Runs in the background, handles events, coordinates between parts |

## How They Talk to Each Other

```
┌─────────────────────────────────────────────────┐
│  Browser                                        │
│  ┌──────────────┐      ┌──────────────────┐    │
│  │ background.js│◄────►│ popup.html/js    │    │
│  │ (service     │      │ (when icon       │    │
│  │  worker)     │      │  clicked)        │    │
│  └──────┬───────┘      └──────────────────┘    │
│         │                                       │
│         │ messages                              │
│         ▼                                       │
│  ┌──────────────┐                              │
│  │ content.js   │ ◄── lives inside the webpage │
│  └──────────────┘                              │
└─────────────────────────────────────────────────┘
```

## Your First Step

**Start with the simplest possible extension:**

1. Create a folder
2. Create `manifest.json` with just name, version, and a popup
3. Load it in Chrome via `chrome://extensions` → "Load unpacked"
4. See it work

## Next Steps

**What's your personal use case?** Knowing that will help determine which components you'll actually need (you might not need all of them).

## Loading Your Extension in Chrome

1. Open Chrome and go to `chrome://extensions`
2. Enable "Developer mode" (toggle in top right)
3. Click "Load unpacked"
4. Select your extension folder
5. Your extension should now appear in the toolbar
