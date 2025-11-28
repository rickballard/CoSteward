# CoSessionRegistry v1

Role: Append-only registry of long-running sessions (CoPrime, CoCivia, etc.).

Example table:

| Label           | Started    | Closed     | Role / Mission                         | Repo focus                         | Notes / Handoff                           |
|-----------------|-----------:|-----------:|----------------------------------------|------------------------------------|-------------------------------------------|
| CoPrime20251118 | 2025-11-18 | 2025-11-27 | CoPrime / CoAnchor (Benedict lineage)  | CoSteward, CoIndex, CoCivium      | Closed; baton to CoPrime20251128         |
| CoPrime20251128 | 2025-11-28 | —          | CoPrime / CoAnchor (CoDelta/CoBus era) | CoIndex, CoSteward, CoCivium      | Current; ProtoCoIndexHelper + CoBus work |

Next steps:
- Maintain this file in CoSteward.
- Ensure each session has:
  - at least one CoSync close note,
  - references to major AdviceBombs and MegaWaves.

## 2025-11-28 – CoIndex session registry entry (CoIndex20251128)

- session_label: CoIndex20251128
- started_utc: 20251128T082035Z
- scope: >
    New eyes for CoIndex – consolidate reinventions, seed ProtoCoIndexHelper-style
    helpers from CoIndex_SeedAssets_v1, declare non-truth stance, hook helpers to
    CoPlan IDs and CoBus, and leave trails for the next new-eyes session.
- repos:
  - CoIndex
  - CoSteward
  - CoPlan
  - CoCivium
  - InSeed
- status: Active (seed wave)
- notes:
  - See CoIndex docs/helpers/CoIndex_SeedHelpers_*.md
  - See CoIndex docs/manifestos/CoIndex_Stance_NonTruthIndex_v1.md
  - See CoIndex docs/intent/advice/notes/YYYYMMDD/CoSync_CoIndex20251128_*.md


## Session CoPrime20251128

- label        : CoPrime20251128
- kind         : CoPrime / Co1
- status       : active
- started_on   : 2025-11-28
- related_repos:
  - CoSteward
  - CoCivium
  - CoIndex
  - InSeed
  - CoPlan
- notes:
  - Spawned new CoIndex session CoIndex20251128 to act as "new eyes" indexer.
  - See CoMemo_CoIndex_Handoff_* in docs/intent/advice/notes/20251128.


## Session CoIndex20251128

- label        : CoIndex20251128
- kind         : CoIndex
- status       : active
- started_on   : 2025-11-28
- related_repos:
  - CoIndex
  - CoSteward
  - CoCivium
  - CoPlan
- notes:
  - Reads rails from CoIndex_SeedAssets_v1 and ProtoCoIndexHelper_v1.
  - Handoff memo: CoMemo_CoIndex_Handoff_* in docs/intent/advice/notes/20251128.

