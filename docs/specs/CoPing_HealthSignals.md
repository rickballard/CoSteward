# CoPing Health Signals (stub)

This spec describes the first generation of health signals that CoPing should surface for CoModules and CoSuite panels.

## CoPingPanel health checks

The current validator `tools/Test-CoPingPanel.ps1` emits simple checks:

- Paths:
  - `tools/Test-CoPingPanel.ps1`
  - `tools/CoBlock_Snapshot_LocalContext.ps1`
  - `schemas/EdgeControl.json`
  - `docs/internal/CoModulesStatus.md`
  - `docs/specs/CoPing_HealthSignals.md`
- EdgeControl:
  - JSON parses correctly
  - `mode` field present

Each check returns:
- Name
- Ok (true or false)
- Detail (short description)

## Next steps

Future waves should:
- Extend signals to cover additional CoModules.
- Define mapping from Ok/Fail into CoPing panel visuals and CoPulse dashboards.
- Add severity levels per check and link them to CoBloat and EdgeControl policies.

This file is a stub created by the CoModules20251118 wave and is expected to evolve under CoPrime guidance.