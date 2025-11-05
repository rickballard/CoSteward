# CoTips (Repo-first)

This page collects small, enforceable practices for CoStewards who work **directly with repos** (without a containerizer like CoAgent). Keep entries short, testable, and repo-first.

> **Scope of this PR:** placeholder + link only. Deep content will be added in subsequent PRs.

## Open Topics Queue
1. Here-strings & ticks in CoPingPong — prefer emitted files over giant DO blocks.
2. Megazip (BPOE default for speed) — one datestamped zip to Downloads + tiny DO; promote via PR.
3. Downloadables policy — timestamped, SHA-256, disposable; repo is source of truth.
4. Violet receipt usage — optional if PR/CI green.
5. Session hygiene — `git switch main && git pull --ff-only`; idempotent DO; leave a trail.
