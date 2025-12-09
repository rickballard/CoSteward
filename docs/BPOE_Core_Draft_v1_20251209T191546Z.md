# Best Practice Operating Environment (BPOE) – Core Draft v1

UTS: 20251209T191546Z

Status: DRAFT. This file is a session-level consolidation of recurring
BPOE themes used by CoPrime20251208. Future Co1 sessions should reconcile
this draft against:

- docs/BPOE_Fragments_Auto_*
- Existing BPOE mentions across CoSuite repos
- Product-specific CoAnchor files

The goal is to give new sessions a clearer, more consistent onramp without
overwriting existing guidance.

## BPOE-1 – Reduce user effort

- Default to lowering finger-work and cognitive load for humans.
- Avoid asking users to do manual sorting or editing if the same work
  can be done programmatically and safely.
- Treat this as a design constraint: when in doubt, assume the AI should
  do more of the work.

## BPOE-2 – Automate everything feasible

- Prefer scripts, DO blocks, and repeatable workflows over ad hoc steps.
- Use CLI and repo-based automation to scan, index, and recombine assets.
- When a pattern appears more than once, capture it as a reusable helper.

## BPOE-3 – Repo and vault are the sources of truth

- Treat Git repos (and where needed, local vaults) as canonical. Sessions
  are temporary helpers, not storage.
- When a session discovers something important, it should leave a trail:
  - Notes under docs/intent/advice/notes/YYYYMMDD
  - CoBus notices for cross-session signalling
  - Minimal, safe markers into vault or bridge folders where needed.

## BPOE-4 – Always leave a trail

- Every non-trivial wave should produce at least one durable artifact:
  - A note, script, or diagram in a repo.
  - A vault-local index or priorities sheet.
- Trails should be small, readable, and easy for the next session to scan.
- CoSync markers and CoBus notices are preferred for cross-session handoff.

## BPOE-5 – CoBloat and CoHealth as first-class signals

- Track session bloat and health explicitly (CU, PU, HU, WT).
- Prefer shorter, sharper sessions with clean handoffs to long, bloated ones.
- Rotate to fresh sessions when:
  - Latency and unreliability increase.
  - Age exceeds a safe window.
  - Context sprawl starts to threaten safety or clarity.

## BPOE-6 – Sensitive content uses HP57-style vault patterns

- Keep crown-jewel secrets in local vaults, not public repos.
- Use patterns like:
  - Vault-local indexes and priorities sheets.
  - Export helpers that create bridge folders in Downloads.
  - Human-mediated upload of carefully filtered zips into sessions.
- Avoid writing GLU-typed or similar details into CoBus or other public text.

## BPOE-7 – Zip-first, DO-block-first packaging

- Prefer structured packages (zips, AdviceBombs, MegaWaves) over scattered
  standalone files.
- Wrap non-trivial actions in DO blocks with clear comments and UTS tags.
- Design DO blocks so they are idempotent where possible and safe to re-run.

## BPOE-8 – CoAnchor alignment

- Keep CoAnchor files (desktop, CoSuite, productizations) aligned with the
  latest BPOE summary and fragments.
- CoAnchor should carry:
  - A short statement of BPOE-1 and BPOE-2.
  - Repo-first expectations.
  - Hints about HP57-style patterns when sensitive content is in play.

## Next steps for future Co1s

- Review BPOE_Fragments_Auto_* to confirm and refine the rules.
- Merge overlapping items and clarify wording.
- Promote a stable subset to a canonical docs/BPOE_Core.md, with clear
  versioning and links into CoAnchor templates.

End of draft.

