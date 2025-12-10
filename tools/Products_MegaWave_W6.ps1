# Products_MegaWave_W6.ps1
# Builds Products20251209 MegaWave v3 zip + sha from CoSteward + CoCache.
# Usage:
#   pwsh -File .\tools\Products_MegaWave_W6.ps1

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

function UTS {
    (Get-Date).ToUniversalTime().ToString('yyyyMMddTHHmmssZ')
}

# Paths (repo-first; no $home alias to dodge HOME warnings)
$CoSteward = Join-Path $HOME 'Documents\GitHub\CoSteward'
$CoCache   = Join-Path $HOME 'Documents\GitHub\CoCache'
$downloads = Join-Path $HOME 'Downloads'

@(
    @{ Path = $CoSteward; Name = 'CoSteward repo' }
    @{ Path = $CoCache;   Name = 'CoCache repo' }
    @{ Path = $downloads; Name = 'Downloads folder' }
) | ForEach-Object {
    if (-not (Test-Path $_.Path)) {
        throw "Required path not found: $($_.Name) at '$($_.Path)'"
    }
}

$uts     = UTS
$zipBase = "Products20251209_MegaWave_v3_$uts"
$zipPath = Join-Path $downloads "$zipBase.zip"
$shaPath = "$zipPath.sha256"

# 1) Collect files for this Products wave
$files = @()

# 1a) CoSuite products hub core docs (CoCache)
$productsReadme = Join-Path $CoCache 'docs\products\README.md'
if (Test-Path $productsReadme) {
    $files += Get-Item $productsReadme
}

$waveRegistry = Join-Path $CoCache 'docs\intent\Products_WaveRegistry_20251118_v1.md'
if (Test-Path $waveRegistry) {
    $files += Get-Item $waveRegistry
}

# 1b) CoAgentThin seed manifests (CoSteward)
$coAgentThinDir = Join-Path $CoSteward 'docs\intent\products\CoAgentThin'
if (Test-Path $coAgentThinDir) {
    $files += Get-ChildItem $coAgentThinDir -Filter 'CoAgentThin_Manifest_Seed_*.md' -File -Recurse
}

# 1c) Products20251128 -> Products20251209 CoSync handoff notes (CoSteward)
$handoffDir = Join-Path $CoSteward 'docs\intent\advice\notes\20251209'
if (Test-Path $handoffDir) {
    $files += Get-ChildItem $handoffDir -Filter 'CoSync_Products20251128_to_Products20251209_*.md' -File
}

# 1d) Extra product-related scripts to "stuff the megazip"
$scriptRoots = @(
    Join-Path $CoSteward 'tools'
    Join-Path $CoSteward 'scripts'
    Join-Path $CoCache   'tools'
    Join-Path $CoCache   'scripts'
)

foreach ($root in $scriptRoots) {
    if (Test-Path $root) {
        $files += Get-ChildItem $root -Recurse -File -Include `
            '*Products*', '*CoAgentThin*', '*CoSuiteProducts*' `
            -ErrorAction SilentlyContinue
    }
}

# 1e) De-duplicate
$files = $files | Where-Object { $_ -ne $null } | Sort-Object FullName -Unique

if ($files.Count -eq 0) {
    throw 'No files collected for Products20251209 MegaWave v3 - check paths and rerun.'
}

# 2) Build a manifest that enumerates the collected files
$manifestLines = @()
$manifestLines += '# Products20251209 MegaWave v3'
$manifestLines += ''
$manifestLines += "UTS: $uts"
$manifestLines += ''
$manifestLines += "## Files ($($files.Count))"
$manifestLines += ''

foreach ($f in $files) {
    $full  = $f.FullName
    $short = $full

    if ($full -like "$CoSteward*") {
        $short = 'CoSteward:' + $full.Substring($CoSteward.Length)
    } elseif ($full -like "$CoCache*") {
        $short = 'CoCache:' + $full.Substring($CoCache.Length)
    }

    $manifestLines += "- $short"
}

$manifestLines += ''
$manifestLines += '## Notes'
$manifestLines += ''
$manifestLines += '- W6 rescue wave for Products20251209.'
$manifestLines += '- Built via Products_MegaWave_W6.ps1.'
$manifestLines += '- Attach this zip plus its .sha256 to Co1 or future Products sessions as needed.'

$tempManifestPath = Join-Path ([System.IO.Path]::GetTempPath()) ("Products20251209_MegaWave_manifest_$uts.txt")
$manifestLines | Set-Content -Encoding UTF8 -Path $tempManifestPath

$files += Get-Item $tempManifestPath

# 3) Build zip
if (Test-Path $zipPath) {
    Remove-Item $zipPath -Force
}

$pathsToZip = $files | Select-Object -ExpandProperty FullName
Compress-Archive -Path $pathsToZip -DestinationPath $zipPath -Force

# 4) SHA256 sidecar
if (Test-Path $shaPath) {
    Remove-Item $shaPath -Force
}
$hash = Get-FileHash -Algorithm SHA256 -Path $zipPath
("{0}  {1}" -f $hash.Hash, (Split-Path -Leaf $zipPath)) |
    Set-Content -Path $shaPath -Encoding ASCII

# 5) Zip size and CoBloat-ish WT tier
$zipItem = Get-Item $zipPath
$sizeMB  = [Math]::Round($zipItem.Length / 1MB, 2)

$wt = 'OK'
if ($sizeMB -ge 100 -and $sizeMB -lt 250) { $wt = 'SOFT' }
if ($sizeMB -ge 250 -and $sizeMB -lt 400) { $wt = 'HARD' }
if ($sizeMB -ge 400)                      { $wt = 'FATAL' }

Write-Host ''
Write-Host 'Products20251209 MegaWave v3 built:' -ForegroundColor Green
Write-Host "  ZIP : $zipPath"
Write-Host "  SHA : $shaPath"
Write-Host "  Size: $sizeMB MB"
Write-Host ''
Write-Host "CoBloat (zip guess): CU=OK • PU=OK • HU=SOFT • WT=$wt"
Write-Host ''
Write-Host 'Next steps:'
Write-Host '  - Attach the zip plus .sha256 to Products/Co1 sessions or commit manifest tweaks via branch/PR.'
Write-Host ''

# 6) Cleanup temp manifest
Remove-Item $tempManifestPath -ErrorAction SilentlyContinue
