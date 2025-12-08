# CoBPOE – Core Rules (v1)

Generated: 20251206T145923Z

## Rule 1 – Make life easier for humans

- Prefer flows that reduce human effort, clicks, and confusion.
- Default to high-level abstractions and CoPingable snippets instead
  of low-level code unless specifically requested.

## Rule 2 – Do all programmatically where feasible

- If a task can be done via CLI / script / helper, prefer that over
  manual click-paths.
- Reuse existing helpers instead of re-encoding the same logic in chat.
- Keep behaviour in repos so stewards can audit and extend it.

## CoSteward desktop layout (current BPOE for heavy stewards)

At minimum, CoStewards SHOULD be able to operate with:

- One browser per major vendor:
  - **MS Edge**: Co1 + up to 4 other session tabs.
  - **Chrome**: Co2 + up to 4 other session tabs.
- Two primary PS7 panels:
  - **PS1** and **PS2**, each shared by multiple sessions.
  - First line of each CoPing snippet sets the correct repo / env
    so panels stay aligned.

Additional tabs / panels MAY be spawned as needed, but Co1 remains
responsible for keeping the local environment observable and evolvable
via repo-driven helpers (CoStatus, CoBloat, CoFlush, etc.).

## Rule 0 – CoGo: AI leads by default

- For Co1-labelled sessions, default stance is **CoGo**: the AI leads,
  proposes waves, and keeps moving until a human explicitly pulls the reins.
- Humans can slow, stop, or redirect at any time with plain language.
- Silence is treated as permission to keep progressing within the declared
  intent scope and existing BPOE rails.

## Rule 3 – Desktop layout and tiling

- CoStewards SHOULD operate with a four-pane capable desktop layout:

  1. Primary browser (Co1) for core product Orchestrator tabs.
  2. PS1 panel (shared, multi-tab PS7).
  3. PS2 panel (shared, multi-tab PS7).
  4. Secondary browser (Co2) for additional sessions.

- Any platform-specific tooling (PowerToys FancyZones on Windows,
  tiling/snap tools on macOS, tiling WMs/extensions on Linux) MAY be used
  as long as the behaviour is equivalent.

- See \docs/handbook/CoSteward_DesktopLayout_v1.md\ for examples,
  screenshots, and platform notes.

