# CoSync  -  Tiered Execution & CoSync Clarification (v0.1) ♡

When: 11/10/2025 21:48:52
Repo: CoSteward
Branch: docs/ops/tiers-addendum-v0.1

## What changed
- Added **CoSteward Ops Manual  -  Tiered Execution Addendum v0.1** at:
  docs/ops/CoSteward.OpsManual.Addendum.Tiers.md
- Clarifies **Tier-1/2/3/4** capabilities and limits.
- States **Tier-1 requires context injection** (paste/upload) for repo “reads”.
- Aligns CoSync across tiers; decisions require human-select label.
- Sets CoCivia defaults: **advise-only**, widen-first, ♡ watermark, inherit HP57 ACLs.

## Impact on Co1 planning/intent
- Co1 should assume two-way handshake with Tier-1 sessions:
  1) Tier-1 requests context → 2) Tier-2 supplies context.
- MegaWaves that expect helper execution must run in **Tier-2**.
- CI (Tier-3) remains source of enforcement truth (style/frontier/evo guards).
- CoAudit/CoPrime (Tier-4) stay advise-only; no final picks.

## Next steps suggested for Co1
- Reference this addendum from docs/bpoe/INDEX.md.
- Ensure all new waves attach **context packs** for Tier-1 sessions.
- Keep PRs atomic with clear labels: docs, ops, poe.

Internal guidance only. ♡

