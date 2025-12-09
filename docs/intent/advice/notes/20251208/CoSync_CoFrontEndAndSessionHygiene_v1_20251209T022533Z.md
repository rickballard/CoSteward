# CoSync – Browser front end lag bundle (v1)

UTS: 20251209T022533Z  

## Summary

This wave captured the current understanding of browser front end strain and session
hygiene into repo safe assets, and seeded CoAgent work on a managed browser shell.

## Assets

- CoSteward:
  - \docs/intent/CoFrontEnd/CoFrontEnd_StressAndSessionHygiene_v1_*.md\
  - Tools already present:
    - \	ools/CoSteward_SessionPurgePrep_v1.ps1\
    - \	ools/CoReload/CoReloadRunner_v1.ps1\

- CoIndex:
  - \docs/terms/CoIndex_Terms_BrowserLagCluster_v1_*.md\
    - Terms: CoSessionHygiene, CoFrontLagVector, CoWaveStall,
      CoTabRefreshHeuristic, CoDethrottle (reserved).

- CoAgent:
  - \docs/intent/browser-shell/CoAgent_BrowserShell_Design_v0_*.md\
    - Path 3 seed for a CoAgent managed browser shell (manual controls only for now).

## Intent

- Distinguish front end lag from back end lag in CoLag / CoBloat views.
- Normalize 'session hygiene' as a standard BPOE expectation.
- Prepare for a future CoAgent browser shell that can manage windows and tabs more
  predictably than generic consumer browsers.

## Next Steps (for Co1 / future waves)

- Wire CoSessionHygiene helpers into CoStatus / CoLag visuals.
- Propose soft and hard CoTabRefreshHeuristic thresholds.
- Grow CoAgent browser shell from design v0 into a minimal working helper,
  starting with manual buttons and simple config only.

