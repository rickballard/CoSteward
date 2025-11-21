# DO_Crypto_MW9_MegaWaveCycle_v1
# CoBlock — light up the Crypto / MW9 MegaWave panel from the session plan on repo.

param(
  [string]$CoStewardPath = (Join-Path $HOME "Documents\GitHub\CoSteward")
)

$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

function UTS { (Get-Date).ToUniversalTime().ToString("yyyyMMddTHHmmssZ") }
$stamp = UTS

Write-Host "[CoBlock] Crypto/MW9 panel pulse at $stamp" -ForegroundColor Cyan

if (-not (Test-Path -LiteralPath $CoStewardPath)) {
  throw "CoSteward repo not found at $CoStewardPath"
}

$PanelPath = Join-Path $CoStewardPath "tools/Panel_Crypto_MW9.ps1"
if (-not (Test-Path -LiteralPath $PanelPath)) {
  throw "Panel_Crypto_MW9.ps1 not found at $PanelPath. Check branch (docs/session-plan-megawave_20251116T050840Z) and git pull."
}

Write-Host "[CoBlock] Using CoSteward at: $CoStewardPath" -ForegroundColor DarkCyan
Write-Host "[CoBlock] Panel script:      $PanelPath" -ForegroundColor DarkCyan
Write-Host ""

& pwsh -NoProfile -File $PanelPath
