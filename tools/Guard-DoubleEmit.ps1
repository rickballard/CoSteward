[CmdletBinding()]
param([Parameter(Mandatory)][string]$Slug)
$ErrorActionPreference = 'Stop'
Import-Module Microsoft.PowerShell.Management -EA SilentlyContinue | Out-Null
$root   = (Resolve-Path '.').Path
$status = Join-Path $root 'STATUS'
New-Item -ItemType Directory -Force $status | Out-Null
$log    = Join-Path $status 'violets.log'
if(!(Test-Path $log)){ Write-Host "guard: no violets.log yet → OK"; exit 0 }
$today  = (Get-Date -AsUTC).ToString('yyyy-MM-dd')
$todayLines = Select-String -LiteralPath $log -Pattern ("[violet] " + $today + " ") | ForEach-Object { $_.Line }
$hits = $todayLines | Where-Object { $_ -match ("set:S-" + [regex]::Escape($Slug)) }
if(($hits | Measure-Object).Count -gt 0){
  Write-Warning ("guard: a violet for S-{0} already exists today ({1})" -f $Slug, (($hits | Measure-Object).Count))
  exit 2  # duplicate
}
Write-Host "guard: OK (no duplicate emit today for S-$Slug)"
exit 0
