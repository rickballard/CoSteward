# CoVault Inventory BPOE – v1

> UTS: 20251209T001415Z

## Purpose

Define best practice for running heavy CoVault inventory and stress-test workflows so they are:

- Safe (read-only on vault).
- Measurable (metrics captured).
- Reproducible (BPOE on repo).
- Tied into CoLag and CoBloat.

## Scope

This BPOE applies to any workflow that:

- Produces inventory listings, metrics, or baselines.
- Feeds CoLag or CoBloat with capacity or health signals.

## Recommended practice

- Run inventory sweeps as read-only dry-runs only.
- Keep all outputs under `\\Server\\CoCiviumAdmin\\VaultInventory`.
- Treat each run directory as immutable evidence for later review.
- After each major sweep:
  - Generate a baseline metrics JSON file.
  - Record UTS, run directory, and metrics in a handoff note if other sessions will use it.

## Speed and load guidance (initial)

- Full vault inventory is allowed when:
  - System load is low.
  - No other I/O critical tasks are running on the vault machine.
- Suggested cadence:
  - Heavy full sweep: at most once per day in normal conditions.
  - Lighter or scoped sweeps (subset or hashes): as needed for diagnostics.

## CoLag and CoBloat integration

Inventory baselines should expose at least:

- `totalFiles`
- `totalDirs`
- `totalBytes`
- `avgDepth`
- `maxDepth`
- `elapsedSecs`

Use these as reference points for:

- Capacity charts in CoLag.
- CoBloat warnings when runs get slower or much larger than expected.

Initial heuristics (tune as data accumulates):

- SOFT warning tier when elapsedSecs grows by about 50 percent over a stable baseline.
- HARD warning tier when elapsedSecs doubles or more, or when totalBytes or totalFiles spike well beyond expected growth bands.

## Session discipline

- Each inventory session should:
  - Start with a clear DO-block marker comment.
  - End with a short human-readable summary of what was scanned and where outputs live.
  - Avoid any write or delete operations inside the vault root.

## Handoff expectations

- When Co1 or Outreaches need to reason about vault load:
  - Point them to the latest baseline run directory under `VaultInventory`.
  - Include the baseline metrics JSON path in the advisory note.
  - Mention any anomalies (for example, sudden jumps in depth or bytes).

## Evolution notes

- As more baselines are collected over time:
  - Update this document with empirical thresholds.
  - Add examples of CoLag or CoBloat dashboard views.
  - Split out additional BPOE files if other heavy vault workflows emerge.

