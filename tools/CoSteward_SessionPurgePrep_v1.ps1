param(
    [switch]$DryRun
)

# CoSteward_SessionPurgePrep_v1.ps1
# Purpose: stub helper to prepare for session/browser cleanup, CoBloat-aware.

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

Write-Host '=== CoSteward SessionPurgePrep v1 ==='
if ($DryRun) {
    Write-Host '[DryRun] No files will be deleted. Showing suggestions only.'
}

Write-Host ''
Write-Host 'Suggestions (stub v1):'
Write-Host '  - Close stale / heavy browser tabs for AI sessions.'
Write-Host '  - Ensure recent MegaZips / AdviceBombs are safely stored.'
Write-Host '  - Consider rotating to a fresh ChatGPT session if laggy.'
Write-Host ''
Write-Host 'Future versions can:'
Write-Host '  - Scan for huge zips in Downloads.'
Write-Host '  - Summarise recent AdviceBomb_* bundles.'
Write-Host '  - Emit CoBloat / CoHealth hints for Co1.'