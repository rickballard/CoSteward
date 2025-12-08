# CoBPOE - Advisory Downloads And Session Handoffs (v1)

Generated: 20251207T150614Z

## Intent

Define a Best Practice pattern for passing rich advisories between sessions
(eg. from CoSteward to Outreaches) without relying on repos for everything.

The pattern:

- The AI produces a single advisory file (usually markdown).
- The steward downloads it into their default Downloads folder.
- The steward then drags or uploads that file into the target session.
- The file is self-contained and can be archived on repo later if needed.

## Naming convention (seed)

Advisory file names SHOULD follow this pattern:

- \Advisory_<ToLabel>_From_<FromLabel>_v1_<UTCSTAMP>.md\

Examples:

- \Advisory_Outreaches_From_CoSteward_v1_20251207T120000Z.md\
- \Advisory_BusPlan_From_Outreaches_v1_20251209T093000Z.md\

Notes:

- \<ToLabel>\ and \<FromLabel>\ SHOULD match entries in
  \docs/intent/sessions/CoSessions_Register_v1.md\.
- Version suffix (v1, v2, ...) can be incremented if multiple advisories
  are needed for the same direction and day.

## Steward workflow (manual, seed)

1. The AI suggests that an advisory should be created for another session.
2. The AI emits the advisory content as a downloadable .md asset.
3. The steward saves it in the default Downloads folder.
4. When the steward next visits the target session:
   - They drag-and-drop or upload the advisory .md file.
   - The target session ingests the advisory as context.

Later waves can:

- Add PS7 helpers that scan the Downloads folder for \Advisory_*.md\
  and suggest which session might want them.
- Add CI or CoAudit checks that watch for advisories that never got
  uploaded anywhere and offer to archive them on repo.

## Relation to CoSpill and CoWave

- Advisory files are a deliberate, documented form of cross-session
  CoSpill (tactical, not accidental).
- CoWave CoPings that generate advisories SHOULD:
  - Mention the intended session label.
  - Suggest a file name that fits this BPOE.
  - Remind stewards to drag the file into the target session.

Future versions of this doc can include concrete examples and screenshots.
