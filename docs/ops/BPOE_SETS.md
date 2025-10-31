# BPOE — Sets: Emission & Retrotesting

**Goal:** Every Set ends with a violet receipt and can be retro-verified later.

## Emit
- Use `tools/Emit-SetViolet.ps1 -Slug <slug> -Status <status>` after the final commit for the set.
- Script appends `STATUS/sets.jsonl` and `STATUS/violets.log`.

## Retrotest
- Run the verifier (accepts any violet for the slug within last 24h and any of last 5 shas).
- If verifier misses: re-emit violet on current `HEAD` or investigate missing artifacts.

## Guards
- `tools/Guard-DoubleEmit.ps1` warns on same-day duplicate violets per slug.
- CI: `.github/workflows/set-violet-guard.yml` nudges on duplicate violets in PRs.

## CoTips linkage
- Prefer downloadables when paste fatigue is high; record violet receipts and logs automatically.
- See `docs/ops/COTIPS.md` for rationale and tips.
