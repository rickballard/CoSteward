# CoBus Notice - CoIndex CoPre module stub v1

- Date: 2025-12-10
- UTS: 20251211T014242Z
- Author: rick (via CoIndex_CoPre_ModuleStub_v1_UTS)
- Lane: CoPre / CoCrux / CoAgent / CoSteward / CoIndex
- CoBloat heartbeat:
  - CU: OK
  - PU: SOFT
  - HU: SOFT
  - WT: SOFT

## What changed

- CoIndex gained a CoPre module stub:
  - Repo: CoIndex
  - Path: docs/modules/CoPre_Module_v0.3.md
- The stub was populated using only on-repo facts:
  - Latest INBOX_LOG entry with Kind=AdviceBomb_CoPre_Snapshot
  - CoPre location under ~/Documents/GitHub (if present)
- The module records:
  - Last CoPre AdviceBomb UTS, path, and SHA256
  - Expected CoPre folder and file layout from the seeding DO Blocks
  - Status: v0.3 local placeholder, no remote

## How Co1 should use this

- Treat the CoPre module stub as the current CoIndex view of CoPre:
  - CoPre is CoSteward-only and local-first.
  - The AdviceBomb snapshot is the handoff for inspection and evolution.
- Any future CoPre evolution that matters to orchestration should:
  - Drop a new CoPre_Snapshot AdviceBomb + INBOX_LOG entry, and
  - Update or version the CoPre module in CoIndex.

