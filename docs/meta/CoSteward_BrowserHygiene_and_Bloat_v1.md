# CoSteward Browser Hygiene & Bloat Meter (v1)

Generated: 20251205T213139Z

## Intent

Give stewards a simple, CLI first way to estimate when browser
workflows are about to become laggy, so they can restart / flush
on their own terms instead of waiting for severe degradation.

This is a **proxy** for tab cache fullness, not a direct measure.

## Helper script

- Path: \	ools/CoSteward_ChromeBloatMeter.ps1\
- Usage (one shot):

  \\\powershell
  # Check browser RAM vs physical RAM (defaults: Warn=60, Hard=75)
  .\tools\CoSteward_ChromeBloatMeter.ps1
  \\\

- Usage (custom thresholds):

  \\\powershell
  .\tools\CoSteward_ChromeBloatMeter.ps1 -WarnPercent 50 -HardPercent 70
  \\\

## Interpretation (CoBloat tiers)

- **OK**: below WarnPercent
- **SOFT**: between WarnPercent and HardPercent
- **HARD**: at or above HardPercent

Stewards can map these tiers to their own browser hygiene habits
(for example, restart once per day, or whenever SOFT is crossed).

## Notes

- This helper does *not* clear caches by itself.
- It is safe to run repeatedly from PS7.
- Future waves can add:
  - logging to CSV for trend plotting;
  - CoStatus integration;
  - hooks from other helpers (for example, pre wave checks).
