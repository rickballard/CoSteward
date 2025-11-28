# CoGaps Taxonomy v1

A CoGap is the gap between what a session intended to do and what actually landed on repo.

This taxonomy is used in:
- Session close sweeps
- CoSync notes and rail work
- Future CoIndex and ProtoCoIndex integration

## 1. CoGaps table fields

Minimum columns:

- IntentId or index
- Intent or theme (short label)
- Status
- PrimaryCause
- SecondaryCause (optional)
- NextLaneOrAction
- Notes (optional free text)

Typical statuses:

- Done
- Buck-passed
- Undone
- Retired

## 2. Cause codes

Use at least one cause code for every CoGap.

- R1 ScopeChange  
  The mission changed. Intent no longer belongs in this lane.

- R2 DeprioritisedForMission  
  Intent is still good, but was ranked below higher priority work in this mission.

- R3 ContextLost  
  Needed information fell outside the active context window. The AI could not see the original instruction again without a human re-paste.

- R4 CrossSessionBlindness  
  The AI cannot see live state or private context of other sessions. It avoided making choices that might clash with unseen work.

- R5 ToolBoundaryOrEnvMismatch  
  Shell, editor or platform behaviour interfered. Example: pasting markdown or JSON directly into PowerShell and hitting parser errors.

- R6 TimeOrBloatGuard  
  Time, human load or CoBloat guards made it unsafe to start a new sub mission or MegaWave inside this lane.

- R7 AIErrorOrMisread  
  The AI misunderstood the request, optimised for the wrong thing, or summarised away a requirement.

## 3. Usage pattern

- At the end of a session, create or update a CoGaps register for that session.
- For each significant intent that did not fully land on repo, add a row with:
  - Status
  - PrimaryCause and optional SecondaryCause
  - Suggested next lane or action
- Link the register from:
  - The relevant CoSync note
  - Any wave note that summarises the session close

## 4. Future CoIndex integration

Later waves are expected to:

- Represent CoGaps and cause codes in a machine readable form (JSON or similar)
- Attach CoGap metadata to Intent and Mission entries in CoIndex
- Allow Co1 and CoMining sweeps to:
  - Cluster CoGaps by cause
  - Spot systemic issues
  - Spawn lanes or missions to reduce recurring causes