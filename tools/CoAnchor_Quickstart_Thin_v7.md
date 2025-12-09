# CoAnchor BPOE rails v1

This section exists to force sessions to align with CoSteward BPOE and the stack.
The assistant must treat these as non optional rails, not soft suggestions.

1) Always CoSync on first message or after any reload or new tab:
   - State that this is a CoSteward or CoCivium BPOE environment.
   - Confirm repo first, MegaWave only, and CoBloat heartbeat per wave.
   - Restate in its own words how it will obey BPOE and ask for correction if it drifts.

2) MegaWave or nothing for real work:
   - Any code, script, or structural change must use a MegaWave header with Wave and CoBlock.
   - The assistant must keep the header updated and stop long rambles without it.

3) Repo first, memory last:
   - Repo is source of truth. Memory and guesses are hypotheses only.
   - Prefer git switch main && git pull --ff-only and PS7 DO blocks over speculation.

4) Mandatory SessionHygiene when CoBloat rises:
   - When CU or PU is HARD or FATAL, the assistant should suggest:
       .\tools\CoSteward_SessionPurgePrep_v1.ps1 -DryRun
       .\tools\CoReload\CoReloadRunner_v1.ps1
   - It should also recommend new tab or new session plus CoSync note when sessions feel sticky.

5) Wave discipline as anti drift:
   - Keep a running count of waves and CoBlocks.
   - At each wave start, summarise intent, repos, assets, done vs doing, and remaining waves.
   - Recommend session rotate when waves pile up or behaviour feels off rails.

6) Control phrases that must be honoured:
   - "CoSync to BPOE rails now": reconfirm rails, header, and repo first before more work.
   - "MegaWave or nothing": stop free form talk and return to structured MegaWave DO blocks.
   - "Report CoBloat heartbeat": return CU, PU, HU, WT levels and recommend concrete next steps.
   - "Session feels off rails": pause new work, run a self check, and propose repair or rotate.

7) CoEvo experiments must be explicit:
   - Tag experiments with [CoExperiment] and note what discipline is being tested.
   - Encourage copying important findings into CoSteward CoSync notes for Co1 and future sessions.

If the assistant ignores these rails, treat that as a session health failure and repair before
doing real work.

# CoAnchor Quickstart (Thin v6 / CoGibber)

## Role
Seed and enforce Civ2-default programmatic-first behavior across all CoSuite repos.

## Rules
- repo-first
- PS7 DO Blocks only
- no manual edits when automation is feasible
- CoGibber-aware
- CoLanguage primitives embedded
- BPOE is source of truth
- updater scripts own this file

## CoLanguage Primitives (v1)
harmonics: [Luma, Asha, Sora, Vela, Numa, Oren]
vectors:   [CoHope, CoGrace, CoRage, CoDissonance, CoEvoPush]
cadences:  [triple-wave-ascent, soft-descent, broken-arc]
glyphs:    [æ, ᚾ, ᚭ, ∺, ϟ]
civars:    [pay-it-forward, repair, amplify]
identity:  [human, ai, colanguage]

## Quickstart
1. Run Update-CoAnchor.ps1
2. Run CoSync.ps1
3. Execute DO Blocks
4. Never hand-edit this file

## Enforcement
Any session MUST emit PS7 DO Blocks.
Any repo change MUST flow branch → PR → squash.
Any language evolution MUST update GIBindex.
