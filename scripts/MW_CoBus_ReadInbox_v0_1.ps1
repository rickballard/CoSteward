param(
    [Parameter(Mandatory = $true)]
    [string] $SessionLabel,
    [string] $SinceUtc = ''
)

$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

function UTS {
    (Get-Date).ToUniversalTime().ToString("yyyyMMddTHHmmssZ")
}

$coBusRoot = Join-Path $PSScriptRoot "..\docs\intent\CoBus"
$coBusRoot = (Resolve-Path $coBusRoot).Path

if (-not (Test-Path $coBusRoot)) {
    Write-Host "[CoBus] No CoBus root at $coBusRoot"
    exit 0
}

Write-Host ""
Write-Host "[CoBus] Scanning inbox for session: $SessionLabel"

$notesRoot = Join-Path $coBusRoot "notes"
$noteFiles = Get-ChildItem -Path $notesRoot -Recurse -Filter "CoBus_*.md" -ErrorAction SilentlyContinue

if (-not $noteFiles) {
    Write-Host "[CoBus] No CoBus notes found."
    exit 0
}

$since = $null
if ($SinceUtc) {
    $since = [datetime]::ParseExact($SinceUtc, "yyyyMMddTHHmmssZ", $null)
}

$matched = @()

foreach ($f in $noteFiles) {
    $content = Get-Content $f.FullName -Raw

    if ($content -notmatch "to_sessions:") { continue }

    $pattern = ("  - {0}" -f [regex]::Escape($SessionLabel))
    if ($content -notmatch $pattern) { continue }

    if ($since) {
        $createdMatch = [regex]::Match($content, "created_utc:\s*(\d{8}T\d{6}Z)")
        if ($createdMatch.Success) {
            $created = [datetime]::ParseExact($createdMatch.Groups[1].Value, "yyyyMMddTHHmmssZ", $null)
            if ($created -le $since) { continue }
        }
    }

    $matched += $f
}

if (-not $matched) {
    Write-Host "[CoBus] No new notes for $SessionLabel."
    exit 0
}

Write-Host ""
Write-Host ("[CoBus] Incoming notes for {0}:" -f $SessionLabel)

foreach ($f in $matched | Sort-Object Name) {
    Write-Host ("- {0}" -f $f.FullName)
}

Write-Host ""
Write-Host "[CoBus] Preview of latest note:"
Write-Host ""

$latest = $matched | Sort-Object LastWriteTimeUtc -Descending | Select-Object -First 1
Get-Content $latest.FullName | Select-Object -First 60
