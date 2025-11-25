# CoSync Bus Protocol (v1)

Mission: CoPortal_CoStewards_Mission  
Session: CoPortalCoStewards20251124  
Wave: MW_CoPortal_CoStewards_Wave2_v1

This document defines how CoSync Bus notices are written and routed across
sessions and repos in the CoSuite. It exists so that cross-repo or site-level
work is discoverable and durable on repo, not only in chat history.

## 1. Routing targets

### 1.1 Default: Co1 (CoPrime)

Use Co1 as the primary handoff target when:

- changes touch more than one repo
- site deployment or routing is required (e.g. cocivium.org updates)
- CI or cross-repo indexing is involved
- orchestration or prioritisation is needed

### 1.2 Repo-specific sessions

If the required follow-up is scoped entirely to a single repo, suggested targets:

- CoSteward session: stewardship BPOE, CoSync docs, protocols
- CoCivium session: civic platform, public-facing site, CoPortals for civic work
- InSeed cont: InSeed site, whitepaper, exec decks
- CoIndex: indexing manifests, Gibber rails, cross-repo indices
- RickPublic outreach: Substack, outbound narratives, external comms

A CoSync Bus notice may list multiple suggested targets; Co1 remains the safest.

## 2. Urgency semantics

Every CoSync Bus notice SHOULD include an urgency level:

- Urgency: HIGH   – time-sensitive; blocks other work; should be picked up soon
- Urgency: MEDIUM – important but not blocking; pick up in normal flow
- Urgency: LOW    – opportunistic or background; can wait

Optionally include a deadline if there is a real date or window:

- Deadline: YYYY-MM-DD
- or "Deadline: ASAP" if time-sensitive but date-uncertain.

## 3. Required fields in a Bus notice

Each CoSync Bus message SHOULD include:

- UTS timestamp (single source of timing)
- Mission ID
- Session ID
- Wave ID
- ReposAffected (list)
- ChangeType (short phrases)
- RequiredActions (bullet list)
- SuggestedTargetSessions (list)
- Urgency
- Optional Notes

Example skeleton:

\\\
[CoSyncBus][UTS]
Mission: <MissionId>
Session: <SessionLabel>
Wave: <WaveLabel>
ReposAffected:
  - <RepoName>
ChangeType:
  - <Short phrase>
RequiredActions:
  - <Bullet 1>
  - <Bullet 2>
SuggestedTargetSessions:
  - Co1
  - <Other candidate sessions>
Urgency: MEDIUM
Notes:
  - Short free-text context
\\\

## 4. Relationship to BPOE

- CoSync Bus messages are meta-artifacts; they describe work to be done.
- Actual work MUST always be expressed as repo changes (docs, scripts, CI, etc.).
- The Bus is a pointer layer, not a second source of truth.

This v1 protocol may be extended in future waves but should remain backward
compatible whenever possible.
