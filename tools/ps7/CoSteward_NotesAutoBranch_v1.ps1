$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

Write-Host '=== CoSessionHygiene v1 ==='
Write-Host ''

$coSteward = Join-Path $HOME 'Documents\GitHub\CoSteward'
if (-not (Test-Path $coSteward)) {
    Write-Warning "CoSteward repo not found at $coSteward"
    return
}

$sessionPurge = Join-Path $coSteward 'tools\CoSteward_SessionPurgePrep_v1.ps1'
$coReload    = Join-Path $coSteward 'tools\CoReload\CoReloadRunner_v1.ps1'

if (-not (Test-Path $sessionPurge)) {
    Write-Warning "Missing: $sessionPurge"
} else {
    Write-Host '[1/2] SessionPurgePrep (DryRun):'
    & $sessionPurge -DryRun
    Write-Host ''
}

if (-not (Test-Path $coReload)) {
    Write-Warning "Missing: $coReload"
} else {
    Write-Host '[2/2] CoReloadRunner:'
    & $coReload
    Write-Host ''
}

Write-Host '=== CoSessionHygiene v1 complete ==='