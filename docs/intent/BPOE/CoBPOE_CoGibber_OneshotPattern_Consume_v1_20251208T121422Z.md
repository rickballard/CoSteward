# CoBPOE – CoGibber Oneshot Pattern (Consume v1)

- UTS: 20251208T121422Z
- Scope: Apply CoGibber MegaWavePack v3 into live repos via branch + PR only.

## Pattern
1. AI emits:
   - packer CoBlock (creates MegaZip)
   - consumer CoBlock (this script).
2. Human:
   - runs packer in source session
   - moves MegaZip to target node/session
   - runs consumer in target environment (this node).
3. Human + AI:
   - use workspace snapshot as reference
   - copy forward updated artifacts into each repo on feature branches
   - open PRs with CoBus + BPOE trails.

## Notes
- Workspace is intentionally decoupled from live repos.
- No direct overwrite of repo files without explicit human-controlled git workflow.
