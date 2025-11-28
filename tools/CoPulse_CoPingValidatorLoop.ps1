param(
    [string] $RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path,
    [int]    $IntervalSeconds = 600
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

Write-Host "Starting CoPulse CoPing validator loop. Interval: $IntervalSeconds seconds. Repo: $RepoRoot" -ForegroundColor Cyan

while ($true) {
    $stamp = Get-Date
    Write-Host ""
    Write-Host "[$stamp] Running CoPing panel validator..." -ForegroundColor Cyan

    & pwsh -File (Join-Path $RepoRoot 'tools/Invoke-CoPingPanelValidator.ps1') -RepoRoot $RepoRoot
    $exit = $LASTEXITCODE

    if ($exit -ne 0) {
        Write-Host "[$stamp] CoPing validator FAILED with exit code $exit." -ForegroundColor Red
    }
    else {
        Write-Host "[$stamp] CoPing validator OK." -ForegroundColor Green
    }

    Write-Host "Sleeping for $IntervalSeconds seconds..." -ForegroundColor DarkGray
    Start-Sleep -Seconds $IntervalSeconds
}