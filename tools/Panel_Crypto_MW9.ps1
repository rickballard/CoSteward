param(
  [string]$CoStewardPath = (Join-Path $HOME 'Documents\GitHub\CoSteward')
)

# Simple CoBloat-ish heartbeat stub (can be upgraded later)
$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

Set-Location $CoStewardPath

$planPath = 'docs/intent/session/SESSION_PLAN_Crypto_MW9_20251116T050840Z.md'
if (-not (Test-Path $planPath)) {
  throw "Session plan not found at $planPath"
}

$lines = Get-Content $planPath

# Extract the MegaWave table block
$tableLines = @()
$inTable = $false
foreach ($line in $lines) {
  if ($line -match '^\|\s*Wave\s*\|') {
    $inTable = $true
    $tableLines += $line
    continue
  }
  if (-not $inTable) { continue }

  if ($line -match '^\|\s*-') {
    $tableLines += $line
    continue
  }

  if ($line.Trim() -eq '') { break }
  if ($line -notmatch '^\|') { break }

  $tableLines += $line
}

if ($tableLines.Count -lt 3) {
  throw "Could not parse MegaWave table from $planPath"
}

# Skip header + separator
$dataLines = $tableLines | Select-Object -Skip 2

$rows = foreach ($l in $dataLines) {
  if ($l.Trim() -eq '') { continue }
  # Basic markdown-table split
  $cells = $l.Trim().Trim('|').Split('|') | ForEach-Object { $_.Trim() }
  if ($cells.Count -lt 6) { continue }

  [pscustomobject]@{
    Wave   = $cells[0]
    Status = $cells[1]
    Scope  = $cells[2]
    Branch = $cells[3]
    PR     = $cells[4]
    Notes  = $cells[5]
  }
}

if (-not $rows) {
  throw "No data rows parsed from MegaWave table in $planPath"
}

$remaining = ($rows | Where-Object { $_ -and -not ($_.Status -like 'Done*') }).Count

Write-Host "== CoSteward Panel — Crypto / MW9 ==" -ForegroundColor Cyan
Write-Host ("UTC now: {0}" -f (Get-Date).ToUniversalTime().ToString('yyyy-MM-dd HH:mm:ss')) -ForegroundColor Gray
Write-Host ""
Write-Host ("MegaWave countdown: {0} waves remaining (non-Done)" -f $remaining) -ForegroundColor Yellow
Write-Host ""

# Compact table view
$rows |
  Select-Object Wave, Status, Scope, Branch, PR |
  Format-Table -AutoSize

Write-Host ""
Write-Host "Next obvious actions:" -ForegroundColor Cyan
Write-Host "  1) Review/merge CoCache PRs #439, #441, #444 when ready."
Write-Host "  2) Keep SESSION_PLAN_Crypto_MW9_* as the truth, update after each wave."
Write-Host "  3) Once MW9.4 lands, design MW9.5 metrics wiring + Co1 hooks." 
