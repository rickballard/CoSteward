[CmdletBinding()]
param([Parameter(Mandatory)][string]$Slug,[int]$RecentShas=5,[int]$Hours=24)
$ErrorActionPreference="Stop"
Import-Module Microsoft.PowerShell.Management -EA SilentlyContinue | Out-Null

$root   = (Resolve-Path ".").Path
$status = Join-Path $root "STATUS"
$setMd  = Join-Path $root ("docs\intent\sets\"+$Slug+"\SET.md")
$vioLog = Join-Path $status "violets.log"
$setsJl = Join-Path $status "sets.jsonl"

$ok=@(); $miss=@()
if(Test-Path $setMd){ $ok+="SET.md" }else{ $miss+="SET.md" }
if(Test-Path $vioLog){ $ok+="violets.log" }else{ $miss+="violets.log" }
if(Test-Path $setsJl){ $ok+="sets.jsonl" }else{ $miss+="sets.jsonl" }

$sha = (git -C $root rev-parse --short HEAD) 2>$null; if([string]::IsNullOrWhiteSpace($sha)){$sha="n/a"}
$since = (Get-Date -AsUTC).AddHours(-[math]::Abs($Hours))
$vioToday=@()
if(Test-Path $vioLog){
  $lines = Get-Content -Path $vioLog -EA SilentlyContinue
  $vioToday = $lines | ? { $_ -match ("set:S-"+[regex]::Escape($Slug)) }
  if($vioToday){ $ok+="recent violet for slug" } else { $miss+="recent violet for slug" }
  if($vioToday -and ($vioToday -match [regex]::Escape($sha))){ $ok+="@sha matches recent" } else { $miss+="@sha matches recent" }
}

Write-Host ("OK:   " + ($ok -join ", "))
Write-Host ("MISS: " + ($miss -join ", "))
