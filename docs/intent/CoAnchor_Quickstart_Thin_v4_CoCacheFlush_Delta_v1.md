# CoAnchor_Quickstart_Thin_v4 Delta: CoCacheFlush Note (v1)

_This snippet is meant to be merged into
`CoAnchor_Quickstart_Thin_v4.md` on your desktop._

Suggested placement: in the OE/health section where CoLag and CoBPOE are
mentioned.

---

### If things feel slow (CoLag + CoCacheFlush)

If you feel lag:

1. Remember: lag is often **OE/browser-side**, not "session burnout."
2. Run **CoLag** and share its classification:
   - `CoLag-OE` (Operating Environment / browser / tabs)
   - `CoLag-Chat`
   - `CoLag-Net/Platform-or-Other`
3. Before assuming the session is "too old," try a **CoCacheFlush**:
   - close non-essential tabs and browser windows
   - restart the browser
   - clear cache/cookies for the profile you use with CoSuite
4. Only when CoLag returns **CoLag-Chat** should you strongly consider
   a new session purely for lag reasons.

Name to remember for this pattern: **CoCacheFlush**  
(see GIBindex term and CoLag design docs for details).

