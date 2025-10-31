[CmdletBinding()]
param(
  [Parameter(Mandatory)][string]$Repo,
  [Parameter(Mandatory)][string]$Area,
  [Parameter(Mandatory)][string]$Action,
  [int[]]$PR = @(),
  [string]$Note = ''
)

$ErrorActionPreference = "Stop"

# Resolve repo root (call via -File from tools/)
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path

$mdPath  = Join-Path $root 'RECEIPTS.md'
$csvPath = Join-Path $root 'receipts.csv'

# 1) Ensure logs exist
if(-not (Test-Path $mdPath)){
  $hdr = @"
# Violet Receipts

<!-- vio:append -->

| date (UTC) | repo | area | action | pr | sha | note |
|---|---|---|---|---|---|---|

"@
  Set-Content -Encoding utf8NoBOM $mdPath -Value $hdr
}
if(-not (Test-Path $csvPath)){
  'date_utc,repo,area,action,pr,sha,note' | Set-Content -Encoding utf8NoBOM $csvPath
}

# 2) Read existing and choose a safe insertion point
$existing  = Get-Content -Raw -EA SilentlyContinue $mdPath
if([string]::IsNullOrWhiteSpace($existing)){ $existing = '' }

$marker     = '<!-- vio:append -->'
$idxMarker  = $existing.IndexOf($marker, [StringComparison]::OrdinalIgnoreCase)
$idxHeader  = $existing.IndexOf('| date (UTC) | repo |', [StringComparison]::OrdinalIgnoreCase)

# Default: after marker if present else EOF
$insertAt = if($idxMarker -ge 0){ $idxMarker + $marker.Length } else { $existing.Length }

# If the marker happens to be above the header, don't insert there; append to EOF instead.
if($idxHeader -ge 0 -and $insertAt -lt $idxHeader){ $insertAt = $existing.Length }

# 3) Compose values
$sha    = (& git -C $root rev-parse --short HEAD) 2>$null
if([string]::IsNullOrWhiteSpace($sha)){ $sha = 'n/a' }
$utc    = (Get-Date -AsUTC).ToString('yyyy-MM-ddTHH:mm:ssZ')
$prs    = $PR | Where-Object { $_ -gt 0 }
$prText = if($prs){ ($prs | ForEach-Object { "#$_" }) -join ',' } else { '-' }

# 4) Splice markdown row safely
$mdRow  = "| $utc | $Repo | $Area | $Action | $prText | $sha | $Note |"
$before = $existing.Substring(0, $insertAt)
$after  = $existing.Substring($insertAt)
$newMd  = $before + "`r`n" + $mdRow + "`r`n" + $after
Set-Content -Encoding utf8NoBOM -Path $mdPath -Value $newMd

# 5) CSV append (quote fields with commas/quotes)
function _q([string]$s){ if($s -match '[,"]'){ '"' + ($s -replace '"','""') + '"' } else { $s } }
$csvLine = ($utc, $Repo, $Area, $Action, $prText, $sha, $Note | ForEach-Object { _q $_ }) -join ','
Add-Content -Encoding utf8NoBOM -Path $csvPath -Value $csvLine

# 6) Friendly console line (not PS syntax)
Write-Host "[violet] $($utc.Substring(0,10)) $Repo@$sha $Area — $Action ; $Note ; s:v1"