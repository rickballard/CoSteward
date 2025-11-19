
# BPOE Drift  -  Risk & Mitigations

**Problem**: sessions lose BPOE alignment.

- Missing CoStatus line and receipts
- Long MegaWave cycle time
- State/UI bloat over multi-day sessions

**v1 Mitigations**
- CI guards for CoStatus + same-day CoSync receipt
- Co1 rotation ≤ 4 days or when `X ≥ Z`
- Reusable `inbox-trace` bot on every PR

**v2 Next**
- `co-status-verify` job that fails PR without canonical line
- Auth guide for PAT with `workflow` scope or SSH

