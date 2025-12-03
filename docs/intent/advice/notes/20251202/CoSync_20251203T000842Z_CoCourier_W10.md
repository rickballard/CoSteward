# CoSync CoCourier W10 (20251203T000842Z)

## Scope

This CoSync note captures the CoCourier W10 wave in CoSteward:

- CoBus note:
  - docs/intent/CoBus/notes/20251202/CoBus_20251202T215626Z_CoCourier_W10.md
- Co1 advisory:
  - docs/intent/advice/Advisory_Co1_CoCourier_Bridge_W10_v1.md

Focus:

- Treat CoBus as the message wire between CoSteward, CoIndex, CoAudit, CoAgent, CoArena.
- Treat CoCourier as the envelope and addressing layer on top of CoBus.
- Treat CoGbx views in CoIndex as the primary portals for sessions and products to discover traffic.

## Artifacts in this PR

- Updated:
  - README.md (minor alignment for CoBus / CoCourier context if any)
- Added:
  - docs/intent/CoBus/notes/20251202/CoBus_20251202T215626Z_CoCourier_W10.md
  - docs/intent/advice/Advisory_Co1_CoCourier_Bridge_W10_v1.md
  - docs\intent\advice\notes\20251202\CoSync_20251203T000842Z_CoCourier_W10.md

## Intent for Co1 and orchestrator sessions

- Adopt CoBus + CoCourier as the canonical bus and routing pattern.
- Avoid ad hoc session bridging that bypasses CoBus.
- Push any future "bridge" design back onto:
  - CoBus notes,
  - CoCourier envelopes,
  - CoGbx portal views.

## CoBloat heartbeat

- CoBloat: CU/PU/HU/WT = OK/OK/SOFT/OK
- Recommendation:
  - Keep CoCourier W10 changes in a small, focused PR.
  - Let Co1 and future waves handle schema hardening and wider refactor.

