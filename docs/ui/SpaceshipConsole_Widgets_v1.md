# Spaceship Console Widgets (v1)

This file lists the main panels and widgets that the Steward console
should eventually surface.

## Core panels

- CoSuite Health panel
  - Shows high level health signals for key repos.
  - Includes CoBloat tiers (CU, PU, HU, WT).

- Sync and Drift panel
  - Shows CoSync state across major repos.
  - Flags when session plans or dashboards are stale.

- Helper Bay panel
  - Entry point to helper scripts and tools.
  - Groups helpers by type:
    - stress test
    - sweep
    - inbox
    - dashboard
    - metrics

- Evolution panel
  - Links to CoMetaTrain and other evolution workflows.
  - Notes which waves are auto driven and which are co driven.

- Ship Elevator
  - Quick links to:
    - CoCivium
    - CoSteward
    - CoCache
    - CoIndex
    - CoAgent
    - CoAudit
    - CoPolitic
    - CoGbx or portal repos

## Non goals for v1

- No JavaScript or visual theming decisions here.
- No hard binding to a specific static site generator.
- No references to chat sessions; everything must map to repo assets.
