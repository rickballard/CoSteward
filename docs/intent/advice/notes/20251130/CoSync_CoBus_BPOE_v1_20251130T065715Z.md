# CoSync – CoBus / CoSync bus BPOE v1 seeded

session_label : CoIndex20251128 / CoIndex20251129 / Co1
utc_range     : 2025-11-30T04:xxZ–2025-11-30T05:xxZ
repos_touched : CoSteward, CoIndex

## What changed

- Seeded canonical CoBus / CoSync BPOE v1:
  - CoSteward/docs/bpoe/CoBus_BPOE_v1.md
- Seeded CoIndex lanes doc:
  - CoIndex/docs/intent/CoBus_Lanes_CoIndex_v1.md
- Aligned with:
  - CoIndex/exports/gibber/cogibber.registry.v1.json
  - CoSteward/docs/trove/CoGibber_Registry_Vocab_v1.md

## Intent

- Treat CoBus as first-class orchestration BPOE:
  - "CoBus (wire) → CoGibber (language) → CoGbx (views)"
- Require:
  - bus read at session start + pre-mutation DO-blocks
  - receipts for mutating waves under docs/intent/cobus/receipts/YYYYMMDD/

## Next waves

- Add cogibber.cobus vocab files (v1.1+)
- Per-repo CoBus adapters + CoGbx views for bus activity
- Optional soft-lock semantics under docs/intent/cobus/locks/
