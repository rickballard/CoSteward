# Advisory to Co1: CoCourier Bridge (W10)

## Why you are seeing this

CoSteward and CoGuard sessions have started using **CoBus** as a shared message bus for multi-repo orchestration. Until there is a proper GitHub/filesystem connector bound to each chat, Rick remains the physical courier between:
- repo-truth (CoBus notes, CoGbx views, PRs), and
- chat-window-truth (session memory, instructions).

This advisory explains **CoCourier** (the mitigation layer) and what Co1 should do next.

## CoCourier in one paragraph

**CoCourier** is a simple, structured way to send messages between sessions using CoBus files as envelopes. It does not require a live connector. Instead:
- sessions emit markdown files inside CoSteward/docs/intent/CoBus/courier/YYYYMMDD/,
- each file carries origin_session, intended_sessions, 	opics, summary, and a message body,
- Rick or future automation surfaces these envelopes to the relevant sessions.

CoBus is the wire; CoCourier is the addressing scheme and message format.

## Current state (W9/W10)

Recent work created:
- a **CoGuard Top-100 multi-repo PR wave** (CoAudit, CoIndex, CoSteward, CoAgent, CoArena),
- a **CoBus note** describing that wave,
- a **CoGbx Seed Portal view** in CoIndex, and
- a first **CoCourier_W9** envelope that points multiple sessions at the same wave.

This W10 advisory adds:
- a more detailed CoBus note named CoBus_..._CoCourier_W10.md under:
  - CoSteward/docs/intent/CoBus/notes/<today>/
- this Co1-oriented advisory under:
  - CoSteward/docs/intent/advice/Advisory_Co1_CoCourier_Bridge_W10_v1.md

These should be treated as the first canonical spec for CoCourier behavior.

## What Co1 should do

1. **Adopt CoBus + CoCourier as the default message spine**
   - Do not create parallel ad hoc “bridge” mechanisms.
   - Assume CoBus + CoCourier will be the long-term pattern once connectors exist.

2. **Stabilize the CoCourier schema**
   - Draft CoSteward/docs/intent/CoBus/CoCourier_SCHEMA_v1.md that defines:
     - required fields: origin_session, intended_sessions, 	opics, summary, message, created_utc.
     - optional fields: links, severity, wave_id, sset_ids.
   - Reference the CoGuard Top-100 W9/W10 envelopes as examples.

3. **Integrate with CoIndex / CoGbx**
   - Extend CoGbx seed views so they:
     - link to CoBus notes and CoCourier directories,
     - show a “recent CoCourier traffic” section,
     - highlight any envelopes that mention Co1 in intended_sessions.

4. **Plan for connectors**
   - Assume a near-future world where each chat session has:
     - read/write access to CoSteward and other CoSuite repos,
     - the ability to list and read CoCourier envelopes.
   - Co1 should outline how:
     - multiple sessions can coordinate on the same repo without conflict,
     - CoGuard panels can show live CoBus/CoCourier traffic,
     - CoBloat heartbeat and CoCourier combine to decide when to split or rotate sessions.

## How to treat this advisory

- Consider this W10 artifact the **starting contract** for CoCourier.
- When in doubt, prefer:
  - **CoBus** for persistence,
  - **CoCourier** for routing,
  - **CoGbx** for visibility,
  - **CoGuard** for whether the system is safe and sane.

If any future sessions want to talk about “bridging between sessions”, they should be pushed back onto:
- CoBus notes,
- CoCourier envelopes,
- CoGbx portal views.

This keeps the architecture honest and reduces Rick’s manual copy/paste burden over time.
