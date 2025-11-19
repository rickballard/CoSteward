# Session health notes (pattern v0.1)

This folder is used for lightweight **session health** and **CoSync bus** snapshots that help Co1 and child sessions avoid scope drift and CoCrossCreep.

## Intended usage

- Each helper or child wave can drop short `.md` notes here, for example:
  - `CoModules_CoPing_Coordination_*.md`
  - `CoModules_CoPing_HandoffToCo1_*.md`
  - `CoModules_CoPing_MegaWaveStatus_*.md`
  - `CoAnchor_Quickstart_CoSyncPing_*.md`

- Notes should:
  - Declare *scope* (what this wave is and is not touching).
  - Declare *handoff targets* (which repo / product / CoSteward).
  - Optionally log MegaWave countdown status.

## CoIgniter helper

The script `tools/CoIgniter_SessionHealth_Scan.ps1` provides a thin scan over this folder:

- Counts total notes.
- Shows the latest note.
- Counts recent notes in a configurable time window.
- Highlights notes with `CoSync` in the name.
- Highlights notes mentioning `CoCrossCreep`.

Example:

```powershell
pwsh -File tools/CoIgniter_SessionHealth_Scan.ps1 -RepoRoot . -RecentDays 2
This pattern is intended to be owned and evolved by Co1 / CoPrime.