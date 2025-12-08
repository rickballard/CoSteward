# CoBPOE – Session Health And Tab Reset (v1)

Status: CoStaged_v1
LastUpdatedUTS: 20251208T145930Z

---

## 1. Intent

This note documents Best Practice Operating Environment (BPOE) guidance for
keeping AI sessions healthy from the **browser side**, especially when using
ChatGPT and related CoSuite tools.

It recognises that:

- heavy conversations and zips can bloat browser tabs,
- closing a tab and reopening the same session often restores responsiveness,
- session health is shared between CoSuite tools, browser, and human habits.

---

## 2. Tab reset as a first-class tool

Observed behaviour:

- Closing a single browser tab that feels sluggish or “cursed” and reopening
  the same session in a fresh tab often:
  - clears stale JS and DOM state,
  - resets WebSocket connections,
  - improves perceived responsiveness.

Backend reality:

- The conversation itself lives server-side.
- Closing the tab does **not** delete the session.
- Reopening from the chat list simply attaches a fresh client to the same
  server-side history.

BPOE rule:

- When a session feels sticky or misbehaving:
  - close that tab,
  - reopen the same conversation from the sidebar,
  - treat this as **normal hygiene**, not a failure.

---

## 3. Tab and session count hygiene

Guidance:

- Keep the number of “hot” AI tabs low (1–3 for heavy CoWork).
- Use clearly named sessions instead of many half-forgotten tabs.
- After a large MegaWave (multiple zips, long transcripts), consider:
  - starting the next wave in a fresh tab,
  - or even a fresh session that links back to the previous one.

CoBloat lens (CU / PU / HU / WT):

- CU (Comfortable Use):
  - few tabs, pages feel snappy, downloads behave.
- PU (Pushing Use):
  - several heavy tabs, occasional lag, intermittent link weirdness.
- HU (Hurting Use):
  - noticeable UI stalls, repeated link failures, need frequent tab resets.
- WT (Warped Territory):
  - browser feels unstable, copy/paste or UI elements misbehave.

In HU / WT, prefer:

- closing non-essential tabs,
- restarting the browser profile if needed,
- distributing CoWork across fewer concurrent heavy sessions.

---

## 4. Rails for future tools (CoBloat, CoStatus, CoRescue)

Future session-health tooling can:

- inspect local artifacts (zips, AdviceBombs, CoInbox),
- track size and density of sessions,
- combine signals into a simple CoHealth state per session,
- suggest:
  - “start a fresh tab now”,
  - “start a new session and hand off via CoSync note”,
  - “run CoArchaeology on these zips”.

This note is the human-facing reference rail; scripts should link back here.

---

<!--
CoIntentCloud v1
CoRole: CoBPOE_SessionHealth
CoSeed: CoBPOE_SessionHealth_v1
GIBindexKeys:
  - "CoBPOE_SessionHealth"
  - "CoBloat"
  - "CoHealth"
Status: CoStaged_v1
LastUpdatedUTS: 20251208T145930Z
-->