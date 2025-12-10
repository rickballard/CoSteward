param(
    [Parameter(Mandatory = $true)]
    [string]$TargetRepoName,

    [Parameter(Mandatory = $true)]
    [string]$SessionLabel
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$ghRoot        = Join-Path $HOME 'Documents\GitHub'
$coStewardRoot = Join-Path $ghRoot 'CoSteward'
$targetRepoPath = Join-Path $ghRoot $TargetRepoName

if (-not (Test-Path $targetRepoPath)) {
    Write-Host ""
    Write-Host "CoStart error. Repo '$TargetRepoName' not found at $targetRepoPath" -ForegroundColor Red
    Write-Host ""
    exit 1
}

Set-Location $targetRepoPath

Write-Host ""
Write-Host "=== CoStart session ==="
Write-Host "Repo     : $TargetRepoName"
Write-Host "Session  : $SessionLabel"
Write-Host "BPOE     : repo first, PS7 DO blocks only, MegaWave only"
Write-Host "Time UTC : $((Get-Date).ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ssZ'))"
Write-Host ""

$anchorFile = Get-ChildItem -Path $coStewardRoot -Filter 'CoAnchor_Quickstart_Thin.md' -Recurse -ErrorAction SilentlyContinue | Select-Object -First 1

if ($anchorFile) {
    Write-Host '--- CoAnchor BPOE rails (thin banner) ---'
    $anchorLines = Get-Content $anchorFile.FullName | Select-Object -First 32
    foreach ($line in $anchorLines) {
        Write-Host "  $line"
    }
    Write-Host '----------------------------------------'
}
else {
    Write-Host 'CoAnchor_Quickstart_Thin.md not found. Proceeding without banner.' -ForegroundColor Yellow
}

Write-Host ""
Write-Host 'Reminder: use named DO blocks and keep work repo first.'
Write-Host ""
