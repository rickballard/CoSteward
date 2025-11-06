# BPOE: Megazip Waves — Default Workflow

**Scope.** Default, consent-forward way to ship repo upgrades.

## Required
- Zip-first bundles with `.sha256` + Violet Receipt
- Non-interactive CoBlocks (PS7), bounded timeouts
- CI: lint + no-pager + artifact upload
- Ingest path: `CoCache/advice/inbox` + `INBOX_LOG.md`

## Wave Skeleton
- `tools/`, `docs/`, `verify/`, `.github/workflows/`, `receipts/`
- Tag: `mw/<stamp>`

## Anti-Drift
- Prefer **CoBlock** term (flag “DO Block”)
- Reject interactive prompts/pagers in CI

_Linked term_: CoCivium GIBindex → **Megazip Waves**.
