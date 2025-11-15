# MegaWave — Standard (rails)
Updated: 20251115T184804Z

**Purpose:** Structure work into three predictable waves with receipts and guardrails.

## Waves (rails)
- **MW-3**: Template/guard standardization (heartbeats first).
- **MW-2**: Nightly roll-up + BPOE wiring (lightweight CI).
- **MW-1**: CloseWave (verify, prune, receipt).

## Ground rules
- Use short branches: \poe/*\, \ci/*\, \docs/*\.
- Arm auto-merge where permissible; otherwise manual squash.
- Every change leaves a receipt in \docs/intent/advice/notes/YYYYMMDD/CoSync_*.md\.

## Countdown
Use \Invoke-MegaWaveCountdown\ (below) between waves to print a live tick.
