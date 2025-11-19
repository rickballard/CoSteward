param(
    [string] $RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path,
    [int]    $RecentDays = 2
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

function New-SessionHealthRow {
    param(
        [string] $Kind,
        [string] $Name,
        [string] $Detail
    )
    [pscustomobject]@{
        Kind   = $Kind
        Name   = $Name
        Detail = $Detail
    }
}

$rows = New-Object System.Collections.Generic.List[object]

$sessionHealthDir = Join-Path $RepoRoot 'docs/intent/session-health'
if (-not (Test-Path $sessionHealthDir)) {
    $rows.Add(
        (New-SessionHealthRow -Kind 'warning' -Name 'session-health-dir' -Detail "Missing: $sessionHealthDir")
    )
    $rows | Format-Table -AutoSize
    exit 0
}

$notes = Get-ChildItem -Path $sessionHealthDir -Filter '*.md' -File -ErrorAction Stop |
    Sort-Object LastWriteTime -Descending

$totalCount = $notes.Count
$rows.Add(
    (New-SessionHealthRow -Kind 'info' -Name 'session-health-notes' -Detail ("Total notes: {0}" -f $totalCount))
)

if ($notes) {
    $latest = $notes | Select-Object -First 1
    $rows.Add(
        (New-SessionHealthRow -Kind 'info' -Name 'latest-note' -Detail ("{0} (LastWrite: {1})" -f $latest.Name, $latest.LastWriteTime.ToString('s')))
    )
}

$recentCutoff = (Get-Date).AddDays(-1 * [math]::Abs($RecentDays))
$recent = $notes | Where-Object { $_.LastWriteTime -ge $recentCutoff }

$rows.Add(
    (New-SessionHealthRow -Kind 'info' -Name 'recent-window' -Detail ("Last {0} day(s), cutoff {1}" -f [math]::Abs($RecentDays), $recentCutoff.ToString('s')))
)
$rows.Add(
    (New-SessionHealthRow -Kind 'info' -Name 'recent-notes-count' -Detail ("{0} note(s) updated in window" -f $recent.Count))
)

$coSyncNotes = $notes | Where-Object { $_.Name -like 'CoSync_*' -or $_.Name -like '*CoSync*' }
$rows.Add(
    (New-SessionHealthRow -Kind 'info' -Name 'CoSync-notes' -Detail ("{0} note(s) with CoSync in name" -f $coSyncNotes.Count))
)

$crossCreepNotes = $notes | Where-Object { $_.Name -like '*CoCrossCreep*' -or (Get-Content $_.FullName -Raw) -match 'CoCrossCreep' }
$rows.Add(
    (New-SessionHealthRow -Kind 'info' -Name 'CoCrossCreep-notes' -Detail ("{0} note(s) mentioning CoCrossCreep" -f $crossCreepNotes.Count))
)

if ($totalCount -eq 0) {
    $rows.Add(
        (New-SessionHealthRow -Kind 'warning' -Name 'coverage' -Detail 'No session-health notes yet; consider adding CoSync snapshots.')
    )
} elseif ($recent.Count -eq 0) {
    $rows.Add(
        (New-SessionHealthRow -Kind 'warning' -Name 'coverage' -Detail 'No recently-updated session-health notes; Co1 may want a refresh.')
    )
} else {
    $rows.Add(
        (New-SessionHealthRow -Kind 'ok' -Name 'coverage' -Detail 'Session-health notes exist and at least one is recent.')
    )
}

$rows | Format-Table -AutoSize