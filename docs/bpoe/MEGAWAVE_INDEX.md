# BPOE — MegaWave Index
- Standard: see \docs/ops/MEGAWAVE.md\
- Heartbeat adapter: \	ools/heartbeat/CoStatus.Adapter.psm1\
- Nightly status CI: \.github/workflows/nightly-costatus.yml\
"@ },

       # Session Plan living doc for this session (holds plan + intent checklist)
       @{ rel='docs/intent/sessions/RickPublic-Outreach-Plans/SESSION_PLAN.md' ; kind='md' ; content=@"
# SESSION PLAN — RickPublic outreach plans
UTC: 20251115T184804Z

## MegaWave Plan (this session)
- MW-3: DO-block heartbeat-first standardization across affected PR templates.
- MW-2: Nightly CoStatus roll-up + BPOE wiring (cross-repo links minimal).
- MW-1: CloseWave — verify merges, prune short branches, receipts.

## Intent Checklist (live)
- [ ] Outreach pipeline: teaser → CTA flow (RP #25/#26).
- [ ] Pages protections/pr-safety reconcile (RP #14–19).
- [ ] Ensure \Use-CoStatus\ appears first in DO blocks we touch.
- [ ] Write CoSync receipts after each wave.

## Crosslinks
- RickPublic session note: \docs/intent/sessions/RickPublic/SESSION_PLAN.md\ (in RickPublic)
- BPOE MegaWave: \docs/bpoe/MEGAWAVE_INDEX.md\
"@ }
     )},

  @{ slug="rickballard/RickPublic" ; path=Join-Path C:\Users\Chris 'Documents\GitHub\RickPublic' ;
     files=@(
       # Session-side plan + checklist anchored in RickPublic
       @{ rel='docs/intent/sessions/RickPublic/SESSION_PLAN.md' ; kind='md' ; content=@"
# SESSION PLAN — RickPublic outreach plans
UTC: 20251115T184804Z

## MegaWave Plan
- Mirror CoSteward rails; session-specific items live here.

## Intent Checklist (live)
- [ ] Outreach: academia-shock sequence — harmonize teaser/CTA (#25/#26).
- [ ] Triage DIRTY PRs (#14–19): rebase or park with label.
- [ ] Ensure nightly CoStatus CI exists and runs.
- [ ] Add receipts links into README “Status” section.

## Pointers
- Ops truth: CoSteward \docs/ops/MEGAWAVE.md\
- Nightly status artifact: \docs/status/Nightly.md\ (CI)
