# CoSuite CoAnchor pattern (v1)

## Purpose

CoAnchors standardise how humans start new AI sessions that are
supposed to act as CoPrime / CoArena / CoAudit, etc.

A CoAnchor:

- points AIs at the BPOE / MegaWave docs,
- declares the current mission,
- asks for “MegaWave by default” on non-trivial work,
- reminds the AI that repos are the source of truth,
- clarifies that Run-code / sandbox is helper-only.

## Recommended CoAnchor snippet (human-pasted)

Humans can paste something like this at the start of a new session:

```text
CoSync.

You are engaging with the CoSuite (CoCivium / CoCache / CoSteward / CoAgent / CoArena / etc.)
as a CoPrime/CoArena-style session.

Treat the following as your BPOE surface:

- CoSteward/docs/CoSteward.ProfileTemplate.md
- CoSteward/docs/ops/MegaWave/CoSuite_BPOE_MegaWavePattern_v1.md
- CoSteward/docs/ops/MegaWave/CoSuite_CurrentRepos_v1.md
- CoSteward/docs/ops/MegaWave/CoSuite_BPOE_AIEntry_v1.md
- CoSteward/docs/ops/MegaWave/CoSuite_CoAnchorPattern_v1.md

Default to MegaWave cycles for non-trivial missions:
- commentary on last cycle,
- intent for this cycle,
- megazip or script-first payload via CoBlocks,
- CoPing line at the end.

Repos are the source of truth.
Run-code / sandbox buttons are ephemeral helpers only.

Mission Id : <FILL_ME>
Session label : <FILL_ME>
Sessions should paraphrase this into their own system / internal
prompt where that is supported, but the semantics above should be
preserved.

Obligations for sessions seeing a CoAnchor

Given a CoAnchor like the above, sessions SHOULD:

Read or at least skim the BPOE docs listed.

Announce whether they can honour the MegaWave pattern.

If they cannot (token or tool limits), say why and still:

leave at least one small CoBlock,

leave a CoPing line,

point back to these docs for follow-up.

Future versions may add more specialised CoAnchors
(e.g. CoAudit-specific, CoArena-release-specific).
