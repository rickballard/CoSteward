# CoPrime_IntentCloud2025 Mission Plan (v1)

Mission Id: CoPrime_IntentCloud2025_Mission

This document anchors the CoPrime_IntentCloud2025 mission on repo so that
future sessions do not rely on transient memory.

It assumes:

- CoSteward is the personal ops and intent hub.
- CoCache is the advice and inbox hub.
- CoAgent and CoArena are the main product surfaces for this mission.
- MegaWave is the default pattern for non-trivial work.
- Guardrail Grenades (GG) and CoAnchors are used to align AI sessions.

---

## 1. Stage 0 - BPOE and AI entry hardening (current wave)

Status: in progress, with core docs seeded on CoSteward.

Key assets:

- MegaWave BPOE and repo map
  - docs/ops/MegaWave/CoSuite_BPOE_MegaWavePattern_v1.md
  - docs/ops/MegaWave/CoSuite_CurrentRepos_v1.md
  - Seeded via PR #159

- AI entry and CoAnchor BPOE
  - docs/ops/MegaWave/CoSuite_BPOE_AIEntry_v1.md
  - docs/ops/MegaWave/CoSuite_CoAnchorPattern_v1.md
  - tools/bootstrap/New-CoSuiteBootstrapPrompt.ps1
  - Seeded via PR #164

- CoAnchor Quickstart / Guardrail Grenade (GG)
  - Local and repo variants of a CoSuite CoAnchor Quickstart file
  - Used as a drag-and-drop Guardrail Grenade into new AI sessions
  - Purpose is to enforce:
    - repos as source of truth,
    - MegaWave-by-default,
    - Run-code as sandbox only,
    - session labels and CoPing receipts.

Planned communication:

- A Substack article that:
  - introduces Guardrail Grenades,
  - explains CoSuite CoAnchors and MegaWaves,
  - links back to CoSteward / CoCivium as the canonical source.

---

## 2. Stage 1 - CoAgent and CoArena alignment

Objective:

- Align CoAgent and CoArena repos with the new BPOE and AI entry patterns,
  so that any CoAgent / CoArena oriented AI session can use CoAnchors and
  MegaWave cycles by default.

Key activities (future waves):

- Run tools/intent/Verify-CoPrime_IntentCloud2025State.ps1 (or equivalent)
  to snapshot current mission state.
- Map existing CoAgent and CoArena docs, issues and prototypes against:
  - CoSuite_BPOE_MegaWavePattern_v1.md
  - CoSuite_BPOE_AIEntry_v1.md
  - CoSuite_CoAnchorPattern_v1.md
- Propose branches and PRs that:
  - add CoAnchor Quickstarts or GGs to relevant repos,
  - update READMEs to point at the BPOE surface,
  - add CI hooks or helper scripts that make MegaWave flows easy to run.

---

## 3. Stage 2 - CoArena GitHub test release

Objective:

- Ship a CoArena test release via GitHub that:
  - can be installed or run by early testers,
  - uses CoAnchors / GGs to keep AI behaviour aligned,
  - has clear CoStatus / CoSync notes and receipts.

Planned outcomes:

- A tagged CoArena release on GitHub for early testing.
- Operator docs that:
  - explain how to start Guardrail Grenade aligned sessions,
  - show how CoArena interacts with CoCache and CoSteward,
  - describe how to read CoPing and CoStatus receipts.

---

## 4. Stage 3 - External communication and ecosystem on-ramps

Objective:

- Make it easy for humans and AIs outside the core CoSuite to discover
  and adopt Guardrail Grenades and CoSuite style workflows.

Examples:

- Substack posts (and later site pages) on:
  - Guardrail Grenades (GG),
  - CoAnchors and MegaWaves,
  - repos as source of truth vs chat scratchpads,
  - Run-code as microscope, not deployment.

- Public quickstarts:
  - how to download and pin a CoAnchor Quickstart file,
  - how to drag it into a new session,
  - how to fill in mission and session labels.

---

## 5. Checklist for this mission plan

This checklist is intentionally high level and will be refined by future
MegaWaves.

- [x] Seed core MegaWave BPOE and CurrentRepos docs (CoSteward PR #159).
- [x] Seed AI entry and CoAnchor BPOE docs + bootstrap helper (CoSteward PR #164).
- [ ] Finalise and commit CoSuite CoAnchor Quickstart GG on repo.
- [ ] Align CoAgent and CoArena repos with AI entry and CoAnchor BPOE.
- [ ] Publish the first Guardrail Grenade / CoAnchor article on Substack.
- [ ] Ship a CoArena GitHub test release for early adopters.

This document should be updated rather than replaced where possible.
New versions can be created as _v2, _v3, etc. if needed.
