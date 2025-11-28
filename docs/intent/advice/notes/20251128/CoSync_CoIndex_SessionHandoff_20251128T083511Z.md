# CoSync – CoIndex session handoff to CoIndex20251128

Stamp   : 20251128T083511Z
Mission : CoIndex_BackboneDesign2025_Mission
Session : MurphyPlus_CoIndex20251123
Next    : CoIndex20251128

## What this session achieved

- Established CoIndex as the canonical semantic/indexing design for the CoSuite.
- Landed Layer2 schema (CoSpirit / MetaEvo / Visibility / Harvest) and HARVEST pipeline doc.
- Added ACK tracker for Academia shock / CoTrove / CoTheories Wave 1.
- Opened CoIndex PR for Layer2 + HARVEST + ACK tracker:
  - https://github.com/rickballard/CoIndex/pull/4
- Recorded that CoIndex will act as the orchestration hub for the "academia-shock" lane.

## Stance for Co1 and current sessions

- Co1 (CoPrime20251118) should:
  - Treat CoIndex as the canonical design for indexing going forward.
  - Start with a pilot lane "academia-shock":
    - Hand-craft a small set of CoPointees using CoIndex_ExportSchema_v2.
    - Emit exports under exports/pointees in CoIndex.
  - Prefer edge/semi visibility until risks are reviewed.

- ProtoCoIndex in Co1 can continue handling AI highlight surfaces,
  but structural semantics and cross-repo indexing belong in CoIndex.

- Academia shock / CoTrove / CoTheories sessions:
  - Are cleared to terminate; future waves for this topic are triggered via CoIndex.

## Scope for CoIndex20251128

The next CoIndex session (CoIndex20251128) is expected to:

- Implement the first HARVEST helpers for a single lane:
  - H (Harvest) + A (Annotate) + E (Emit) for "academia-shock".
- Produce a small, concrete export:
  - e.g., exports/pointees/CoIndex_AcademiaShock_Pilot_v1.json
- Coordinate with CoPortal to read that export and render:
  - Human-facing academia-shock index page.
  - AI-facing frame for CoPortals.

After this handoff, this session (MurphyPlus_CoIndex20251123) should be treated as:
- Design-locked for the CoIndex backbone,
- Historical for trace and receipts only,
- No longer used for heavy new work.

CoSync: MW_Replan/Close CoIndex/MurphyPlus_CoIndex20251123 -> CoIndex20251128
