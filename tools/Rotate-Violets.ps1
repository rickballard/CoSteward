[CmdletBinding()]
param([int]$MaxMB=5,[int]$KeepDays=30)
$ErrorActionPreference="Stop"
$root=(Resolve-Path ".").Path
$status=Join-Path $root "STATUS"; New-Item -ItemType Directory -Force $status | Out-Null
$log=Join-Path $status "violets.log"
if(!(Test-Path $log)){ Write-Host "rotate: no log -> OK"; exit 0 }
$fi=Get-Item $log
if(($fi.Length/1MB) -ge $MaxMB -or $fi.LastWriteTimeUtc -lt (Get-Date -AsUTC).AddDays(-$KeepDays)){
  $stamp=(Get-Date -AsUTC).ToString("yyyyMMdd-HHmmssZ")
  $arch=Join-Path $status ("violets."+ $stamp +".log")
  Move-Item -LiteralPath $log -Destination $arch -Force
  Write-Host "rotate: archived -> $arch";
} else { Write-Host "rotate: OK (within limits)"}
