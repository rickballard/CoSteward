# CoPulse Spec v0.1 – CoPrime20251118

CoPulse is the idea of repo-driven heartbeats for CoSteward and the CoSuite.

Instead of guessing session health from feelings, CoPulse uses simple, repeatable signals from repos and tools.

## What is a CoPulse?

A **CoPulse** is a lightweight, periodic snapshot that answers:

- Is this mission alive and moving?
- Are AdviceBombs being created and processed?
- Are session-health patterns (CoBloat, CoRotate, CoRescue) being tracked?

For CoPrime20251118, the minimal pulse reads:

- AdviceBomb artifacts:
  - \$adviceBombZipRel\
  - \dvice/INBOX_LOG.md\
- Session-health triage:
  - \$triageRel\
- Any CoPrime-specific session-health docs under:
  - docs/intent/session-health/CoPrime20251118/

## CoPulse metrics (v0.1)

Initial coarse metrics:

- **B1 – AdviceBomb coverage**:
  - Do we have a zip + sha256 + INBOX_LOG entry for the last major handover?
- **B2 – Session-health triage presence**:
  - Does CoPrime have a triage file listing candidate session-health advisories?
- **B3 – Pattern docs present**:
  - Do CoBloat, CoRotate, CoRescue guides exist for this mission?
- **B4 – CoDitto density (qualitative)**:
  - Are there repeated human signals requesting the same behavior (CoDitto)?
  - Are those patterns being promoted to named docs and tools?

Each metric can be scored:
- 0 = missing
- 1 = present but rough
- 2 = present and in active use

## CoPulse run modes

- **Manual pulse (CoIgniter)**:
  - A human runs a PS7 script that reads triage + docs + INBOX_LOG and prints a simple summary.
- **Future automated pulses**:
  - CI workflows.
  - Scheduled checks on AdviceBomb and session-health directories.
  - Multi-repo CoPulse dashboards.

## Next steps

- Harden the CoIgniter scan script.
- Add a simple markdown-based 'pulse report' for each major mission label (CoPrime, CoArena, CoModules, etc.).
- Connect CoPulse results to CoBloat / CoRotate thresholds so that bloat interventions are automatic, not heroic.
