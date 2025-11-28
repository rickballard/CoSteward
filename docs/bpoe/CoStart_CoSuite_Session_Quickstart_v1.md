# CoStart – CoSuite Session Quickstart v1

Role: Give new CoSuite sessions a common starting rail so they:
- align to CoSteward and CoIndex instead of chat memory
- leave a trail on repo (CoSync, CoStatus, CoSessionRegistry, PRs)
- use PS7 / CoBlock patterns safely

This file is meant to be:
- kept somewhere handy by humans (for example Desktop)
- dragged into the first message of a new CoSuite session
- treated by the AI as a session bootstrap contract

---

## 0. When the AI sees this file

The AI should:

1. Recognize this as a CoSuite session quickstart (CoStart).
2. Ask briefly for:
   - session mission (1 to 2 sentences)
   - repo focus (for example CoSteward, CoCivium, CoIndex, InSeed, RickPublic)
   - human handle (for example Rick)
3. Treat the combination of:
   - this CoStart quickstart
   - CoSteward Ops rails
   - CoIndex seed assets
   as the canonical operating context for the session.

The AI should assume its job is to:
- align work with BPOE rails
- keep important intent on repo, not only in chat
- avoid large plans that are not grounded in on repo docs

---

## 1. Core rails to respect

### CoSteward – ops and session health

- CoSteward Ops Manual
  - docs/ops/CoSteward_Ops_Manual_v1.md

- CoStatus pulses (lag, stall, rotate hints)
  - docs/intent/CoStatus_Pulses_v1.md

- CoSessionRegistry (long running sessions and handoffs)
  - docs/intent/CoSessionRegistry_v1.md

- CoCron intents (recurring jobs)
  - docs/intent/CoCron_v1.md

- CoStatus SessionHealth spec (CU, PU, HU, WT tiers)
  - docs/bpoe/CoStatus_SessionHealthSpec_v1.md

### CoIndex – where assets and rails are listed

- Seed assets for the index
  - CoIndex/docs/intent/CoIndex_SeedAssets_v1.md

- Helper / schema docs for how assets should be represented
  - CoIndex/docs/helpers/ProtoCoIndexHelper_v1.md (or successors)

The AI should prefer to:
- evolve existing assets that live in these paths
- avoid making new doctrine that lives only in chat

### CoCivium – heartbeats and bus

- CoCivia heartbeat and event rails
  - CoCivium/docs/intent/bus/CoCiviaHeartbeat_Spec_v1.md
  - CoCivium/docs/intent/bus/CoBus_Events_Spec_v1.md
  - CoCivium/docs/intent/bus/CoBus_Events.md

On CoPrime / Co1 sessions, the AI should:
- ask for the latest heartbeat and CoSync notes before inventing new directions

---

## 2. PS7 / CoBlock expectations

Humans often run PS7 as the action pane.

The AI should assume that:
- any PowerShell code block may be pasted directly into PS7
- CoBlocks should be self contained and clear

Preferred pattern:

`powershell
# [NN] ███ DO BlockName_v1
Write-Host ""
Write-Host "== BlockName_v1 =="
Write-Host ""

Stop = 'Stop'
Set-StrictMode -Version Latest

# body

# /DO
Error handling:

when PS7 output shows errors from a block the AI suggested

the AI should repair the block and reissue a clean version

avoid continuing the plan until the error is fixed or explicitly parked

3. Branch, PR and CoSync expectations

For non trivial work in CoSuite repos the default pattern is:

Short branch from main.

One or more CoBlocks that:

make local changes

run basic checks

stage, commit, push and open a PR

Squash merge to main once the branch is coherent.

Each significant session should also leave:

CoSync notes under docs/intent/advice/notes

CoStatus pulse entries for lag and rotate hints

CoSessionRegistry entries for long running or important sessions

The AI should never treat chat history as the only store of:

why a decision was made

what next steps exist

which branches are important

4. CoRegen and sandboxes

If the human says CoRegen the AI should assume:

earlier sandboxes or download links may have expired

scripts, docs or zips promised earlier may need to be recreated

CoRegen behaviour:

recreate promised artifacts from the current wave

emit fresh download links

say what could not be reconstructed and why

5. Meta

This quickstart itself is an asset.

Meta:

schema_id : ASSET_SCHEMA_Quickstart_Session_v1

canonical? : yes (for seed stage, until replaced)

home_repo : CoSteward

path : docs/bpoe/CoStart_CoSuite_Session_Quickstart_v1.md