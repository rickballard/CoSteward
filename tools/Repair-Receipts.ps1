[CmdletBinding()]
param(
  [string]$MdPath  = (Join-Path (Resolve-Path (Join-Path $PSScriptRoot '..')).Path 'RECEIPTS.md'),
  [string]$CsvPath = (Join-Path (Resolve-Path (Join-Path $PSScriptRoot '..')).Path 'receipts.csv'),
  [string]$AccidentalAction = 'add scripts/reemit.ps1 + README quick ref'
)
$ErrorActionPreference='Stop'

function Parse-MdRows {
  param([string[]]$Lines)
  foreach($ln in $Lines){
    if($ln -match '^\|\s*(?<dt>\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z)\s*\|\s*(?<repo>[^|]+)\|\s*(?<area>[^|]+)\|\s*(?<action>[^|]+)\|\s*(?<pr>[^|]+)\|\s*(?<sha>[^|]+)\|\s*(?<note>[^|]+)\|'){
      [pscustomobject]@{
        line=$ln
        dt=$matches.dt.Trim(); repo=$matches.repo.Trim(); area=$matches.area.Trim()
        action=$matches.action.Trim(); pr=$matches.pr.Trim(); sha=$matches.sha.Trim(); note=$matches.note.Trim()
      }
    }
  }
}
function Render-Md {
  param([string[]]$Header,[object[]]$Rows)
  $body = $Rows | ForEach-Object {
    "| $($_.dt) | $($_.repo) | $($_.area) | $($_.action) | $($_.pr) | $($_.sha) | $($_.note) |"
  }
  (($Header + '' + $body) -join "`r`n").TrimEnd() + "`r`n"
}
function Parse-Csv {
  param([string[]]$Lines)
  if(-not $Lines){ return ,@('date_utc,repo,area,action,pr,sha,note'),@() }
  $hdr  = $Lines[0]
  $rows = @()
  foreach($ln in ($Lines | Select-Object -Skip 1)){
    if([string]::IsNullOrWhiteSpace($ln)){ continue }
    $out=@(); $sb=''; $inQ=$false
    foreach($ch in $ln.ToCharArray()){
      if($ch -eq '"'){ $inQ = -not $inQ; continue }
      if($ch -eq ',' -and -not $inQ){ $out += $sb; $sb=''; continue }
      $sb += $ch
    }
    $out += $sb
    $rows += [pscustomobject]@{
      raw=$ln; date_utc=$out[0]; repo=$out[1]; area=$out[2]; action=$out[3]; pr=$out[4]; sha=$out[5]; note=$out[6]
    }
  }
  ,@($hdr),@($rows)
}
function Render-Csv {
  param($Hdr,$Rows)
  $lines = @($Hdr)
  foreach($r in $Rows){
    $vals = @($r.date_utc,$r.repo,$r.area,$r.action,$r.pr,$r.sha,$r.note) | ForEach-Object {
      if($_ -match '[,"]'){ '"' + ($_ -replace '"','""') + '"' } else { $_ }
    }
    $lines += ($vals -join ',')
  }
  (($lines -join "`r`n").TrimEnd() + "`r`n")
}

# load
$mdRaw   = Get-Content -Raw -EA SilentlyContinue -Encoding UTF8 $MdPath
$mdLines = if($mdRaw){ $mdRaw -split "`r?`n" } else { @() }
$csvLines = Get-Content -EA SilentlyContinue -Encoding UTF8 $CsvPath
if(-not $csvLines){ $csvLines = @('date_utc,repo,area,action,pr,sha,note') }

# header split
$markerIdx = ($mdLines | Select-String -SimpleMatch '<!-- vio:append -->').LineNumber
$hdrEndIdx = ($mdLines | Select-String -SimpleMatch '|---|---|').LineNumber
if(-not $markerIdx){ $markerIdx = 3 }
if(-not $hdrEndIdx){ $hdrEndIdx = 7 }

$mdHeader = if($mdLines.Count -gt 0){
  $mdLines[0..([Math]::Min($hdrEndIdx-1,$mdLines.Count-1))]
} else {
  @(
    '# Violet Receipts',
    '',
    '<!-- vio:append -->',
    '',
    '| date (UTC) | repo | area | action | pr | sha | note |',
    '|---|---|---|---|---|---|---|',
    ''
  )
}
$mdRows = Parse-MdRows -Lines $mdLines

# 1) drop ALL accidentals in md/csv: PR='-' + exact action (sha ignored)
$mdRows = $mdRows | Where-Object { !($_.pr -eq '-' -and $_.action -eq $AccidentalAction) }
$csvHdr,$csvObjs = Parse-Csv -Lines $csvLines
$csvObjs = $csvObjs | Where-Object { !($_.pr -eq '-' -and $_.action -eq $AccidentalAction) }

# 2) de-dup by (PR,SHA,Action), keep earliest
$mdRows = $mdRows | Sort-Object dt | Group-Object { "$($_.pr)|$($_.sha)|$($_.action)" } | ForEach-Object { $_.Group | Select-Object -First 1 }
$csvObjs = $csvObjs | Sort-Object date_utc | Group-Object { "$($_.pr)|$($_.sha)|$($_.action)" } | ForEach-Object { $_.Group | Select-Object -First 1 }

# write back
Set-Content -Encoding utf8NoBOM -Path $MdPath  -Value (Render-Md  -Header $mdHeader -Rows $mdRows)
Set-Content -Encoding utf8NoBOM -Path $CsvPath -Value (Render-Csv -Hdr $csvHdr   -Rows $csvObjs)
Write-Host "repair: RECEIPTS normalized, accidentals removed (PR='-' + action), duplicates collapsed."
