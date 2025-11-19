
Session health patterns v0.1 (stub)

This document describes the first-generation patterns for session health and CoSync bus notes.

Goals

Make it obvious what each wave is doing and what it must not touch.

Help Co1 orchestrate many child sessions without CoCrossCreep.

Provide lightweight, repo-first breadcrumbs for humans and AIs.

Current building blocks

Notes in docs/intent/session-health/

CoIgniter scan helper:

tools/CoIgniter_SessionHealth_Scan.ps1

Existing notes such as:

CoModules_CoPing_Coordination_*.md

CoModules_CoPing_HandoffToCo1_*.md

CoModules_CoPing_MegaWaveStatus_*.md

CoAnchor_Quickstart_CoSyncPing_*.md

Next steps (for Co1 to confirm or override)

Decide whether session-health patterns live:

Only in CoSteward, or

As a shared pattern that other repos inherit from.

Decide how often CoIgniter scans should run (manual, CI, or CoPulse).

Extend the pattern to include:

Explicit MegaWave countdown markers.

Simple status codes (OK / SOFT / HARD / FATAL) for CU, PU, HU, WT.

Link this spec from CoSteward operations docs and any Co1 orchestration guides.

This stub is provided as a starting point and is expected to evolve under Co1 ownership.