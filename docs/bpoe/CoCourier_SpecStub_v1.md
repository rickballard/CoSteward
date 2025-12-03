# Project CoCourier - Spec Stub (v1)

Short: CoCourier is CoSuite infra that automates CoBus-aware session bootstrapping  
and breaks the manual "Rick-as-courier" pattern between sessions.

This stub is a placeholder for Co1 and future waves to extend.

## 1. Motivation

- Remove manual copy and paste between sessions.
- Let CoBus and local tools provide standard bootstraps.
- Support many-to-many session federation and high bandwidth MegaWaves.
- Reduce orchestration drift and repo state clashes.

Related advisory and notes:

- docs/intent/advice/Advisory_CoCourier_Initiation_v1.md  
- docs/intent/CoBus/notes/YYYYMMDD/CoBus_..._CoCourier_Initiation_v1.md

## 2. Scope (v1 sketch)

CoCourier covers:

- CoBus ingestion and export patterns.
- Session bootstrap blocks for AIs and tools.
- Cross repo orchestration glue (CoCore, CoIndex, CoSteward).
- Safety rails for multi agent editing and auto evo loops.

Out of scope (for v1):

- Full CoCivIA autonomy.
- Non CoSuite third party ecosystem wiring.

## 3. Components (to be detailed by Co1)

- **CoCourier Client**  
  - Local tool that reads CoBus and assembles session bootstraps.

- **CoCourier Loader**  
  - Defines how new sessions accept and apply bootstraps.

- **CoCourier Registry**  
  - Index in CoIndex / GIBindex that tracks:
    - known bootstrap patterns,
    - session templates,
    - safety profiles.

- **CoCourier Metrics**  
  - Basic telemetry:
    - manual courier load reduction,
    - number of sessions bootstrapped via CoCourier,
    - error and drift rates.

## 4. Interfaces (anchors only, not final)

- CoBus notes (CoSteward/docs/intent/CoBus/notes/...)
- CoGibber / CoGbx contracts
- CoGuard Top 100 and future guardrail sets
- CoAgent / CoArena panels
- CoCore orchestration APIs (to be defined)

## 5. Workstream for Co1 (checklist shell)

- [ ] Flesh out CoCourier high level spec in this file.
- [ ] Add GIBindex entry and CoIndex view for CoCourier.
- [ ] Define minimal CoCourier client prototype.
- [ ] Define minimal loader pattern for new sessions.
- [ ] Update Master Plan and BPOE to include CoCourier as core infra.
- [ ] Plan v1 to v2 operational wave with small repo set.

## 6. Notes

- This file is intentionally minimal and non binding.
- Co1 and CoPrime should treat it as a writable rails stub.
- When CoCourier spec stabilises, bump to v2 and update all references.
