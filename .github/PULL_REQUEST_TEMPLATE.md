## PR Checklist
- [ ] Scope & non-goals are stated
- [ ] Repo artifacts updated (paths listed)
- [ ] Verification steps included (commands/scripts)
- [ ] CoSync note path: docs/intent/advice/notes/YYYYMMDD/…
- [ ] Small & squashable (prefer squash merge)

## Helper Evolution (BPOE)
- [ ] I routed calls through `tools/CoOps.psm1` (or the designated aggregator)
- [ ] I evolved an existing helper where possible (vs. adding a new script)
- [ ] If I added a new helper, it is exported via the aggregator and referenced by CI (not called directly)

See: docs/ops/MANUAL/BPOE.md {#bpoe-helper-evolution}

