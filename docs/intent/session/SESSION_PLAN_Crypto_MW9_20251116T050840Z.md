# Session Plan  -  Crypto / MW9 (This Session)

## Session Header

- **Session label**: Crypto / MW9
- **UTC stamp (created)**: 20251116T050840Z
- **Primary repos**: CoCache, CoSteward (plus CoAgent/CoArena later)
- **Primary track(s)**: BPOE AI supplement, CoCore/Crypto, donation rails, metrics/Co1 integration
- **Orchestrator**: Co1 (HP / megascroller target)

## MegaWave Countdown  -  Crypto / MW9 Track

| Wave | Status (at creation) | Scope (short) | Branch | PR | Notes |
|------|----------------------|---------------|--------|----|-------|
| MW9.1  -  BPOE AI supplement seed | Done / landed on feature branch | Minimal BPOE i_prompt_supplement + CoSync note + _mega.manifest.json | feat/mw9.1_crypto-bpoe-seed_20251114T220415Z | (TBD) | Minimal seed; see CoCache BPOE/ai_prompt_supplement and CoSync note. |
| MW9.2  -  BPOE AI supplement v0.1 | PR open | Full poe/ai_prompt_supplement tree + metrics/evolution/experiments/Co1 note | feat/mw9.2_bpoe-ai-supplement_20251115T011625Z | #439 | Seeds default supplement + evolution plan; links to Co1. |
| MW9.3  -  CoCore crypto strawman + modeling plan | PR open | CoCore/insights crypto pair; generic strawman modeling plan; Insights/* → CoCore/insights migration | feat/mw9.3_cocore-crypto-strawman_20251115T032802Z | #441 | Establishes crypto domain spine + generic modeling pattern. |
| MW9.4  -  Crypto donation rails + governance guards (Phase 0) | Planned | Map donation rails patterns into CoCore + BPOE; define Phase-0 guardrails for crypto usage in CoSuite | feat/mw9.4_crypto-rails-phase0_<STAMP> | (later) | Should remain policy-light but structure-ready. |
| MW9.5  -  Metrics wiring + Co1 integration | Planned | Wire MW9.2 metrics & MW9.3 outputs into CoCache metrics/index + hooks for Co1 HP | feat/mw9.5_crypto-metrics-co1_<STAMP> | (later) | Ensure Co1 can megascroll this track. |
| MW9.6  -  HP + site surfacing (stretch) | Stretch | HP/intent checklist integration + basic surface ideas for CoCivium/CoAgent/CoArena | feat/mw9.6_crypto-hp-surface_<STAMP> | (maybe) | Good target for handoff if this session ends early. |

> This table should be updated every major cycle by the active session.

## Intent Checklists (this session)

### A. Wisdom-to-Repo Drain

- [ ] Ensure BPOE / MegaWave description in CoSteward is current (this file + template).
- [ ] Confirm MW9.1–MW9.3 CoSync notes + _mega.manifest.json exist and are up to date in CoCache.
- [ ] Record any new workflow lessons (PS7 patterns, zip usage, branch naming) into BPOE notes.
- [ ] Capture any new “error modes” or human habit insights and route to BPOE.

### B. Co1 / HP / Megascroller Hooks

- [ ] Add this session plan to whatever index Co1 uses for active tracks (HP, manifests, etc.).
- [ ] Ensure all MW9.x waves list branches and PRs, so Co1 can traverse them.
- [ ] Flag any scope creep ideas explicitly as “handoff-to-Co1” instead of silently dropping them.

### C. CoBloat & Human-Fit Notes

- [ ] Track when UX or cognitive load feels too high; note suggestions (e.g., countdown views, PS7 helpers).
- [ ] Note any “too many moving parts” patterns that Co1 should simplify via future tools.
- [ ] Ensure there is always a **single, obvious next action** for a future session picking this up.

## Notes for Future Sessions

- Start by checking this file and the latest CoSync notes under CoCache/docs/intent/advice/notes/.
- Continue the MW9 track (most likely MW9.4+).
- Keep the MegaWave countdown updated here and in session chat.

