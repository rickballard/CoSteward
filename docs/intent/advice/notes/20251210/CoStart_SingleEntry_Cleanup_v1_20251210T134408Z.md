# CoStart single-entry cleanup v1 (20251210T134408Z)

Decisions:
- For rick (CoSteward), use a single CoStart entrypoint on Desktop:
  - CoStart_CoSteward.lnk -> CoSteward via CoStart_Launch.ps1.
- Additional repos (CoIndex, etc) are reachable *from inside* that pane via CoStart_Launch.ps1,
  not via separate desktop entrypoints.
- Long-term, non-steward users are expected to default to a CoStart_CoCivium-style entrypoint.

Actions (local OE):
- Removed Desktop shortcuts matching: CoStart_CoIndex*.lnk
- Removed any Startup shortcuts whose arguments referenced: CoPopupGuard_StartupWrapper.ps1
  (disables automatic CoPopupGuard PS7 window at login).
- Left CoStart_CoSteward.lnk intact as canonical PS7 launch point.

Notes:
- No repos or scripts were deleted; only .lnk files in Desktop/Startup were pruned.
- Future CoStart icons for CoCivium should be added intentionally, not ad-hoc, and documented here.
