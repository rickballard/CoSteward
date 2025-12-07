# CoBus / CoSync bus BPOE v1

source_sessions:
  - CoIndex™20251128
  - CoIndex™_CoGbxCoGibber_Migration_Advisory_ToCo1_v1
  - CoCivium™_AIVendor_Onramp_v1
  - CoBus_CoGibber_SpecSeed_v1

role:
  - define minimal, enforceable BPOE for CoBus / CoSync usage
  - pair with cogibber.registry.v1.json + CoGibber_Registry_Vocab_v1.md

## 1. Naming stack and legacy terms

- CoBus   = wire / transport / routing
- CoGibber = language / envelope / vocab
- CoGbx™   = boxes / registries / views

Short phrase for diagrams:

> CoBus (wire) → CoGibber (language) → CoGbx™ (views)

CoSync is treated as a **legacy name** for a subset of CoBus traffic:

- human-facing notes under `docs/intent/advice/notes/YYYYMMDD/CoSync_*.md`
- may later gain machine echoes, but remains a named family of CoBus messages.

New work SHOULD use CoBus / CoGibber / CoGbx™ phrasing.

## 2. CoBus envelope (v1)

Canonical machine-face:

- `CoIndex™/exports/gibber/cogibber.registry.v1.json`
- `CoSteward™/docs/trove/CoGibber_Registry_Vocab_v1.md`

Required fields (MUST):

- `from_session_label`
- `to_role`
- `wave_id`
- `intent`
- `scope`
- `sensitivity`
- `ts_utc`

Optional fields (SHOULD where helpful):

- `to_session_label`
- `not_before_utc`, `required_before_utc`
- `priority`
- `hp57_tier`
- `notes`

Roles, priorities, and sensitivity enums follow the Trove doc.

## 3. CoBus lanes per repo

Unless otherwise specified, each repo SHOULD treat these as canonical v1 lanes:

- `docs/intent/cobus/inbox/`
  - incoming CoBus messages for that repo (JSON/JSONL)
- `docs/intent/cobus/receipts/YYYYMMDD/`
  - CoBus receipts emitted by waves that mutated that repo
- `docs/intent/advice/notes/YYYYMMDD/CoSync_*.md`
  - human-facing CoSync notes (CoBus subset)

Additional lanes (e.g. `metrics`, `alerts`) MAY be added as long as they do not conflict with the base layout.

## 4. BPOE: when to read the bus

MUST:

- At **session startup**, for each repo the session expects to touch:
  - read `docs/intent/cobus/inbox/` if present
  - scan recent `docs/intent/advice/notes/*/CoSync_*.md` for that repo

- Before any DO-block that **mutates**:
  - a public repo, or
  - an HP57-adjacent or HP57-private scope.

- At **session shutdown**, if the session:
  - mutated shared scopes, or
  - emitted CoBus receipts or locks.

SHOULD:

- For long waves, re-read relevant CoBus lanes periodically
  (for example every few DO-blocks or every ~10–15 minutes of active work).

MAY:

- Ignore lanes clearly unrelated to the session's declared repos and roles.

## 5. BPOE: what to write back (receipts)

Any DO-block that mutates shared scopes MUST emit a CoBus receipt:

- location:
  - `docs/intent/cobus/receipts/YYYYMMDD/CoBus_<wave-id>.json`
- minimal payload:
  - `from_session_label`
  - `to_role`
  - `wave_id`
  - `scope` (short description and/or list of paths)
  - `sensitivity`
  - `ts_utc`
  - `status` ∈ { `success`, `soft-fail`, `hard-fail` }
- optional:
  - `priority`, `hp57_tier`, `notes`, and any repo-specific fields

Receipts are the **primary audit trail** for orchestration. Locks are layered on later waves.

## 6. Roles and yield rules

Roles (per Trove):

- `co1-orchestrator`
- `guardrail-session`
- `product-session`
- `support-session`
- `advice-session`
- `vendor-session`

Yield rules (v1):

- Any wave tagged with `priority = guardrail` or `priority = hp57`
  and addressed to a repo/scope SHOULD be treated as higher priority than
  product or experiment waves on the same scope.
- Co1 MAY emit CoBus messages that other sessions MUST obey when:
  - `to_role = product-session` or `guardrail-session`, and
  - `priority ∈ { guardrail, hp57 }`.

Product sessions:

- MUST follow the read/receipt rules for their primary repo(s).
- SHOULD leave CoSync notes for major structural changes and new rails.

Guardrail sessions:

- MUST tag messages appropriately and MAY declare soft locks or vetoes
  for unsafe waves (future spec).

## 7. Collision policy (v1)

Locking model for v1:

- No hard locks enforced by default.
- Preferred pattern:
  - distinct branches / lanes for different waves,
  - convergence via PRs instead of direct multi-writer traffic on `main`.

Collision stance:

- Receipts + git history form the canonical record of who touched what, when.
- When collisions occur:
  - `priority = hp57` or `guardrail` waves take precedence,
  - Co1 adjudicates when needed.

Lock files under `docs/intent/cobus/locks/` are allowed but considered v1.1+.
This BPOE does not require them yet.

## 8. Evolution hooks

This BPOE is v1 and intentionally light:

- Future waves MAY:
  - add `cogibber.cobus` vocab files,
  - add per-repo CoBus adapters,
  - formalize lock file schemas and enforcement.

Any such evolution SHOULD:

- remain backward compatible with this v1 envelope, and
- keep git + on-repo receipts as the primary source of truth.

