param(
  [string]$RepoPath = "$HOME\Documents\GitHub\SomeRepo",
  [switch]$Apply
)
$ErrorActionPreference='Stop'; Set-StrictMode -Version Latest
function UTS { (Get-Date).ToUniversalTime().ToString('yyyyMMddTHHmmssZ') }
$ts = UTS

# Show defaults
Write-Host "Defaults:" -ForegroundColor Cyan
Write-Host " - RepoPath : $RepoPath"
Write-Host ""

# Validate paths without mutating
$problems=@(); if(-not (Test-Path $RepoPath)){ $problems += "RepoPath not found: $RepoPath" }
if($problems.Count){
  Write-Host "Not running because a critical path is missing:" -ForegroundColor Yellow
  $problems | % { Write-Host " - $_" -ForegroundColor Yellow }
  $cmd = 'pwsh -File "<this script>" -RepoPath "<your path>"'
  Write-Host "Re-run with your paths:" -ForegroundColor Yellow
  Write-Host $cmd -ForegroundColor White
  "CoBloat: CU=OK • PU=OK • HU=OK • WT=OK"
  return
}

# Work (dry-run)
if(-not $Apply){
  "[dry-run] would do X, Y, Z"
  "CoBloat: CU=OK • PU=OK • HU=OK • WT=OK"
  return
}

# Mutating path here only when -Apply
"[apply] doing X, Y, Z"
"CoBloat: CU=OK • PU=OK • HU=OK • WT=OK"
