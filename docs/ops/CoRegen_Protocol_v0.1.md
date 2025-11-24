# CoRegen protocol v0.1

## Purpose

`CoRegen` is a single-word trigger that asks the AI to regenerate any volatile artifacts that may have expired or gone missing between waves: sandbox files, download links, previews, or intermediate outputs.

It is not a new question. It is a request to restore the working set so the previous intent can continue.

## What CoRegen means for AIs

When the user sends `CoRegen` (optionally with a short hint like `CoRegen: prompt marker bundle`):

- Assume that any prior sandboxes or ephemeral environments may have been reset.
- Recreate, inside the current sandbox:
  - scripts previously promised for download,
  - markdown / .md deliverables,
  - zip bundles and other artifacts that were linked but may now be stale.
- Re-emit fresh download links.
- Summarise what was regenerated as a short checklist.
- Do not reinterpret the original intent or invent new work unless the user has added new instructions.

If a prior asset cannot be reconstructed exactly, state that explicitly and provide the closest equivalent you can.

## What CoRegen means for humans

- Use `CoRegen` when:
  - a download link fails or feels stale,
  - a session reports that its sandbox was reset,
  - you have refreshed the page mid-wave,
  - you want a clean re-materialisation of the current working set before continuing.

- You do not need to restate the whole prompt. The AI is responsible for tracking which artifacts are in-scope for the current wave.

## Relation to CoPermanence

- CoRegen operates on **non-permanent** artifacts: sandbox files and transient outputs.
- Once an artifact has been moved into a remote repo or other shared service, it is covered by **CoPermanence** instead.
- CoRegen may still recreate local copies (e.g., new downloads) of permanent artifacts when that is convenient.

## Examples

- `CoRegen`
- `CoRegen: reissue all PS7 helper scripts from this wave`
- `CoRegen: regenerate the .md deliverables for Drop_For_Co1`
