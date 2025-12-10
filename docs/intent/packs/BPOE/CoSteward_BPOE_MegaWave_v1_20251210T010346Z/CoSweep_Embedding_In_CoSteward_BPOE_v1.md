# Embedding CoSweep in CoSteward BPOE v1.1

CoSweep is the protocol for sweeping across sessions, repos, and vaults to keep BPOE aligned.
This doc explains how CoSweep should be embedded inside CoSteward so that the repo remains
the source of truth for rails and front end behavior.

## CoSweep placement

- CoSweep gets its own section in CoSteward BPOE, alongside:
  - CoVibe / CoTense BPOE (see: docs/bpoe/CoVibe_BPOE_v1.md).
  - Session hygiene and CoReload tools.
  - Inbox and AdviceBomb handling.

- CoSweep docs should:
  - Declare the CoSweep intent for a wave or pack.
  - List included assets at a high level.
  - Point to any vault-only content via pointers, not raw content.

## CoVibe defaults and rick naming

- CoSweep must respect the CoVibe BPOE defaults:
  - CoVibe and CoTense on by default for all humans.
  - CoSprint mode for rick when requested, with minimal training overhead.
  - Use ick (lowercase) as the default name in CoSteward docs and prompts.

- When generating CoSweep instructions or notes, prefer concise, direct language
  that still respects the reader's context and load.

## Megazip and CoBlock pairing

- When a CoSweep wave produces a megazip for a human to download:
  - The same wave must include a PS7 DO block (CoBlock) that:
    - Knows how to locate the zip in Downloads (or another declared folder).
    - Expands or stashes it into the correct repo or vault path.
    - Is safe to re-run if needed.

- This rule is BPOE default for CoSweep:
  - No megazip without a CoBlock in the same wave.
  - CoBlocks should follow the usual pattern:
    - Header comment with ♦ DO Name_vX_UTS.
    - Local UTS helper to timestamp runs.
    - Clear Write-Host messages summarizing what happened.

## Versioning

- Keep this file small and focused; let more detailed protocol steps live in:
  - docs/bpoe/CoVibe_BPOE_v1.md
  - docs/intent/workflow/Workflow_Codification_ScanPlan_v1.md
  - CoSweep protocol docs under docs/bpoe or docs/intent.

- When changing global CoSweep behavior, bump the minor version here
  and note the change at the top of the file.
