# Best Practice Operating Environment - v2

Scope: PS7 scripts, CI, portals, and repo hygiene.

Principles
1) Defaults first - every script runs with sensible defaults if user presses Enter repeatedly.
2) No surprise prompts - if input is needed, explain why, show a suggested or default value.
3) Dry-run first - mutating steps require an explicit -Apply (or equivalent).
4) One-line re-run hint - on mis-paths, print a single copyable command with the right flags.
5) Strict mode - Set-StrictMode -Version Latest and \Stop='Stop'.
6) CoBloat heartbeat - print CU/PU/HU/WT at end of each wave.
7) Receipts - create .sha256 sidecars for zips and important artifacts.
8) Non-destructive by default - backups before edits, placeholders for binary moves.
9) Visibility - echo a short result summary and where outputs were written.
10) Lockdown stance - portals noindex until IP gate says go.
11) Access tiers - crown jewels server-only, sensitive private, public sanitized.
12) Repeatability - scripts can be pasted in one go and are idempotent.

Style for PS7
- Use single quotes in arrays. Avoid fancy punctuation in code.
- Prefer functions for repeat logic (UTS, W, receipt helpers).
- Keep param prompts optional. Scripts must run clean with defaults.
