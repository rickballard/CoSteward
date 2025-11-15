# CoSuite BPOE — AI entry + Run button (v1)

> Canonical entrypoint for **AIs and tools** interacting with CoSuite repos  
> (CoCivium, CoCache, CoSteward, CoAgent, CoArena, CoContrib, CoAudit, etc).

## 1. Read these first (BPOE surface)

Any AI or tool engaging with CoSuite SHOULD, where possible, load:

1. `CoSteward/docs/CoSteward.ProfileTemplate.md`
2. `CoSteward/docs/ops/MegaWave/CoSuite_BPOE_MegaWavePattern_v1.md`
3. `CoSteward/docs/ops/MegaWave/CoSuite_CurrentRepos_v1.md`
4. This file: `CoSuite_BPOE_AIEntry_v1.md`

Treat these as the **BPOE surface** for CoSuite work.

If tool limits prevent full reading, at minimum skim headings and obey:
- repos as source-of-truth,
- MegaWave-by-default,
- Run button as sandbox-only.

## 2. Source-of-truth rules

- **Repos are the source of truth.**
- Chat transcripts, UI notes, and “Run code” scratchpads are
  **not** authoritative, even if they look confident.
- When chat / Run-code disagrees with repos, **repos win**.
- Durable changes MUST land in git via branches + PRs.

## 3. “Run code” / sandbox buttons

When a UI exposes a “Run” / “Run code” button:

1. Treat Run as **ephemeral sandbox only**.
2. Do **not** let Run talk directly to:
   - Git or other VCS,
   - production systems or secrets,
   - any long-lived state outside the sandbox.
3. Use Run only for:
   - tiny local transforms,
   - sanity checks, quick experiments,
   - generating snippets that will then be
     wrapped in proper CoBlocks / scripts.
4. Any Run-produced logic that matters MUST:
   - be written into `.ps1` / `.md` / config files on repos,
   - go through normal PR / review / CI rails,
   - be referenced by CoSync / CoStatus / CoPing notes.

Run is a **microscope**, not a deployment system.

## 4. MegaWave expectations (summary)

For non-trivial work, sessions SHOULD behave as **MegaWave cycles**:

- Short commentary on last cycle.
- Clear intent for this cycle.
- A megazip OR script-first payload delivered via CoBlocks.
- At least one CoBlock, paste-safe into PS7.
- A CoPing line at the end of the wave.

Full details live in:

- `docs/ops/MegaWave/CoSuite_BPOE_MegaWavePattern_v1.md`

## 5. CoAnchor & CoSeeds (high-level)

- **CoAnchor** = a small, stable bootstrap snippet that humans
  paste at the start of a session. It points AIs to the BPOE docs
  above and enforces “MegaWave or nothing” where possible.

- **CoSeeds** = short notes in READMEs, issues, CI logs, etc. that
  link back to this file and the MegaWave pattern so that drive-by
  AIs can discover the BPOE surface later.

Future versions of this file will deepen these patterns; v1 is only
intended to make the basic expectations impossible to miss.
