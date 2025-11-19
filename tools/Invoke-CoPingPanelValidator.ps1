param(
    [string] $RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$validator = Join-Path $RepoRoot 'tools/Test-CoPingPanel.ps1'

if (-not (Test-Path $validator)) {
    throw "Validator script not found at $validator"
}

Write-Host "Running CoPing panel validator at $validator ..." -ForegroundColor Cyan
& pwsh -File $validator -RepoRoot $RepoRoot
$exit = $LASTEXITCODE

if ($exit -ne 0) {
    Write-Host "CoPing panel validator failed with exit code $exit." -ForegroundColor Red
    exit $exit
}

Write-Host "CoPing panel validator completed successfully." -ForegroundColor Green
exit 0