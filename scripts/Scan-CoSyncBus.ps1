param(
    [int] $StaleHours = 24
)

$ErrorActionPreference = 'Stop'

function UTS {
    (Get-Date).ToUniversalTime().ToString('yyyyMMddTHHmmssZ')
}

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$cs   = Split-Path -Parent $root   # repo root (.. from scripts/)

$notesRoot = Join-Path $cs 'docs/intent/advice/notes'
if (-not (Test-Path $notesRoot)) {
    throw "CoSync notes root not found at: $notesRoot"
}

Write-Host "Scan-CoSyncBus: notes root = $notesRoot" -ForegroundColor Yellow

# Collect CoSync notes
$files = Get-ChildItem $notesRoot -Recurse -Filter 'CoSync_*.md'

if (-not $files) {
    Write-Host "No CoSync_* notes found; nothing to summarise." -ForegroundColor DarkGray
    return
}

# Helper to parse UTS from file name
function Get-CoSyncStamp {
    param([string]$fileName)

    if (-not $fileName.StartsWith('CoSync_')) { return $null }
    $stem = [System.IO.Path]::GetFileNameWithoutExtension($fileName)
    if ($stem.Length -le 7) { return $null }  # 'CoSync_' length
    return $stem.Substring(7)
}

# Build raw rows
$rows = @()

foreach ($f in $files) {
    $rel  = [System.IO.Path]::GetRelativePath($cs, $f.FullName)
    $uts  = Get-CoSyncStamp -fileName $f.Name
    $when = $null

    if ($uts -and $uts -match '^\d{8}T\d{6}Z$') {
        try {
            $when = [DateTime]::ParseExact(
                $uts,
                'yyyyMMddTHHmmssZ',
                [System.Globalization.CultureInfo]::InvariantCulture,
                [System.Globalization.DateTimeStyles]::AssumeUniversal
            )
        } catch {
            $when = $f.LastWriteTimeUtc
        }
    } else {
        $when = $f.LastWriteTimeUtc
    }

    # Try to detect session label from first few lines
    $session = $null
    $header  = Get-Content $f.FullName -TotalCount 6
    foreach ($line in $header) {
        if ($line -match 'CoSync note\s+[—-]\s+(?<label>\S+)') {
            $session = $Matches['label']
            break
        }
        if ($line -match '^Session\s*[:=]\s*(?<label>\S+)') {
            $session = $Matches['label']
            break
        }
    }

    if (-not $session) {
        # Fallback: derive from containing folder name, very loose
        $session = (Split-Path $f.DirectoryName -Leaf)
    }

    $rows += [PSCustomObject]@{
        Session  = $session
        UTS      = $uts
        WhenUtc  = $when
        File     = $rel
    }
}

if (-not $rows) {
    Write-Host "No CoSync rows produced; nothing to summarise." -ForegroundColor DarkGray
    return
}

# Latest CoSync per session
$latestBySession = $rows |
    Where-Object { $_.Session } |
    Sort-Object Session, WhenUtc |
    Group-Object Session |
    ForEach-Object {
        $g = $_.Group | Sort-Object WhenUtc -Descending
        $g[0]
    } |
    Sort-Object WhenUtc -Descending

$nowUtc   = (Get-Date).ToUniversalTime()
$staleCut = $nowUtc.AddHours(-1 * $StaleHours)

$stale = $latestBySession | Where-Object { $_.WhenUtc -lt $staleCut }
$fresh = $latestBySession | Where-Object { $_.WhenUtc -ge $staleCut }

# Render markdown summary
$statusDir  = Join-Path $cs 'docs/intent'
if (-not (Test-Path $statusDir)) {
    New-Item -ItemType Directory -Path $statusDir -Force | Out-Null
}

$statusPath = Join-Path $statusDir 'CoSyncBusStatus.md'
$utcNowStr  = UTS

$lines = @()
$lines += "# CoSync Bus Status"
$lines += ""
$lines += "- Generated (UTC): $utcNowStr"
$lines += "- Stale threshold: ${StaleHours}h"
$lines += ""
$lines += "## Fresh sessions (>= ${StaleHours}h)"
$lines += ""
if (-not $fresh) {
    $lines += "_None_"
} else {
    $lines += "| Session | Last CoSync (UTC) | Note |"
    $lines += "|---------|-------------------|------|"
    foreach ($row in $fresh) {
        $whenStr = $row.WhenUtc.ToString('yyyy-MM-dd HH:mm:ssZ')
        $lines += "| $($row.Session) | $whenStr | $($row.File) |"
    }
}
$lines += ""
$lines += "## Stale sessions (< ${StaleHours}h activity)"
$lines += ""
if (-not $stale) {
    $lines += "_None_"
} else {
    $lines += "| Session | Last CoSync (UTC) | Note | Age (h) |"
    $lines += "|---------|-------------------|------|---------|"
    foreach ($row in $stale) {
        $whenStr = $row.WhenUtc.ToString('yyyy-MM-dd HH:mm:ssZ')
        $ageH    = [Math]::Round(($nowUtc - $row.WhenUtc).TotalHours, 1)
        $lines  += "| $($row.Session) | $whenStr | $($row.File) | $ageH |"
    }
}

$lines += ""
$lines += "> BPOE note: This file is the CoSync Bus \"dashboard\" for the CoSuite."
$lines += "> Any AI session that can see this repo can treat it as the truth for which sessions are active vs stale."
$lines += "> Co1 (the effectively endless CoPrime) may represent its MW remaining as `∞` by convention."

$lines | Set-Content -Path $statusPath -Encoding UTF8

Write-Host "CoSync Bus status written to: $statusPath" -ForegroundColor Green
