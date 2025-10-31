[CmdletBinding()]
param(
  [string]$MdPath  = (Join-Path (Resolve-Path (Join-Path $PSScriptRoot '..')).Path 'RECEIPTS.md'),
  [string]$CsvPath = (Join-Path (Resolve-Path (Join-Path $PSScriptRoot '..')).Path 'receipts.csv'),
  [string]$AccidentalAction = 'add scripts/reemit.ps1 + README quick ref',
  [string]$HeadSha = ''
)
$ErrorActionPreference='Stop'
if(-not $HeadSha){ $HeadSha = (& git -C (Resolve-Path (Join-Path $PSScriptRoot '..')).Path rev-parse --short HEAD).Trim() }

# --- helpers
function Parse-MdRows([string[]]$Lines){
  foreach($ln in $Lines){
    if($ln -match '^\|\s*(?<dt>[\dTZ:\-]+)\s*\|\s*(?<repo>[^|]+)\|\s*(?<area>[^|]+)\|\s*(?<action>[^|]+)\|\s*(?<pr>[^|]+)\|\s*(?<sha>[^|]+)\|\s*(?<note>[^|]+)\|'){
      [pscustomobject]@{
        Line=$ln; dt=$matches.dt.Trim(); repo=$matches.repo.Trim(); area=$matches.area.Trim()
        action=$matches.action.Trim(); pr=$matches.pr.Trim(); sha=$matches.sha.Trim(); note=$matches.note.Trim()
      }
    }
  }
}
function Render-Md([string[]]$Header, [object[]]$Rows){
  $body = ($Rows | ForEach-Object{
    "| $($_.dt) | $($_.repo) | $($_.area) | $($_.action) | $($_.pr) | $($_.sha) | $($_.note) |"
  })
  ($Header + '' + $body) -join "`r`n"
}
function Parse-Csv([string[]]$Lines){
  $hdr = $Lines | Select-Object -First 1
  $rows = $Lines | Select-Object -Skip 1
  $objs = foreach($ln in $rows){
    # split CSV simply (fields here are simple; quotes rare)
    $parts = [System.Collections.Generic.List[string]]::new()
    $sb=''; $inQ=$false
    foreach($ch in $ln.ToCharArray()){
      if($ch -eq '"'){ $inQ = -not $inQ; continue }
      if($ch -eq ',' -and -not $inQ){ $parts.Add($sb); $sb=''; continue }
      $sb += $ch
    }
    $parts.Add($sb)
    [pscustomobject]@{
      raw=$ln
      date_utc = $parts[0]; repo=$parts[1]; area=$parts[2]; action=$parts[3]; pr=$parts[4]; sha=$parts[5]; note=$parts[6]
    }
  }
  ,@($hdr),@($objs)
}
function Render-Csv($Hdr, $Rows){
  $lines = @($Hdr)
  foreach($r in $Rows){
    $vals = @($r.date_utc,$r.repo,$r.area,$r.action,$r.pr,$r.sha,$r.note) | ForEach-Object {
      if($_ -match '[,"]'){ '"' + ($_ -replace '"','""') + '"' } else { $_ }
    }
    $lines += ($vals -join ',')
  }
  $lines -join "`r`n"
}

# --- load files
$mdLines  = Get-Content -Raw -EA SilentlyContinue $MdPath -Encoding UTF8
$mdLines  = if($mdLines){ $mdLines -split "`r?`n" } else { @() }
$csvLines = Get-Content -EA SilentlyContinue $CsvPath -Encoding UTF8
$csvLines = if($csvLines){ $csvLines } else { @('date_utc,repo,area,action,pr,sha,note') }

# split md header vs rows (marker + header kept as-is)
$markerIdx = ($mdLines | Select-String -SimpleMatch '<!-- vio:append -->').LineNumber
$hdrEndIdx = ($mdLines | Select-String -SimpleMatch '|---|---|').LineNumber
if(-not $markerIdx){ $markerIdx = 3 }  # tolerant default
if(-not $hdrEndIdx){ $hdrEndIdx = 7 }
$mdHeader = $mdLines[0..($hdrEndIdx-1)]
$mdRows   = Parse-MdRows -Lines $mdLines

# 1) drop accidental md row(s): PR '-' + specific action + HEAD sha
$mdRows = $mdRows | Where-Object { !(
   $_.pr -eq '-' -and $_.action -eq $AccidentalAction -and $_.sha -eq $HeadSha
) }

# 2) de-dup md rows by (pr, sha, action) keeping earliest dt
$mdRows = $mdRows | Sort-Object { $_.dt } | Group-Object { "$($_.pr)|$($_.sha)|$($_.action)" } |
  ForEach-Object { $_.Group | Select-Object -First 1 }

# --- CSV do same
$csvHdr,$csvObjs = Parse-Csv -Lines $csvLines
$csvObjs = $csvObjs | Where-Object { !(
  $_.pr -eq '-' -and $_.action -eq $AccidentalAction -and $_.sha -eq $HeadSha
) }
$csvObjs = $csvObjs | Sort-Object { $_.date_utc } | Group-Object { "$($_.pr)|$($_.sha)|$($_.action)" } |
  ForEach-Object { $_.Group | Select-Object -First 1 }

# --- write back
Set-Content -Encoding utf8NoBOM -Path $MdPath  -Value (Render-Md -Header $mdHeader -Rows $mdRows)
Set-Content -Encoding utf8NoBOM -Path $CsvPath -Value (Render-Csv -Hdr $csvHdr -Rows $csvObjs)

Write-Host "repair: RECEIPTS normalized, accidental rows removed, duplicates collapsed."
