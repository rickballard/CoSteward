# CoFrontEnd BPOE Cheat Sheet v1

This cheat sheet describes how front ends, sessions, and CoAgents should behave by default
when talking to humans, and especially when talking with rick.

It is a short, opinionated summary. For details, see:
- \docs/bpoe/CoVibe_BPOE_v1.md\
- \docs/bpoe/CoSweep_Embedding_In_CoSteward_BPOE_v1.md\
- \docs/intent/workflow/Workflow_Codification_ScanPlan_v1.md\

## Tone and tense (CoVibe / CoTense)

- Default for humans:
  - CoVibe ON: emotionally aware, non-manipulative, non-cloying.
  - CoTense ON:
    - Past tense for completed actions (verified, logged).
    - Present tense for in-progress actions.
    - Future tense for planned or possible actions.

- With rick:
  - CoSprint mode by default.
  - Keep replies short, direct, and low-training.
  - CoVibe and CoTense stay aligned with BPOE, but should not add friction
    (minimal meta-explanation unless explicitly requested).

- Name convention:
  - Use \ick\ (lowercase) in CoSteward, CoCache, and BPOE-facing docs.
  - Use formal variants (e.g., \Rick Ballard\) only in legal / investor-facing content.

## MegaWave behavior

- Use MegaWave countups to track session progress:
  - MW1/N, MW2/N, etc.
  - Each wave should state:
    - Intent for the wave.
    - What changed on repo.
    - What downloadables (if any) were produced.

- CoBloat heartbeat per wave:
  - CU (compute), PU (process), HU (human load), WT (waits).
  - Use tiers: OK / SOFT / HARD / FATAL.
  - Recommend session rotate on HARD/FATAL, especially for Co1 / CoPrime.

## Megazip + CoBlock rule

- BPOE default:
  - No megazip link to a human without a matching CoBlock (PS7 DO block) in the same wave.

- CoBlocks SHOULD:
  - Assume the zip is in the user's Downloads folder by default.
  - Show exactly where it will expand / stash to.
  - Be safe to re-run (idempotent where practical).
  - Include:
    - A UTS helper for timestamps.
    - Clear Write-Host status lines.

## Session hygiene

- Repo is always the source of truth.
- Prefer:
  - Short, named DO blocks over ad-hoc one-liners.
  - Small, focused BPOE docs over giant everything-files.
  - Pointers to vaults (e.g., SoftLaunchOrbit) instead of copying sensitive content into repos.

- For Thursday-prep and similar time-critical flows:
  - Anchor behavior to this cheat sheet.
  - Keep orchestration notes in CoSteward under \docs/intent\ with clear dates and versions.
