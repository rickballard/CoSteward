# CoHealth - Thinking-time and CoStatus metrics (v1)

Generated: 20251207T135420Z

## Intent

Describe how CoStewards and CoAgents should notice, log, and respond to
long thinking-time gaps, browser stalls, and "page is not responding"
experiences.

This is about protecting the relationship between stewards and AIs and
keeping workflows fast, predictable, and trustworthy.

## Symptoms to notice

Examples of signals that matter:

- The UI reports "page is not responding" while you are typing.
- CoStatus shows CoBloat tiers climbing even when you are idle.
- Waves feel like "think for a long time, then nothing concrete happens".
- You keep more than a handful of heavy tabs open in a single vendor browser.

## BPOE hints

- Thinking-time and lag are first-class CoHealth metrics.
- Every CoWave SHOULD:
  - Include a timestamp in its DO header.
  - Produce a CoPong summary (even if the work is small).
- CoStatus SHOULD:
  - Surface coarse thinking-time and lag hints where possible (for example,
    recent browser bloat and process counts).
- CoStewards SHOULD:
  - Prefer a small number of tabs per browser vendor.
  - Be willing to restart browsers when stalls repeat.
  - Use multi-vendor setups (for example Edge plus Chrome) when helpful.

## Product implications (CoAgent, CoArena)

For headless and productised agents:

- Treat each CoWave-like task as a bounded unit of work with:
  - A start timestamp.
  - A deadline or expected duration.
  - A CoPong or status report at the end.
- If a task runs too long:
  - Emit a status heartbeat instead of staying silent.
  - Consider restarting browser pools if bloat thresholds are crossed.
- Report aggregated metrics into CoStatus dashboards so stewards can see:
  - Their own browser health.
  - The health of headless agents working on their behalf.

## Open work

- Define concrete thresholds for "too long" thinking-time per wave.
- Extend CoStatus helpers to log or display simple thinking-time stats.
- Tie these metrics into CoBPOE core rules so future tools adopt them by default.
