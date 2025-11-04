# Violet Receipts (Suite-wide)

- Canon writer lives in **CoCache**: `tools/Violet/Write-Violet.ps1`
- Most repos call **CoSteward/tools/Write-Violet.ps1** which:
  1) Reads canon from **CoCache/docs/index/ASSETS_INDEX.json**
  2) Falls back to `CoCache/tools/Violet/Write-Violet.ps1`
  3) As last resort writes a local `advice/STATUS/violets.log` receipt

## One-liner receipt (in any repo)
`pwsh -NoProfile -File tools/Write-VioletHere.ps1 -Message "…"`

## Maintenance
- Keep `CoCache/tools/CoIndex/Scan-CoSuite.ps1` healthy (PR guard comments canon & counts)
- If canon moves, bump it once in CoCache → consumers re-resolve via index
