# Workflows: AdviceBombs · CoSync · CoEvo

## AdviceBomb lifecycle
- Build zip → include manifest + .sha256 → drop to inbox → CI guard logs to INBOX_LOG.md.

## CoSync
- Policy: docs/ops/COSYNC_POLICY.json (enabled, intervalMinutes, battery guard).
- Local helper: scripts/CoSteward.AutoCoSync.Helper.ps1 (stamps STATUS/cosync.log).

## CoEvo loops
- Review → Improve → Replace/append → Re-index; leave breadcrumbs in notes + PR body.
