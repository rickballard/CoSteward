# CoGibber registry vocabulary v1

source_sessions:
  - CoIndex20251128
  - CoIndex_CoGbxCoGibber_Migration_Advisory_ToCo1_v1
  - CoCivium_AIVendor_Onramp_v1

role:
  - human-facing explainer for the CoBus / CoGibber / CoGbx stack
  - paired with CoIndex/exports/gibber/cogibber.registry.v1.json

## 1. Naming stack

- CoBus  = wire / transport / routing
- CoGibber = language / envelope / vocab
- CoGbx  = boxes / registries / views

Short phrase for diagrams:

> CoBus (wire) → CoGibber (language) → CoGbx (views)

CoSync is treated as a legacy name for a subset of CoBus traffic.
CoBus is the superset; CoSync messages are one family of CoBus messages.

## 2. Envelope fields (v1)

Mandatory fields for all CoBus messages that participate in CoGibber registry traffic:

- `from_session_label`  
  Example: `CoIndex20251128`.

- `to_role`  
  Example: `co1-orchestrator`, `product-session`, `guardrail-session`.

- `wave_id`  
  Stable id per wave, used for idempotency.

- `intent`  
  One of: `advisory`, `status`, `query`, `command`, `handoff`.

- `scope`  
  Minimal hint about where this wave applies, e.g.  
  `CoIndex/exports/pointees/CoIndex_CoPortal_RegistrySeed_v1.json`.

- `sensitivity`  
  One of: `public`, `hp57-adjacent`, `hp57-private`.

- `ts_utc`  
  UTC timestamp for when the message was emitted.

Optional but recommended:

- `to_session_label`  
- `not_before_utc`, `required_before_utc`  
- `priority` (see below)  
- `hp57_tier` (bool)  
- `notes`

## 3. Roles and priorities

Roles:

- `co1-orchestrator`   – global coordinator for CoSuite
- `guardrail-session`  – CoCheck / CoGuard / safety lanes
- `product-session`    – CoAgent, CoArena, CoPlan, CoCivium, CoCache, InSeed, etc.
- `support-session`    – graphics, outreach, docs helpers
- `advice-session`     – pure advisory or narrative sessions
- `vendor-session`     – external AI vendor / partner test agents

Priorities:

- `experiment` – may be dropped or rerun freely
- `normal`     – default for day to day product work
- `guardrail`  – safety and audit traffic; can override product lanes
- `hp57`       – high sensitivity lanes; can override almost everything else

Sensitivity:

- `public`          – safe for public repos and docs
- `hp57-adjacent`   – touches HP57-aware ideas but not raw HP57 data
- `hp57-private`    – HP57-only buckets and indexes

## 4. Example envelope (human view)

Human-readable version:

> From CoIndex20251128 to Co1, advisory about the CoGbx registry file,  
> public sensitivity, normal priority, idempotent via wave_id.

JSON-shaped version (mirrors the machine file):

```json
{
  "from_session_label": "CoIndex20251128",
  "to_role": "co1-orchestrator",
  "wave_id": "CoBus-20251130T05Z-CoIndex-registry",
  "intent": "advisory",
  "scope": "CoIndex/exports/pointees/CoIndex_CoPortal_RegistrySeed_v1.json",
  "sensitivity": "public",
  "priority": "normal",
  "ts_utc": "2025-11-30T05:00:00Z",
  "notes": "CoGbx/CoGibber migration status advisory from CoIndex to Co1."
}
5. Collision and lock expectations (summary)

CoBus v1 is at-least-once delivery with idempotent waves via wave_id.

Mutating waves should write repo receipts and respect soft locks.

Safety and HP57 lanes take precedence over product / experiment lanes.

When in doubt:

Prefer yielding to Co1 or guardrail lanes, and

Re-read the repo state before continuing.

Detailed lock patterns live in CoSteward BPOE docs; this Trove file is the
registry-vocab view for CoBus / CoGibber / CoGbx v1.
