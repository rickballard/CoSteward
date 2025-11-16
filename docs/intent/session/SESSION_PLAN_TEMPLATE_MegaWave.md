# Session Plan — MegaWave-Enabled (Template)

> Use this file as a template. Copy to a new file per-session, adjust title + metadata, then track MegaWaves and intent checklists here.

## Session Header

- **Session label**: <e.g., Crypto / MW9>
- **Date range**: <YYYY-MM-DD to YYYY-MM-DD>
- **Primary repos**: <CoCache, CoSteward, CoAgent, CoArena, ...>
- **Primary track(s)**: <e.g., BPOE, CoCore/Crypto, Metrics>
- **Orchestrator**: Co1 (master HP + megascroller target)

## MegaWave Definition (BPOE-aligned)

A **MegaWave (MW)** is a numbered, branch-backed, zip-seeded change-bundle that:

- Is anchored to one short-lived feature branch.
- Has a MegaWave zip or equivalent as payload source (when applicable).
- Writes a _mega.manifest.json listing all wave contents.
- Writes at least one CoSync note under docs/intent/advice/notes/YYYYMMDD/.
- Is designed to be readable and replayable by Co1 and other sessions.

## MegaWave Countdown (Template)

| Wave | Status | Scope (short) | Branch | PR | Notes |
|------|--------|---------------|--------|----|-------|
| MWx.y | Planned / In-flight / Done | <scope> | <branch> | <PR#> | <short notes> |

> Update this table every cycle in the session and on each significant wave event (branch cut, PR open, PR merge).

## Intent Checklist(s)

Use these checklists to make sure wisdom is drained from session memory to repos.

### 1. Wisdom-to-Repo Drain

- [ ] All important ideas captured into BPOE notes or CoCore/insights.
- [ ] All MegaWave zips have _mega.manifest.json and CoSync notes.
- [ ] All significant errors / UX issues recorded as BPOE lessons.
- [ ] Any scope creep ideas captured into a “Later / Co1” bucket and *not* silently dropped.

### 2. Co1 Integration Hooks

- [ ] This session plan is referenced from Co1’s HP or will be linked there.
- [ ] Any new metrics or indexes specify how Co1 should wire them.
- [ ] Cross-repo links (CoCache, CoSteward, CoAgent, CoArena, etc.) included.

### 3. CoBloat + Human UX

- [ ] CoBloat heartbeat (CU/PU/HU/WT) recorded each major cycle.
- [ ] Noted when scope felt too wide; flagged for Co1 to adjust future templates.
- [ ] Any friction in PS7 workflows noted for tooling upgrades.

## Notes for Future Sessions

- How to pick up this track.
- Known sharp edges.
- Pointers to PRs, branches, and MegaWave zips.
