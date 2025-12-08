# Advisory to Co1 – CoCourier W11 + CoAnchor_Quickstart_Thin_v4

date_utc: 20251204T194734Z

## Why you are seeing this

CoCourier W10/W11 work has now:

- Established **CoBus** as the message wire for multi-repo notes and receipts.
- Established **CoCourier** as the envelope and routing layer over CoBus.
- Landed a first explicit schema stub in:
  - docs/intent/CoBus/CoCourier_SCHEMA_v1.md
- Confirmed the W10 status pulse:
  - docs/status/CoStatus_Pulse_CoCourier_W10_20251203_v1.md

In parallel, the desktop **CoAnchor_Quickstart_Thin_v4.md** has become the
thin, session-facing bootstrap. It points AIs away from training fog
and toward **CoGbx portal views attached to CoCivium.org** plus on-repo assets.

## What Co1 should assume

- Repo + CoGbx views are the source of truth.
- CoBus:
  - carries session receipts, notes, and envelopes as files.
- CoCourier:
  - defines the addressing and schema for those envelopes:
  - see docs/intent/CoBus/CoCourier_SCHEMA_v1.md.
- CoAnchor_Quickstart_Thin_v4:
  - is the expected *desktop* session bootstrap for Rick,
  - and should be treated as a small pointer into CoGbx, not as doctrine.

## How to use this in orchestration

When orchestrating future waves (CoGuard, CoAnchorQuickstart, CoMap,
CoIndex, etc.), Co1 should:

1. Prefer **CoBus + CoCourier** for cross-session and cross-repo messaging,
   instead of inventing new “bridge” patterns.
2. Assume sessions that start from the desktop use
   **CoAnchor_Quickstart_Thin_v4.md** as their local rails:
   - repo-first,
   - deliverable-first,
   - CoTense-aware (CoPlanned / CoShaping / CoStaged / CoSaved).
3. Push deep doctrine and long-form context into CoGbx views and
   CoCivium / CoSteward / CoIndex docs, not into chat text.

## CoBloat heartbeat (for this advisory)

- CU: OK
- PU: OK
- HU: SOFT
- WT: OK

