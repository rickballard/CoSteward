# CoSync — CoPortalPlusGit bus registration (20251126T193459Z)

SessionLabel: CoPortalPlusGit20251126T193459Z
Repo: CoSteward

## What this wave did

1. Created Co1 bus roots in CoSteward:

   - docs/intent/bus/Co1/inbox
   - docs/intent/bus/Co1/stash

2. Registered a Co1Req for the CoPortal+Git mission:

   - docs/intent/bus/Co1/inbox/Co1Req_CoPortalPlusGit_*.md

   The request:

   - Defines the CoPortalPlusGit mission:
     - Stand up CoPortal spec v0.
     - Integrate CoSteward and CoBeacon patterns.
     - Prepare CoPortal as the canonical AI-facing front door pattern for CoSuite repos and future CoAlliance/Git outreach.
   - Declares requested scope tags:
     - CoPortal_Spec_v0
     - CoPortal_Pattern_CoSteward_v1
     - CoPortal_Pattern_CoBeacon_v1
     - CoPortal_Standards_Overlay_v1
   - Lists repos:
     - CoPortal, CoSteward, CoCivium, CoIndex, GIBindex, CoCache, CoCacheGlobal
   - Marks priority: high.

3. Stashed (or reserved a slot to stash) the CoPortal Standards handoff pack from the Standards session:

   - docs/intent/bus/Co1/stash/CoPortal_Standards_HandoffPack_v1.md

## Intent for Co1 / CoPrime

- Treat the Co1Req_CoPortalPlusGit_* note as the canonical request to:

  - Install or evolve a CoSessionRegistry that can track session labels, scopes, repos, and statuses over time.
  - Decide how Co1/CoPrime wants to name and shape the bus (CoSync, CoBus, CoSyncPlus, etc.).
  - Emit a Co1Ack token for the CoPortalPlusGit scope once the strategy is in place.

- The Standards handoff pack contains global best-practice and TOON overlays for CoPortal and should be used as input to any CoPortal_Spec_v0 work.

## Intent for future CoPortal+Git waves

- After Co1 emits a Co1Ack for CoPortalPlusGit:

  - Stand up CoPortal/docs/specs/CoPortal_Spec_v0.md in the CoPortal repo.
  - Split and install the Standards handoff pack into:
    - CoPortal_Standards_Overlay_v1 (in CoPortal)
    - CoIndex manifests for CoPortal/CoAck schemas
    - GIBindex terms as needed (e.g., CoAck_Token_v1 / Co1Ack_Token_v1)
  - Use CoPortal as a reference client for any upgraded CoBus/CoSyncPlus protocol.

This note closes the current CoPortal+Git wave as "registered with Co1; awaiting Co1Ack and bus protocol from CoPrime/Co1".
