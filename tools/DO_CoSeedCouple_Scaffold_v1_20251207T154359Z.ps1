# ♦ DO CoSeedCouple_Scaffold_v1_YYYYMMDDTHHMMSSZ
$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

function UTS { (Get-Date).ToUniversalTime().ToString('yyyyMMddTHHmmssZ') }

$uts = UTS

Write-Host "CoSeedCouple scaffold starting at $uts" -ForegroundColor Green

# Prompt for basic names (lightweight; can be changed later)
$brandName   = Read-Host "Enter your constellation / project name (e.g. 'BrightFutures')"
if (-not $brandName) { $brandName = "MyConstellation" }

$root = Read-Host "Enter parent folder path to create your pair (default: $HOME\Documents\GitHub)"
if (-not $root) {
    $root = Join-Path $HOME 'Documents\GitHub'
}

$siteRepoName  = "${brandName}.Site"
$cogbxRepoName = "${brandName}.CoGbx"

$siteRepoPath  = Join-Path $root $siteRepoName
$cogbxRepoPath = Join-Path $root $cogbxRepoName

Write-Host "Site repo:  $siteRepoPath"  -ForegroundColor Yellow
Write-Host "CoGbx repo: $cogbxRepoPath" -ForegroundColor Yellow

# Locate this kit root (assume script is under ps7/)
$scriptDir  = Split-Path -Parent $MyInvocation.MyCommand.Path
$kitRoot    = Split-Path -Parent $scriptDir

$siteTemplate  = Join-Path $kitRoot 'site-template'
$cogbxTemplate = Join-Path $kitRoot 'cogbx-template'

# Ensure target dirs
New-Item -ItemType Directory -Path $siteRepoPath  -Force | Out-Null
New-Item -ItemType Directory -Path $cogbxRepoPath -Force | Out-Null

function Copy-SeedTree {
    param(
        [Parameter(Mandatory=$true)] [string] $Source,
        [Parameter(Mandatory=$true)] [string] $Destination
    )

    if (-not (Test-Path $Source)) {
        throw "Seed source not found: $Source"
    }
    Copy-Item -Path (Join-Path $Source '*') -Destination $Destination -Recurse -Force
}

Write-Host "Copying site template..." -ForegroundColor Green
Copy-SeedTree -Source $siteTemplate -Destination $siteRepoPath

Write-Host "Copying CoGbx template..." -ForegroundColor Green
Copy-SeedTree -Source $cogbxTemplate -Destination $cogbxRepoPath

# Optional git init (non-fatal if git missing)
foreach ($path in @($siteRepoPath, $cogbxRepoPath)) {
    try {
        if (-not (Test-Path (Join-Path $path '.git'))) {
            Push-Location $path
            git init | Out-Null
            git add . | Out-Null
            git commit -m "seed CoSeedCouple from kit v1 ($uts)" | Out-Null
            Pop-Location
        }
    } catch {
        Write-Warning "Git init/commit skipped for $path: $($_.Exception.Message)"
    }
}

Write-Host ""
Write-Host "CoSeedCouple scaffold completed." -ForegroundColor Green
Write-Host "  Site repo:  $siteRepoPath"  -ForegroundColor Green
Write-Host "  CoGbx repo: $cogbxRepoPath" -ForegroundColor Green
Write-Host ""
Write-Host "Next:" -ForegroundColor Green
Write-Host "  - Open the site repo README and adapt the text with your AI." -ForegroundColor Green
Write-Host "  - Do the same for the CoGbx repo." -ForegroundColor Green
