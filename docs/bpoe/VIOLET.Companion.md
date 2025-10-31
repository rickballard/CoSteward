# VIOLET Companion (BPOE-aligned)

This companion summarizes operational patterns that complement the canonical VIOLET stores.

## Canonical Stores
- `docs/ops/RECEIPTS.md` (durable list)  ·  `STATUS/receipts.csv` (append-only)
- `docs/ops/HANDOFFS.md`  ·  `STATUS/handoffs.csv`

## CI Quieting (docs-only label)
Add `docs-only` label to PRs; gate noisy jobs with:
```yaml
if: ${ github.event_name != 'pull_request' || !contains(join(github.event.pull_request.labels.*.name, ','), 'docs-only') }
```

## UTF-8 / LF Hygiene
Prefer `.editorconfig` + `.gitattributes` to standardize encodings and reduce churn.

## Backlogs & Fences
Optionally fence “envisioned” backlog blocks with `VIOLET:IGNORE-LINKS` markers (wire CI later).

## Render Cadence
Establish policy: light “vitals” scans often; heavy renders on a cadence.

_Source of truth remains the canonical stores; this page is a pointer pack._
