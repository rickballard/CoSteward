# BPOE lessons - PR #592 (Academia Shock) - 20251128

## Summary
Docs-only PR tripped guards. Real merge markers were present in docs, and several heavy jobs ran unnecessarily. Below are rules to prevent repeats.

## Rules
- ACK gate first - do not merge until `[x] ACK(CoIndex)` is in the day tracker.
- Prefer `--json | ConvertFrom-Json` in gh pipelines.
- Repos that disallow merge commits - always use: `gh pr merge --squash --auto --delete-branch`.
- Labels - create idempotently, then apply (`docs`, `docs-only`, domain label).
- Docs-only routing - heavy workflows must check labels or use `paths-ignore` for `docs/**` and `**/*.md`.
- Keep the conflict-marker grep in CI and add a local pre-commit grep for `<<<<<<<`, `=======`, `>>>>>>>`.
- If rerun is blocked, push an empty commit to fan out CI.
- When replacing a file from main, fetch raw bytes via gh api with Accept: application/vnd.github.raw to avoid CRLF and `?ref` quirks.
- Strip trailing spaces, enforce LF via .gitattributes.
- For `gh run list`, use `url` field, not `htmlURL`.

## Backlinks
- [/docs/standards/README.md](/docs/standards/README.md)
- [/docs/standards/BPOE/README.md](/docs/standards/BPOE/README.md)
