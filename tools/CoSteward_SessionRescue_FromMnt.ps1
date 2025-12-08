param(
  [string]$Root = 'C:\mnt',
  [string]$DestRoot,
  [switch]$DryRun
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

function UTS {
  (Get-Date).ToUniversalTime().ToString('yyyyMMddTHHmmssZ')
}

# Resolve repo root from script location (works when run as a script)
$repoRoot = Split-Path -Parent $PSScriptRoot

if (-not $DestRoot) {
  $DestRoot = Join-Path $repoRoot 'docs\session-offload\rescued'
}

Write-Host "[INFO] Session rescue helper v2" -ForegroundColor Cyan
Write-Host "[INFO] Root source    : $Root" -ForegroundColor Cyan
Write-Host "[INFO] Destination    : $DestRoot" -ForegroundColor Cyan
Write-Host ""

if (-not (Test-Path $Root)) {
  Write-Host "[INFO] No root found at '$Root'; nothing to rescue." -ForegroundColor Yellow
  "CoBloat: CU=OK • PU=OK • HU=OK • WT=OK"
  return
}

# Candidate files: text + zips (seed set)
$candidates = Get-ChildItem -Path $Root -Recurse -File -ErrorAction SilentlyContinue |
  Where-Object { $_.Extension -in '.md', '.txt', '.zip', '.json' }

if (-not $candidates -or $candidates.Count -eq 0) {
  Write-Host "[INFO] No candidate files found under '$Root'." -ForegroundColor Yellow
  "CoBloat: CU=OK • PU=OK • HU=OK • WT=OK"
  return
}

$stamp   = UTS
$destDir = Join-Path $DestRoot $stamp
New-Item -ItemType Directory -Force -Path $destDir *> $null

Write-Host "[INFO] Found $($candidates.Count) file(s) to rescue." -ForegroundColor Green
Write-Host "[INFO] Target wave dir: $destDir" -ForegroundColor Green
Write-Host ""

foreach ($f in $candidates) {
  $target = Join-Path $destDir $f.Name
  if ($DryRun) {
    Write-Host "[DRY-RUN] Would copy: $($f.FullName) -> $target"
  } else {
    Copy-Item -Path $f.FullName -Destination $target -Force
    Write-Host "[COPIED] $($f.FullName) -> $target"
  }
}

if ($DryRun) {
  Write-Host ""
  Write-Host "[INFO] Dry-run only; no files were actually copied." -ForegroundColor Yellow
} else {
  Write-Host ""
  Write-Host "[INFO] Rescue wave complete -> $destDir" -ForegroundColor Green
}

"CoBloat: CU=OK • PU=OK • HU=OK • WT=OK"
