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

# Resolve repo root
if ($PSScriptRoot) {
  # Normal case: running as a script file
  $repoRoot = Split-Path -Parent $PSScriptRoot
} else {
  # Fallback: running interactively, assume standard CoSteward location
  $repoRoot = Join-Path $HOME 'Documents\GitHub\CoSteward'
}

if (-not $DestRoot -or [string]::IsNullOrWhiteSpace($DestRoot)) {
  $DestRoot = Join-Path $repoRoot 'docs\session-offload\rescued'
}

Write-Host "[INFO] Session rescue helper v2.3" -ForegroundColor Cyan
Write-Host "[INFO] Root source    : $Root" -ForegroundColor Cyan
Write-Host "[INFO] Destination    : $DestRoot" -ForegroundColor Cyan
Write-Host ""

if (-not (Test-Path $Root)) {
  Write-Host "[INFO] No root found at '$Root'; nothing to rescue." -ForegroundColor Yellow
  "CoBloat: CU=OK • PU=OK • HU=OK • WT=OK"
  return
}

# Collect candidate files (text + zip + json). Force array so .Count is safe.
$candidates = @(Get-ChildItem -Path $Root -Recurse -File -ErrorAction SilentlyContinue |
  Where-Object { $_.Extension -in '.md', '.txt', '.zip', '.json' })

if (-not $candidates -or @($candidates).Count -eq 0) {
  Write-Host "[INFO] No files found to rescue from '$Root'." -ForegroundColor Yellow
  "CoBloat: CU=OK • PU=OK • HU=OK • WT=OK"
  return
}

$ts = UTS
$targetRoot = Join-Path $DestRoot $ts

if (-not $DryRun) {
  New-Item -ItemType Directory -Path $targetRoot -Force | Out-Null
}

Write-Host "[INFO] Found $(@($candidates).Count) file(s) to rescue." -ForegroundColor Green
if ($DryRun) {
  Write-Host "[INFO] Dry-run mode: no files will be written." -ForegroundColor Yellow
}

foreach ($f in $candidates) {
  # Relative path under the root
  $rel = $f.FullName.Substring($Root.Length).TrimStart('\','/')
  $destPath = Join-Path $targetRoot $rel

  if ($DryRun) {
    Write-Host "[DRY]  $rel"
    continue
  }

  $destDir = Split-Path -Parent $destPath
  if (-not (Test-Path $destDir)) {
    New-Item -ItemType Directory -Path $destDir -Force | Out-Null
  }

  Copy-Item -LiteralPath $f.FullName -Destination $destPath -Force
  Write-Host "[RESCUED] $rel"
}

if ($DryRun) {
  Write-Host "[INFO] Dry-run completed. Re-run without -DryRun to apply." -ForegroundColor Yellow
}

"CoBloat: CU=OK • PU=OK • HU=OK • WT=OK"
