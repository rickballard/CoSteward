# Co1Req - CoBus / CoSessionRegistry / CoCron strategy (v1)

SessionLabel: CoBusStrategySeed20251128T035734Z
UTS: 20251128T035734Z

## Mission

Design and install the first coherent CoBus / CoSyncPlus strategy for CoCivium, including:

- A bus protocol for Co1Req / Co1Ack / CoAck traffic.
- A CoSessionRegistry that tracks session labels, scopes, and statuses.
- A CoCron pattern (eg GitHub Actions) that reports on pending intent.
- A Co1 duty cycle for processing bus traffic.
- A visible Co1Ack token model that other sessions can present to users.

This is meta-infrastructure for all future CoCivium sessions, including CoPortalPlusGit.

## Requested scope

- CoBus_Spec_v1
- CoSyncPlus_Protocol_v1
- CoSessionRegistry_Spec_v1
- CoCron_StatusReporter_v1
- Co1DutyCycle_Guide_v1
- CoAckToken_Spec_v1
- Co1AckToken_Spec_v1

## Repos

- CoSteward (bus, ops, training)
- CoIndex (manifests, registry entries)
- CoCache (cross repo wiring)
- GIBindex (terms, gibber examples)
- CoCivium (top level docs)
- CoPortal (for reference client once ready)

## Priority

high

## Design outline (for Co1)

1. CoBus / CoSyncPlus

- Define a simple, file based bus living under CoSteward:
  - docs/intent/bus/Co1/inbox
  - docs/intent/bus/Co1/stash
  - docs/intent/bus/Co1/archive (if desired)
- Norms:
  - Co1Req_*: requests to Co1 / CoPrime to orchestrate scope.
  - Co1Ack_*: responses from Co1 to confirm acceptance / progress / completion.
  - CoAck_*: acknowledgements from non Co1 sessions to show they are aligned with a given Co1Ack.

2. CoSessionRegistry

- Create a single registry view that tracks:
  - SessionLabel (eg CoPortalPlusGit, Benedict, Standards, CoPrime20251118)
  - Scope tags (eg CoPortal_Spec_v0, CoBus_Spec_v1)
  - Linked Co1Req ids
  - Linked Co1Ack ids
  - Latest CoSync note path
  - Status (Pending, InFlight, Acked, Parked, Closed)
- Candidate homes:
  - CoSteward/docs/status/CoSessionRegistry_v1.md
  - Mirror entries in CoIndex as structured manifests.

3. CoCron / CoDaemon pattern

- Install one or more GitHub Actions (or similar) that:
  - Periodically scan:
    - docs/intent/bus/Co1/inbox
    - docs/intent/bus/Co1/stash
    - the CoSessionRegistry
  - Emit summary artifacts such as:
    - docs/status/CoBus_Backlog_v1.md
    - issues for Co1 (eg "CoBus backlog - N pending Co1Req")
- These helpers do not decide or merge, they only:
  - Report,
  - Highlight staleness,
  - Provide a to run list for Co1.

4. Co1 duty cycle

- Document how Co1 should start each orchestration wave:
  - Run a CoBus sweep (eg MW_CoBus_SweepAndPlan_v1).
  - Sort Co1Req items by Priority and age.
  - Propose a wave plan (Wave A, Wave B, etc).
  - Allow the human steward to approve the next wave.
- Encode this in:
  - CoSteward Ops Manual.
  - A short helper CoBlock template for CoPrime sessions.

5. CoAck / Co1Ack tokens

- Define small, machine friendly tokens that:
  - Co1 emits when:
    - Accepting a scope,
    - Delivering a milestone,
    - Declaring completion.
  - Other sessions can reference in:
    - CoSync notes,
    - Status blocks,
    - CoPortal surfaces.
- Example fields:
  - ScopeId (eg CoPortalPlusGit_v1)
  - Status (Accepted, InFlight, Complete)
  - UTS
  - Linked bus docs (Co1Req, CoSync notes)
- Track the semantics in:
  - GIBindex (terms: CoAckToken_v1, Co1AckToken_v1).
  - CoIndex (schemas / manifests).

6. Canonical reference clients

- Use CoPortalPlusGit and Seismic/ProtoCoIndex as the first test cases:
  - Process existing Co1Req_CoPortalPlusGit_* via the new CoBus.
  - Emit a Co1Ack for CoPortalPlusGit once CoPortal strategy is accepted.
  - Later, update CoPortal spec and patterns to expose CoAck tokens on the AI facing surface.

## Notes

- This request is additive, not destructive:
  - It should blend with existing CoSync bus notes and any Benedict / CoBrowser framing.
  - CoBrowser and CoPortal should be treated as overlays and patterns on top of the shared CoBus and CoSessionRegistry core.
- This Co1Req does not prescribe naming; Co1 is free to refine term choices
  as long as the bus remains:
  - Repo first
  - Diffable
  - Human and AI readable
  - Non proprietary
