# CoGuardRails BPOE v1

CoGuardRails is the internal name for the cluster of practices that combine:

- BPOE Best Practice Operating Environments
- Guardrails and safety limits
- CoTruth anchoring in repos and vaults
- Edge balanced stability and anti capture design

This doc is for CoSteward and CoContrib level operators. The outward facing story
lives in CoCache under docs outreach CoGuardRails_ValueProp_v1.md.

## 1. Principles

- Repo first never trust session memory over Git plus vaults.
- Guardrails first it is better to block a risky helper than to ship fast and regret it.
- Edge aligned design for local operators not for central platform control.
- CoMetaTraining by default common flows become helpers helpers become rails.

## 2. What lives under CoGuardRails

Examples of artefacts that should be tagged or thought of as CoGuardRails:

- CoStart CoSync CoRetro CoRescue CoReload and related session hygiene tools.
- BPOE docs for tone tense inbox handling CoTabBoot local OE.
- Inbox and MegaWave guard helpers hashing receipts logging INBOX_LOG updates.
- Any helper that controls where crown jewel content may or may not go.

When in doubt ask if a thing changes safety trust or capture risk. If yes it is
part of CoGuardRails.

## 3. Design rules for new helpers

When adding a new helper that touches guardrails:

- Prefer small composable helpers over giant scripts.
- Include a clear header comment intent inputs outputs risk level.
- Register it in CoIndex GIBindex with tags including CoGuardRails.
- Decide explicitly whether it is public repo only vault only or mirrored.

If a helper is crown jewel adjacent but still useful design a public skeleton
plus a private vault variant.

## 4. CoBloat and rotation

CoGuardRails also covers how we treat session health:

- Respect CoBloat tiers OK SOFT HARD FATAL.
- On HARD or FATAL recommend rotation and CoRescue tools not brute forcing.
- Keep DO blocks idempotent and safe to rerun.

This keeps rescue tools from becoming new failure modes.

## 5. Linkages

Related docs:

- docs bpoe CoVibe_BPOE_v1.md
- docs bpoe CoSweep_Embedding_In_CoSteward_BPOE_v1.md
- docs bpoe CoFrontEnd_BPOE_CheatSheet_v1.md
- CoCache docs outreach CoGuardRails_ValueProp_v1.md

Over time these should be wired into CoIndex so CoCTA and other agents can
discover and respect CoGuardRails automatically.
