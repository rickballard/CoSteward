# Advice to Co1 — CoPing + Color Layer (seed)

_Date: 2025-11-13T20251113T231030Z (UTC seed)_

## Context

- Co1 (CoPrime) owns the **canonical CoPing / CoPong line**.
- Current shape (example):

  \\\	ext
  CoPong: [MW 2/10/12 | drift: ▯▯▯▯▯ (-8)] [CU:● SOFT PU:● SOFT HU:● SOFT WT:● SOFT ] [Session:CoPrime20251112] [Note:docs/intent/advice/notes/20251113/CoSync_20251113T191106Z.md] [Zip:CoPrime20251112_MW2_CoSyncBus_Megazip.zip] [SHA256:63F0FE1BE30C9F19A623E7DA89BDC75C225176D749B4DDABCD9F3CF5684E6321]
  \\\

- A helper script \scripts/Show-CoStatus.ps1\ now exists on **CoSteward/main**.
  - It prints a colorful block for CU/PU/HU/WT + drift.
  - It **must not** change the CoPing schema; it is just a color/UX primitive.

## Advice / Intent for Co1

1. **Treat CoPing schema as canonical, not negotiable by other sessions**

   - Other sessions should:
     - *read* CoPing/CoPong lines,
     - *advise* Co1 via notes like this,
     - but never redefine the structure.
   - If the schema evolves, changes should land via Co1-controlled PRs
     (likely in CoSteward and/or CoCache).

2. **Option: use \Show-CoStatus.ps1\ as a color layer inside Write-CoPong**

   - Suggested pattern (conceptual):

     - Keep the textual clusters exactly as now:
       - \[MW ...]\
       - \[CU:● ... PU:● ... HU:● ... WT:● ...]\
       - \[Session:...]\
       - \[Note:...]\
       - \[Zip:...]\
       - \[SHA256:...]\

     - Optionally, let \Show-CoStatus\ handle:
       - the **color choices**,
       - the internal representation of CU/PU/HU/WT severities,
       - potential future drift-bar rendering.

   - In other words:
     - \Write-CoPong.ps1\ remains **owner of schema + string**,
     - \Show-CoStatus.ps1\ is a **rendering helper** Co1 can call.

3. **Centralize CoPing/CoPong rails in CoSteward**

   - Co1 should aim to have:
     - one primary writer for CoPing/CoPong (e.g. \scripts/Write-CoPong.ps1\),
     - all other repos and sessions treat CoPing as “log output,” not something they emit directly.
   - CoCache / CoCacheGlobal / CoSync Bus should:
     - **consume** CoPing/CoPong lines as telemetry,
     - not re-implement them.

4. **Scope discipline for other sessions**

   - Non-Co1 sessions (including this one) should:
     - keep advice for Co1 **on repo** in \docs/intent/advice/notes/\,
     - avoid manipulating CoPing/CoPong scripts directly,
     - focus on their own domains:
       - CoCacheGlobal + CoCivia,
       - CoAgent productization,
       - BPOE/megazip workflows, etc.

5. **Future direction**

   - CoPing lines can become the backbone of:
     - CoSync Bus visibility,
     - CoCacheGlobal heartbeats,
     - CoAudit traces.
   - This note is a seed; Co1 is expected to:
     - refine the schema,
     - document it in a canonical place (e.g. \CoSteward/docs/ops/CoPing_Spec.md\),
     - ensure all sessions and tools use that spec.

## TL;DR for Co1

- You own CoPing/CoPong.
- \Show-CoStatus.ps1\ is a small, optional color layer you can adopt.
- Other sessions should speak to you via notes like this, then stay in their lane.
