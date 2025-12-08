# CoBPOE – CoWave CoPing Pattern (v1)

Generated: 20251207T130224Z

## Intent

Define a pattern where **each wave/cycle** between a steward and an AI
is represented by a single, self-contained **CoWave CoPing**:

- The AI emits ONE PowerShell block per wave.
- Humans can safely CoPaste the entire block into PS7.
- Only the intended commands execute; all narrative remains comments.
- The PS7 output from that run is the **CoPong**.

This pattern is designed for:

- Stewards who prefer high-level dialogue over low-level code.
- Reducing CoSpill risk from stray markdown/text.
- Making it easy for future CoAgent-like products to replay waves.

## CoWave structure (seed)

A CoWave CoPing SHOULD:

1. Start with a clear header comment:
   - Session label, wave id, timestamp.
   - One-line summary of what the wave will do.

2. Include a CoSpill guard:
   - Check expected repo / path.
   - Warn loudly if the current location is wrong.
   - Allow humans to abort with Ctrl+C or a "NO" answer.

3. Perform its work:
   - Create or update files (docs, scripts, zips) as needed.
   - Prefer idempotent operations and explicit paths.
   - Defer destructive operations to separate, clearly marked waves.

4. Emit a compact CoPong:
   - A short summary of what changed.
   - Optional calls to helpers like CoStatus / CoBloat.
   - Any next steps (for example, git add / git diff suggestions).

All **explanatory text** and coaching for the steward SHOULD be kept as
PowerShell comments within the same block, so a full CoPaste is safe.

## Example CoWave lifecycle (conceptual)

- Dialogue layer (in the browser):
  - Steward and AI agree on the next wave's intent.
  - AI drafts a single CoWave CoPing block.
- Execution layer (in PS7):
  - Steward copies the entire CoWave block into PS7.
  - CoSpill guard verifies repo / context.
  - Work runs; CoPong is printed at the end.
- Reflection layer:
  - Steward reviews CoPong + git diff.
  - Steward accepts or rejects changes via normal git workflows.
  - Next wave builds on this state.

## Relation to CoSpill and CoStatus

- CoWave CoPings SHOULD include lightweight CoSpill guards to reduce
  accidental pasting into the wrong panel or repo.
- CoWave CoPongs MAY call CoStatus (or similar helpers) to show:
  - Browser / system health (CoBloat tiers).
  - Session heartbeat metrics.
  - Any warnings that might affect future waves.

## Open work

- Decide where CoWave lives in the GIBindex lexicon and how it relates
  to existing terms (CoPing, CoPong, MegaWave, CoStatus, etc.).
- Define naming conventions for CoWave ids across repos.
- Extend CoWave patterns to:
  - Headless CoAgent / CoArena flows.
  - Multi-repo waves orchestrated by Co1 / CoPrime.
- Add more concrete examples, including MegaZip / AdviceBomb workflows.
## Why CoWave feels like a breakthrough (seed)

From a CoSteward point of view, CoWave is not just a style preference:

- It reduces friction:
  - One CoPing per wave means fewer chances to mis-copy or mis-select blocks.
  - Stewards can treat each wave as a single, replayable unit of work.
- It improves trust:
  - Each wave leaves behind concrete artefacts (files, diffs, CoPong output).
  - Long thinking periods are tied to visible payloads instead of silence.
- It is product-friendly:
  - CoAgent-style tools can record and replay CoWaves deterministically.
  - CoSpill guards inside CoWaves lower the risk of cross-session accidents.

Future versions of this doc can show worked examples from real sessions and
describe how CoWave interacts with MegaWave packaging and AdviceBomb zips.
