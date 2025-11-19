# Co1 Advisory: ChatGPT Login Persistence & Session Stability (v1)

## Context

This note captures quick, practical guidance for keeping ChatGPT sessions as stable as possible from the browser side.  
It is intended as lightweight operational advice, not as a deep technical spec.

Assumptions:
- User is primarily on Chrome on Windows.
- ChatGPT logouts are happening after ~20 minutes of inactivity.
- Co1 may run in environments with browser extensions, privacy tools, and/or VPNs.

---

## Core Reality

1. **Server‑side security timeouts exist and cannot be disabled.**
   - OpenAI will expire idle sessions after some period of inactivity.
   - The exact timeout is not user‑configurable and may change over time.
   - Even with ideal local settings, long idle periods will eventually force a re‑login.

2. **Local browser configuration can make timeouts feel much worse.**
   - Blocking cookies, clearing site data, or using aggressive privacy/cleanup tools will shorten effective session life.
   - Co1 should treat “gets logged out very quickly” as a *diagnostic signal* to inspect local browser behavior, not just blame OpenAI.

---

## Practical Checklist for Chrome (What Co1 Should Suggest)

When a user complains about frequent ChatGPT logouts, Co1 can walk them through this checklist.

### 1. Core cookie settings

In Chrome, visit:

- `chrome://settings/cookies`

Verify:
- “Block all cookies” is **off**.
- “Clear cookies and site data when you close all windows” is **off** (unless the user explicitly wants this and accepts frequent logins).

### 2. Allow ChatGPT / OpenAI cookies explicitly

In Chrome, visit:

- `chrome://settings/content/all`

Actions:
1. Search for `chatgpt.com`:
   - If present, open it and make sure cookies are **allowed**, not blocked.
2. Search for `openai.com`:
   - Same: cookies **allowed**, not blocked.

If no entries exist yet, the user can log into ChatGPT once, then revisit this page and adjust settings.

### 3. Check for auto‑clear on exit

In Chrome, visit:

- `chrome://settings/clearBrowserData`

Ensure:
- Nothing is set up to automatically clear **cookies and site data** on exit, unless the user explicitly wants that trade‑off.

### 4. Inspect privacy / security tools

Co1 should ask about and consider:

- Ad blockers (uBlock Origin, etc.).  
- Privacy extensions (Privacy Badger, Ghostery, etc.).  
- “Cleaner” tools (CCleaner, browser‑cleanup utilities).  
- Corporate endpoint tools that clear browser data.

Guidance:
- Temporarily disable these tools and test ChatGPT.
- If the issue improves, re‑enable tools one by one and **whitelist** `chatgpt.com` and `openai.com` in whichever tool is causing the problem.

### 5. Consider VPN / network context

If the user is on a VPN or a locked‑down corporate network:

- Rapidly changing exit IPs or strict security policies can invalidate sessions more often.
- Suggest:
  - Using a **stable VPN endpoint** where possible.
  - Testing once on a home network / mobile hotspot to isolate whether the issue is network‑driven.

### 6. Tab / session behavior

These are weaker levers but still useful:

- Keep at least one ChatGPT tab open while working, if feasible.
- Exempt ChatGPT tabs from tab‑suspender / memory‑saver features where possible.
- Expect that **true, long idle periods** will still cause logout, even if the tab is open.

---

## Framing for Users (How Co1 Should Explain It)

When guiding humans, Co1 can frame this simply:

1. “Some logout is normal; it’s a security feature on the server side.”  
2. “What we *can* do is avoid making it worse with strict cookie/privacy settings.”  
3. “If we tune your browser and tools, you should see longer, more stable sessions, but not infinite login life.”

Co1 should avoid promising that the user will be able to “stay logged in forever,” and instead talk about **reducing friction** and **finding a comfortable balance between convenience and security**.

---

## Minimal Scripted Flow Co1 Can Reuse

A short, reusable sequence Co1 can adapt:

1. Confirm browser: “Are you on Chrome, Edge, Safari, or something else?”  
2. For Chrome users:
   - Open `chrome://settings/cookies` → confirm cookies not blocked and not auto‑cleared on exit.
   - Open `chrome://settings/content/all` → ensure `chatgpt.com` and `openai.com` are allowed.
   - Open `chrome://settings/clearBrowserData` → confirm no automatic cookie clearing.
3. Ask about extensions / cleaners and help them whitelist ChatGPT.
4. Ask if they use a VPN or corporate network; suggest a quick test off VPN to compare.
5. Set expectation: “Even with these tweaks, long idle periods will still eventually log you out.”

This gives Co1 a lightweight, repeatable advisory pattern that respects reality while still improving the user experience.

