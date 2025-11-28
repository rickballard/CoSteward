# CoSync - CoBus / CoSessionRegistry / CoCron strategy seed (20251128T035734Z)

SessionLabel: CoBusStrategySeed20251128T035734Z
Repo: CoSteward

## What this wave did

1. Ensured Co1 bus dirs exist in CoSteward:

   - docs/intent/bus/Co1/inbox
   - docs/intent/bus/Co1/stash

2. Registered a Co1Req for the CoBus / CoSessionRegistry / CoCron meta strategy:

   - C:\Users\Chris\Documents\GitHub\CoSteward\docs\intent\bus\Co1\inbox\Co1Req_CoBusStrategy_v1_20251128T035734Z.md

   The request asks Co1 / CoPrime to:

   - Define a CoBus / CoSyncPlus protocol for Co1Req / Co1Ack / CoAck traffic.
   - Install a CoSessionRegistry so session labels, scopes and statuses are tracked.
   - Add a CoCron pattern (eg GitHub Actions) that reports on CoBus backlog and staleness.
   - Document a Co1 duty cycle for processing CoBus traffic each orchestration wave.
   - Define CoAck / Co1Ack token semantics and record them in CoIndex and GIBindex.

3. Framed CoPortalPlusGit as one of the first test clients:

   - Co1 is invited to process Co1Req_CoPortalPlusGit_* via the new CoBus.
   - Later, CoPortal spec and patterns can expose CoAck tokens on the AI facing surface.

## Intent for Co1 / CoPrime

- Treat this Co1Req as the canonical seed for CoBus and CoSessionRegistry design.
- Keep the implementation:

  - Repo first
  - Diffable and reviewable
  - Human and AI readable
  - Non proprietary and re usable beyond CoCivium

- Blend this request with:

  - Existing CoSync bus notes,
  - CoPortalPlusGit Co1Req and Standards handoff pack,
  - Benedict / CoBrowser framing (additive, not overwriting).

When Co1 has designed and installed the first CoBus / CoSessionRegistry / CoCron round, it is encouraged to emit a Co1Ack token for this scope so future sessions can present that Co1Ack explicitly.
