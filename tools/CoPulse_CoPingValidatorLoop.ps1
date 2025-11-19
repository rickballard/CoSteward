param(
    [string] $RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path,
    [int]    $IntervalSeconds = 600
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$logDir  = Join-Path $RepoRoot '.local/CoPulse'
$logFile = Join-Path $logDir 'CoPingPanelValidator.log'

if (-not (Test-Path $logDir)) {
    New-Item -ItemType Directory -Path $logDir -Force | Out-Null
}

$validatorWrapper = Join-Path $RepoRoot 'tools/Invoke-CoPingPanelValidator.ps1'
if (-not (Test-Path $validatorWrapper)) {
    throw "Validator wrapper not found at $validatorWrapper"
}

Write-Host "Starting CoPulse CoPing validator loop. Interval: $IntervalSeconds seconds. Repo: $RepoRoot" -ForegroundColor Cyan

while ($true) {
    $stamp = Get-Date -Format 'yyyy-MM-ddTHH:mm:ssK'
    Write-Host ""
    Write-Host "[$stamp] Running CoPing panel validator..." -ForegroundColor Cyan

    & pwsh -File $validatorWrapper -RepoRoot $RepoRoot
    $exit = $LASTEXITCODE

    $status = if ($exit -eq 0) { 'OK' } else { "FAIL($exit)" }
    $line   = "$stamp`t$status"

    Add-Content -LiteralPath $logFile -Value $line

    if ($exit -ne 0) {
        Write-Host "[$stamp] CoPing validator FAILED with exit code $exit." -ForegroundColor Red
    } else {
        Write-Host "[$stamp] CoPing validator OK." -ForegroundColor Green
    }

    Write-Host "Sleeping for $IntervalSeconds seconds..." -ForegroundColor DarkGray
    Start-Sleep -Seconds $IntervalSeconds
}