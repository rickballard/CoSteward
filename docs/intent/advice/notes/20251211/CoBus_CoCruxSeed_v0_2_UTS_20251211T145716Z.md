# CoBus: CoCrux rails seed v0.2 (20251211T145716Z)

## Context

- Repo: CoSteward
- Path: rails/CoCrux
- Branch: feature/CoCruxSeed_v0_2
- Files:
  - rails/CoCrux/CoCrux.gib
  - rails/CoCrux/CoCruxDeck.json
  - rails/CoCrux/CoCrux.md
  - rails/CoCrux/CoPre_CoCruxHeaderTemplate.txt

## What landed on branch

- CoCrux rails are now a first class rail deck for CoPre and other products.
- GIB tokens include rf, anl, af, zr, mw, cs, wd, bb, sg, cp, tt, nh, glk-, st, am, sp, dr, eb, pf, sm.
- v0.2 semantics add three key rails:
  - CoRetroLoop (rt): small retros, evolve only when gains are worth it.
  - CoEvoNote (en): push important CoEvo findings into CoSteward CoSync notes.
  - CoLangAware (cl): CoLanguage primitives are known and can be invoked without clutter.

## Intended use for CoPre (high level)

- CoPre is expected to read rails/CoCrux/CoCruxDeck.json at start of each session.
- Each wave, CoPre picks the next slice from deck.deck.order (mode cycle, unit slice).
- CoPre injects a thin header using the active slice and its GIB tokens, for example:

    [CoPre v0.4] c
    CoCruxWave: CoSlice.Core
    Omega := rf|anl|af|zr

- The human view stays thin. The rails expand via GIBindex and CoCrux.md.

## Next steps (suggested)

- [ ] Review and squash merge feature/CoCruxSeed_v0_2 into main.
- [ ] Decide which repo owns CoPre runtime wiring (likely CoModules/CoPre).
- [ ] Add a small config in CoPre that points at CoSteward rails/CoCrux or copies them into a local rails folder.
- [ ] Add a CoBus note once CoPre actually consumes CoCrux rails in a live session.

## CoRetro for this wave

- CoCrux rails are now branch landed and zip first verified.
- CoRetroLoop and CoEvoNote are encoded as rails instead of just ideas.
- Further evolution should come after real use in CoPre, not in this setup wave.
