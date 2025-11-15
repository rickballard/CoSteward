# ScriptWave / FixWave Patterns (v0)

Wave: **MW_ScriptWavePatterns_v0**
UTC: **20251114T234935Z**

This document seeds the working patterns for **ScriptWave** and **FixWave** cycles
inside the CoSuite, with CoSteward as the canonical BPOE home for these patterns.

## 1. Goals

a) Make every non-trivial PS7 helper change ship as a **ScriptWave** MegaWave.  
b) Capture **FixWave** patterns for repairing or tightening prior waves.  
c) Keep everything **repo-first**, **zip-first**, and **CoStatus-visible**.

## 2. Definitions

- **ScriptWave**  
  A MegaWave that primarily ships new or upgraded scripts, helpers, or CI rails.
  It must:
  - ship as a single, coherent MegaZip;
  - include receipts (zip name, SHA256, branch, PR, CoStatus);
  - be fully reproducible from the zip and the CoBlock in the transcript.

- **FixWave**  
  A follow-on MegaWave whose intent is to repair, refactor, or clean up:
  - broken or partial ScriptWaves;
  - drift between repos and BPOEs;
  - missing receipts or CoSync notes.

## 3. Canonical locations (CoSteward)

- Pattern docs:  
  - `docs/ops/ScriptWave/ScriptWaveFixWave_Patterns.md`  (this file or its successor)
- Helpers / tooling (future waves):  
  - `tools/ScriptWave/*.ps1`  
  - `tools/FixWave/*.ps1`

## 4. Minimal ScriptWave checklist

1. Prepare MegaWave zip (all assets, all helpers, all docs).  
2. Provide a **single CoBlock** for PS7 which:
   - finds/validates the zip in `~/Downloads`;
   - expands to temp;
   - copies into the right repo paths;
   - creates a short branch from `main`;
   - stages only the intended files;
   - commits with an explicit ScriptWave message;
   - pushes the branch and (optionally) opens a PR via `gh`.

3. Emit receipts:
   - Wave id + zip name;
   - SHA256;
   - branch name;
   - PR URL (or manual-PR instructions);
   - CoStatus line with MW + drift;
   - pointer to any CoSync notes.

## 5. Minimal FixWave checklist

1. Identify broken/partial prior MegaWave.  
2. Prepare a new MegaZip that contains only the **delta** needed to repair.  
3. Ship via a dedicated FixWave CoBlock and branch, leaving a clear trail:  
   - reference prior wave id in commit message and PR body;  
   - ensure old mistakes are **documented**, not hidden.

## 6. Next steps (future waves)

- Move this doc into a richer **ScriptWave Handbook**.  
- Add concrete examples for:
  - multi-repo ScriptWaves;
  - cross-repo FixWaves;
  - ScriptWave → FixWave chains with receipts graphs.

---

This file is intentionally lightweight and seed-like; later waves should refine it,
but must **never** erase the historical intent of this v0 seed.
