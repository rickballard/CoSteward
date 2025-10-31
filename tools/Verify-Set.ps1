[CmdletBinding()]
param([Parameter(Mandatory)][string]$Slug,[int]$RecentShas=5,[int]$Hours=24)
$ErrorActionPreference='Stop'
Import-Module Microsoft.PowerShell.Management -EA SilentlyContinue | Out-Null
$root  = (Resolve-Path '.').Path
$set   = Join-Path $root ("docs\intent\sets\"+$Slug+"\SET.md")
$log   = Join-Path $root 'STATUS\violets.log'
$jsonl = Join-Path $root 'STATUS\sets.jsonl'
$ok=@(); $miss=@()
if(Test-Path $set ){ $ok+="SET.md" }  else { $miss+="SET.md" }
if(Test-Path $log ){ $ok+="violets.log" } else { $miss+="violets.log" }
if(Test-Path $jsonl){ $ok+="sets.jsonl" } else { $miss+="sets.jsonl" }
$vioHit=$null
if(Test-Path $log){
  $sinceUtc=(Get-Date -AsUTC).AddHours(-$Hours)
  $lines = Get-Content -LiteralPath $log
  $cands = $lines | Where-Object { $_ -match ("set:S-"+[regex]::Escape($Slug)) }
  foreach($ln in $cands){
    if($ln -match "\[violet\]\s+(\d{4}-\d{2}-\d{2})\s+"){
      $d=[datetime]::ParseExact($Matches[1],'yyyy-MM-dd',$null)
      if($d -ge $sinceUtc.Date){ $vioHit=$ln }
    }
  }
  if($vioHit){ $ok+="recent violet for slug" } else { $miss+="recent violet for slug" }
}
$shaList=@()
for($i=0;$i -lt $RecentShas;$i++){
  $sh=(git -C $root rev-parse --short ("HEAD~"+$i)) 2>$null
  if($LASTEXITCODE -eq 0 -and $sh){ $shaList+=$sh }
}
$shaOK=$false
if($vioHit){ foreach($s in $shaList){ if($vioHit -match "@$s"){ $shaOK=$true; break } } }
if($shaOK){ $ok+="@sha matches recent" } else { $miss+="@sha matches recent" }
"OK:   {0}" -f ($ok -join ', ')
"MISS: {0}" -f ($miss -join ', ')
if($miss.Count -eq 0){ exit 0 } else { exit 2 }
