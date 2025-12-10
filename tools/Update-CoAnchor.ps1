param(
    [string[]]$TargetRepos = @('CoSteward','CoIndex')
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$ghRoot = Join-Path $HOME 'Documents\GitHub'
$coRoot = Join-Path $ghRoot 'CoSteward'
$canonicalPath = Join-Path $coRoot 'docs\CoAnchor\CoAnchor_Quickstart_Thin.md'

if (-not (Test-Path $canonicalPath)) {
    Write-Host "Canonical CoAnchor not found at $canonicalPath" -ForegroundColor Red
    exit 1
}

foreach ($repo in $TargetRepos) {
    $repoPath = Join-Path $ghRoot $repo
    if (-not (Test-Path $repoPath)) {
        Write-Host "Skipping $repo (not found at $repoPath)" -ForegroundColor Yellow
        continue
    }

    $targetDir  = Join-Path $repoPath 'docs\CoAnchor'
    $targetPath = Join-Path $targetDir 'CoAnchor_Quickstart_Thin.md'

    if ($canonicalPath -ieq $targetPath) {
        Write-Host "Skipping $repo (canonical already at $targetPath)" -ForegroundColor Cyan
        continue
    }

    if (-not (Test-Path $targetDir)) {
        New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
    }

    Copy-Item -Path $canonicalPath -Destination $targetPath -Force

    Write-Host "Updated CoAnchor in $repo at $targetPath" -ForegroundColor Green
}
