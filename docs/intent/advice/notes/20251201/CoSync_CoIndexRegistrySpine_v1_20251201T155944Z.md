# CoSync – CoIndex Registry Spine v1 (FullIndexWave)

SessionLabel: CoIndex20251128  
WrittenUTC:  20251201T155944Z  

This note records that:

- CoIndex now has a populated CoGibber / CoGbx registry spine (v1) with ~3k pointees across:
  - CoIndex
  - CoSteward
  - CoAudit
  - CoCivium
- Guardrails are seeded across three repos:
  - CoIndex (schema, CI, invariants, health helper, CoBus receipts)
  - CoAudit (registry integrity spec)
  - CoSteward (BPOE for registry governance)
- Co1 has been briefed via an advisory .md dropped into the Co1 session.

## Related PRs

- CoIndex full-index wave + guardrails v1:
  - https://github.com/rickballard/CoIndex/pull/18
- CoAudit spec for CoIndex registry integrity:
  - https://github.com/rickballard/CoAudit/pull/33
- CoSteward BPOE for CoIndex registry governance:
  - https://github.com/rickballard/CoSteward/pull/204

## CoBus receipts (CoIndex)

- Full-index wave receipt:
  - docs/intent/cobus/receipts/20251201/CoBus_CoIndex_FullIndexWave_v1_20251201T153140Z.json

## Expectations for future waves

- Co1:
  - Review/merge these PRs.
  - Treat CoIndex registry as spine for multi-repo asset discovery and CoGbx/CoPortal builds.
- CoAudit:
  - Implement scripts + jobs to:
    - Validate registry via schema.
    - Check pointee existence cross-repo.
    - Emit audit CoBus receipts back to CoIndex.
- CoSteward:
  - Evolve BPOE as registry usage and attack surface become clearer.

This note may reference intent and threat-model ideas that are not yet fully captured in other docs.
Once BPOE and CoAudit specs are updated, those become canonical.
