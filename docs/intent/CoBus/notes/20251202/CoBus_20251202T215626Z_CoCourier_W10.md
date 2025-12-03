# CoBus CoCourier Note (W10)
id: CoBus-20251202T215626Z
label: CoCourier_W10
origin_session: CoGuard-CoCourier
created_utc: 20251202T215626Z

## 1. Context

We now treat **CoBus** as the canonical in-repo message bus between:
- CoSteward (governance spine)
- CoIndex / CoGbx (portal and views)
- CoAudit (guardrails and metrics)
- CoAgent / CoArena (panels, UX, orchestration)

Sessions like **Co1** cannot yet see the filesystem directly. There is no first-class GitHub or disk connector bound to each chat. Rick is the human bridge between:
- repo-truth (CoBus notes, CoGbx views, PRs), and
- chat-window-truth (session memory and local instructions).

This is misaligned with BPOE rule 1: *make life easier for users*. It also limits parallel orchestration, because every handoff is serialized through manual copy/paste.

## 2. CoCourier: the mitigation layer

**Project CoCourier** is the mitigation plan while we wait for proper GH/filesystem connectors:

- Treat CoBus as the authoritative bus for multi-session coordination.
- Define a simple, explicit **CoCourier envelope** format (YAML/markdown-ish) that sessions can both emit and parse.
- Use CoSteward as a hub for:
  - standardized locations for messages,
  - clear naming and routing conventions,
  - simple scripts that surface and summarize CoCourier traffic for Rick and for future connector-based sessions.

The goal is to enable **many-to-many session orchestration** without forcing the user to be the only courier.

## 3. Envelope design (CoCourier)

A minimal CoCourier message can look like this (conceptually):

- location: CoSteward/docs/intent/CoBus/courier/YYYYMMDD/CoCourier_<stamp>.md
- fields:
  - origin_session: human label for the emitting session (for now: Co1, CoPrime, CoIndex*, CoGuard*, etc).
  - intended_sessions: list of sessions that should notice or react.
  - 	opics: list of tags (CoGuard, CoGbx, CoCourier, CoAnchor, etc).
  - summary: short plain-language summary.
  - message: multi-line, markdown-compatible body.
  - links: pointers to PRs, CoBus notes, CoGbx portal views, advice docs, etc.
  - created_utc: ISO-like timestamp.

Early W9 prototype example:

- origin_session: W9_CoGuardBundle
- intended_sessions: [CoPrime20251128, CoIndex20251128, CoSteward, CoAgent, CoArena]
- message: CoGuard Top-100 wave, CoGbx seed portal, CoBus note path.

This W10 note formalizes that pattern so Co1 and later sessions can treat these envelopes as structured traffic, not random markdown blobs.

## 4. Target architecture (what Co1 should optimize toward)

Target state, once the platform exposes a GH/filesystem connector per chat:

1. **Each session has read/write access to CoSuite repos** (subject to auth and branch policy).
2. **CoBus** is the neutral event log:
   - Sessions append structured notes.
   - Automated scripts summarize, index, and route them.
   - CoIndex/CoGbx exposes views for humans and AIs.
3. **CoCourier** becomes:
   - a naming and schema layer over CoBus, and
   - a set of helper scripts and views for:
     - listing recent envelopes by topic or origin,
     - showing what work is in-flight,
     - warning if two sessions are editing the same region without coordination.

4. **CoPortals / CoGbx**:
   - CoIndex holds AI-facing and human-facing views.
   - CoGbx seed views become the canonical "portal list" for sessions to discover:
     - which assets exist,
     - which sessions own which scope,
     - where to add new work without clashing.

5. **CoGuard**:
   - CoAudit + CoSteward + CoIndex coordinate a Top-100 guardrail index.
   - CoGuard panels in CoAgent / CoArena show guardrail status and open work.

## 5. Near-term work items for Co1 and CoSteward

Short-term, with no connector, Co1 can still do a lot:

1. **Schema stabilization**
   - Declare a stable CoCourier envelope schema in:
     - CoSteward/docs/intent/CoBus/CoCourier_SCHEMA_v1.md (future work).
   - Define required vs optional fields.
   - Clarify naming conventions for files and directories.

2. **Routing conventions**
   - Reserve:
     - CoSteward/docs/intent/CoBus/notes/YYYYMMDD/ for normal CoBus notes.
     - CoSteward/docs/intent/CoBus/courier/YYYYMMDD/ for CoCourier envelopes.
   - Encourage sessions to:
     - always include origin_session and intended_sessions.
     - always include at least one 	opic tag.

3. **CoIndex / CoGbx integration**
   - Ensure CoGbx views include:
     - links to CoBus/CoCourier directories,
     - quick filters by topic (CoGuard, CoCourier, CoAnchor, CoMap, etc),
     - a short “How to listen to CoBus” section for AIs and humans.

4. **CoGuard Top-100 integration**
   - Treat the CoGuard Top-100 PRWave and W9 bundle as the first concrete CoCourier use case:
     - Multi-repo PR wave.
     - CoGbx seed portal in CoIndex.
     - CoBus note that describes the wave.
     - CoCourier envelope that targets multiple sessions.

5. **CoBloat heartbeat**
   - All CoCourier scripts and bundles should surface a simple heartbeat:
     - CoBloat: CU/PU/HU/WT = ...
   - Use this to decide when to rotate sessions or split work into more focused scopes.

## 6. How to use this note

For Co1 and future orchestrator sessions:

- Treat this note as the **anchor specification** for CoCourier W10.
- Do not re-invent another bus:
  - Use CoBus paths.
  - Use CoCourier envelope conventions.
- When designing new products or waves (CoGuard, CoArena, CoMap, CoIndex, etc):
  - ask: “What CoCourier envelopes should this generate?”
  - ensure they are discoverable via CoGbx portals.

CoBus is the message wire.
CoCourier is the addressing and envelope layer.
CoGbx is how everyone sees it.
