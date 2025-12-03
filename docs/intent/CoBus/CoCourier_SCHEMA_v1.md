# CoCourier Schema v1 (stub)

status: draft
wave: CoCourier_W11
created_utc: 20251203T233353Z

## Purpose

CoCourier defines a simple, structured envelope format for messages carried over
CoBus. CoBus is the wire (files on repo); CoCourier is the addressing and
routing layer. This schema is intentionally small and strict so that future
sessions and products can emit and consume envelopes in a predictable way.

This v1 stub is aligned with:
- CoBus CoCourier W10 note:
  - docs/intent/CoBus/notes/20251202/CoBus_20251202T215626Z_CoCourier_W10.md
- Co1 advisory:
  - docs/intent/advice/Advisory_Co1_CoCourier_Bridge_W10_v1.md

## File placement

Recommended placement for CoCourier envelopes:

- Normal CoBus notes:
  - docs/intent/CoBus/notes/YYYYMMDD/CoBus_<stamp>_<label>.md

- CoCourier envelopes:
  - docs/intent/CoBus/courier/YYYYMMDD/CoCourier_<stamp>_<label>.md

Where:
- YYYYMMDD is local date.
- <stamp> is typically UTS-like (yyyyMMddTHHmmssZ).
- <label> is a short slug (e.g., CoGuardTop100, CoAnchorQuickstart, etc).

## Minimal envelope fields (v1)

Each CoCourier envelope SHOULD expose the following top-level fields:

- origin_session: string
  - Human-readable label of the emitting session.
  - Example: 'CoGuard-CoCourier', 'CoPrime20251128', 'CoIndex20251128'.

- intended_sessions: list of strings
  - List of sessions that should pay attention to this envelope.
  - Example: ['Co1', 'CoPrime20251128', 'CoGuard20251202'].

- topics: list of strings
  - Tags for routing, indexing, and filtering.
  - Example: ['CoGuard', 'CoCourier', 'CoAnchor', 'CoMap'].

- summary: string
  - 1–3 sentence plain-language summary for humans and AIs.

- message: multiline block (markdown)
  - Main body of the envelope.
  - May contain headings, bullets, and links.

- created_utc: string
  - Timestamp, e.g. '20251203T000842Z'.

Optional fields (v1):

- links: list of strings
  - Pointers to PRs, CoBus notes, CoGbx views, docs, etc.

- wave_id: string
  - Name or ID of the MegaWave / wave this envelope belongs to.
  - Example: 'CoGuard_Top100_W9', 'CoCourier_W10'.

- severity: string
  - Hint for urgency. Suggest:
    - 'info' | 'warn' | 'critical'

## Example skeleton

`yaml
origin_session: CoGuard-CoCourier
intended_sessions:
  - Co1
  - CoPrime20251128
  - CoGuard20251202
topics:
  - CoGuard
  - CoCourier
  - CoBus
summary: >
  CoGuard Top-100 PR wave landed across CoAudit, CoIndex, CoSteward,
  CoAgent, and CoArena. This envelope points sessions at the CoBus note
  and CoGbx seed portal.

message: |
  Short narrative body here, referencing:
  - CoBus notes
  - CoGbx portals
  - Related advisories

links:
  - docs/intent/CoBus/notes/20251202/CoBus_20251202T183229Z_CoGuard_PRWave_v2.md
  - https://github.com/rickballard/CoIndex/blob/main/exports/views/CoGbx_SeedViews_v1.md

wave_id: CoGuard_Top100_W9
severity: info
created_utc: 20251203T000842Z
Next steps (for Co1 and future waves)

Validate this schema against existing CoBus + CoCourier notes.

Add examples for:

CoGuard waves

CoAnchorQuickstart

CoMap / CoIndex registry events

Define rules for:

when to split envelopes,

how to handle superseding / follow-up messages,

how CoGuard panels and CoGbx views surface this traffic.
