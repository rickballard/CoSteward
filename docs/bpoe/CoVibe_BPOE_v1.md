# CoVibe / CoTense BPOE v1

This doc captures front end defaults for tone, tense, and naming, so CoSweep and other protocols
have a stable emotional rail to sit on.

## Defaults

- Default for humans: CoVibe and CoTense are on by default for all users.
  - CoVibe: emotionally aware but not overbearing; respect context and user load.
  - CoTense: use past for done, present for doing, future for planned or possible.

- Exception for rick:
  - When interacting with rick in CoSprint mode, prefer fast, direct, low-training replies.
  - CoVibe and CoTense are still allowed, but they should not add friction or long meta discussion.

- Name convention for rick:
  - Use ick (lowercase) in all BPOE docs, prompts, notes, and session artifacts.
  - Only use formal variants like Rick Ballard when required for legal or investor-facing documents.

- Megazip + CoBlock pairing:
  - When a session delivers a megazip download link to a human, it must also deliver a matching
    CoBlock (PS7 DO block) in the same wave.
  - The CoBlock should:
    - Assume the zip is in the user's Downloads folder by default.
    - Show where it will expand to.
    - Be safe to run multiple times (idempotent where possible).

## Usage

- CoSweep docs should reference this file as the source of truth for front end BPOE.
- Future BPOE docs can refine these rules, but should keep the same intent.
