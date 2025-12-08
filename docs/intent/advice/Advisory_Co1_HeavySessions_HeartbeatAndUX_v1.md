# Advisory – Heavy Sessions, Heartbeat, and UX (v1)

## 1. Problem

- Some CoSuite sessions accumulate huge context and slow down.
- To humans, this often looks like:
  - “Session died”,
  - “AI stopped thinking”,
  - “No heartbeat for 10–30 minutes”.

- Locally, user machines / browsers may add:
  - Fragmentation, memory pressure, tab aging.

## 2. Desired UX

- Always show **some** visible heartbeat while heavy work is running.
- Prefer:
  - Status lines,
  - CoBloat tier summaries,
  - Short “still working” pings,
  over walls of code or silence.

## 3. CoAgent / CoBus direction (v1)

For CoAgent and PS7 rails:

- PS7 panels:
  - Default to **status-only** mode between CoPong events:
    - CoWave label,
    - CoBloat CU/PU/HU/WT,
    - Next GoodLand / next MegaWave.
  - Hide raw code unless the user explicitly asks for debug view.

- CoStart / CoBus:
  - On entry, print a one-line CoWave + CoBloat heartbeat.
  - Provide a simple function (e.g., Write-CoStatus) that:
    - Can be called by any script,
    - Always uses color for tiers,
    - Keeps messages short.

- CoAgent UI:
  - Reserve a small, fixed **status strip**:
    - Last CoWave / MegaWave,
    - Current CoBloat tier summary,
    - “Working…” heartbeat when tools are busy.

## 4. CoGibber interplay

When sessions are CoGibber-aware:

- Treat “CoGibber” as:
  - A hint that the user cares about rails and trust,
  - A reason to keep heartbeats visible,
  - A reason to admit slowness instead of going quiet.

## 5. Next steps for Co1

- Track this advisory in CoSteward.
- Wire status / heartbeat concepts into:
  - CoAgent status panel,
  - CoBus bootstrap logs,
  - Any MegaWave wrappers.

The goal: **never leave heavy users guessing** whether the AI is still
thinking. Always keep a small, honest heartbeat.
