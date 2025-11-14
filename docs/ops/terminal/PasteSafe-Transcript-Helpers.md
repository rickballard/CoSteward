# PasteSafe transcript helpers (Dia Cont v0.7)

Helpers installed by Dia Cont / MegaWave:

- `Convert-CoTranscriptToPs1` — cleans raw PS7 transcript into a runnable `.ps1`.
- `Use-CoClipToPs1` — takes clipboard → timestamped transcript + cleaned `.ps1`.

## Usage (from CoSteward root)

```pwsh
Set-Location "$HOME\Documents\GitHub\CoSteward"

. tools/terminal/Convert-CoTranscriptToPs1.ps1
. tools/terminal/Use-CoClipToPs1.ps1

Use-CoClipToPs1 -Label 'DiaCont_MegaWave'
These are BPOE helpers for turning messy chat / session logs into reproducible CoBlocks.
