# CoBloat Guide v1 – CoPrime20251118

This guide is a first pass at naming and taming 'CoBloat' for CoSteward and the CoSuite.

## Definitions

- **CoBloat**: Any pattern where a session, repo, or workflow accumulates more context than it can safely or sanely handle.
  - Includes token bloat, UI bloat, intent bloat, AdviceBomb bloat, and human cognitive bloat.
- **CoDitto**: Human-side reinforcement signal. Every time a human reiterates a preference or pattern ('CoDitto'), we treat it as a vote to move that pattern into best-practice.
- **CoPrime AdviceBomb**: The current desktop-to-repo ingest bundle:
  - \$adviceBombZipRel\
  - Ingested from C:\Users\Chris\Desktop\Drop_For_Co1 via CoPrime20251118 MegaWaves.

## Inputs for CoBloat thinking

Primary sources for session-bloat wisdom are:

- Triage table:
  - \$triageRel\
- Co1 advisories inside the AdviceBomb payload, such as:
  - Co1_ChatGPT_Login_Persistence_Advisory_v1.md
  - Co1_Mobile_Session_Sweep_Advisory.md
  - Co1_Handover_Intent_CoPrime20251118.md
  - Co1_Handover_Risks_And_Mitigations.md
  - Co1_Session_Wrap_CoCivium_BP_Migration_Report.md
  - Co1_Action_Tickets_Queue.md

These files describe bloat symptoms (login friction, mobile sweeps, handover pain, intent drain) from the human side.

## CoBloat dimensions

At minimum, track:

- **CU (Context Usage)**: How much context the AI needs to be helpful.
- **PU (Payload Usage)**: How much payload / file content is being pushed around.
- **HU (Human Usage)**: How heavily the human brain is being loaded (too many names, concepts, panels).
- **WT (Wait / Time cost)**: Latency, re-logins, time lost to rescues or reloads.

Each dimension can be graded:

- OK
- SOFT
- HARD
- FATAL

CoBloat is when any dimension drifts into HARD or FATAL without a clear CoRotate or CoRescue plan.

## Bloat mitigation primitives

- **CoRotate**:
  - Intentionally rotate to a fresh session with a minimal, repo-driven context.
  - Use AdviceBombs and CoSync notes to move intent, not raw conversation history.
- **CoRescue**:
  - When a session is already in HARD/FATAL, salvage the wisdom and bail.
  - Export, zip, and land on repo; then cut over to a new orchestrator session.

## First working pattern

1. Detect bloat:
   - Use heuristics from \$triageRel\ (login friction, session sweep, handover notes).
2. Decide CoRotate vs CoRescue:
   - If ahead of failure → CoRotate.
   - If mid-failure (e.g. frequent reload / login) → CoRescue.
3. Always route via repo:
   - Use AdviceBombs as the canonical bridge: desktop → repo → new session.
4. Log the move:
   - INBOX_LOG.md for AdviceBombs.
   - CoPrime session-health notes for specific patterns or incidents.

## Next steps

- Refine this guide using specific snippets from the triage candidates.
- Split patterns into playbooks for:
  - ChatGPT sessions
  - Other AI vendors
  - Human-only modes (e.g. writing new CoPortal / CoBeacon docs)
