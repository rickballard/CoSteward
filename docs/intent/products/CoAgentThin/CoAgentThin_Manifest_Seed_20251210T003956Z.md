# CoAgentThin - internal product manifest (seed)

Products session: Products20251209
Generated at: 20251210T003956Z

## Purpose

CoAgentThin is an internal CoSteward product:
- Headless PS7 CLI plus headless browser driver.
- Uses BPOE, CoAnchor quickstarts, and CoCache sidecars.
- Targets 100x productivity for CoSteward (rick) and future stewards.

## Positioning

- Audience: CoSteward and trusted contributors (not public yet).
- Sits alongside CoAgent full:
  - Reuses CoAgent policies, consent model, and CI where possible.
  - Emits CoTemps status files and CoCache logs for every run.
- Operates from any repo checkout, using that repo as the current "product focus".

## MVP v0.1 scope

In scope:
- PS7 script entrypoint CoAgentThin.ps1.
- Single browser provider (null or one chosen vendor).
- Single LLM adapter (manual ChatGPT paste or OpenAI API).
- Focused scenarios:
  - Products scan for the current repo.
  - Product manifest seed for the current repo.
  - Soft-launch checklist seed.

Out of scope v0.1:
- Full CoArena integration.
- Arbitrary website automation.
- Multi-user orchestration (reserved for CoAgent full).

## Integration notes

- CoCache docs/products/README.md remains the canonical products hub.
- CoAgent README "Productization Manifest" is the template for fields to mirror here.
- This file is a seed; future PRs should:
  - Move detailed spec into CoAgent and/or CoCache.
  - Add a CoSuite hub row for CoAgentThin when ready.
