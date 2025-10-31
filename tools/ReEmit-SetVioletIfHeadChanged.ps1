[CmdletBinding()]
param([Parameter(Mandatory)][string]$Slug)

$ErrorActionPreference='Stop'
Import-Module Microsoft.PowerShell.Management -EA SilentlyContinue | Out-Null

$root = (Resolve-Path '.').Path
$setMd = Join-Path $root ("docs\intent\sets\"+$Slug+"\SET.md")
if(!(Test-Path $setMd)){
  throw "SET.md not found for slug: $Slug at $setMd"
}

$sha = (& git -C $root rev-parse --short HEAD) 2>$null; if([string]::IsNullOrWhiteSpace($sha)){$sha='n/a'}
$vio = Join-Path $root 'STATUS\violets.log'
$haveToday = $false
if(Test-Path $vio){
  $today = (Get-Date -AsUTC).ToString('yyyy-MM-dd')
  $todayLines = Select-String -LiteralPath $vio -Pattern ("[violet] "+$today+" ") | ForEach-Object { $_.Line }
  $haveToday = $todayLines | Where-Object { $_ -match ("set:S-"+[regex]::Escape($Slug)) } | ForEach-Object { $_ } | Measure-Object | Select-Object -ExpandProperty Count
  $haveToday = [int]$haveToday -gt 0 -and ($todayLines -match [regex]::Escape($sha))
}

if(-not $haveToday){
  pwsh -NoProfile -File .\tools\Emit-SetViolet.ps1 -Slug $Slug -Status ok -Symbol '■' -BarLen 24
}else{
  Write-Host "re-emit: skipped (today's violet already matches HEAD:$sha for S-$Slug)"
}