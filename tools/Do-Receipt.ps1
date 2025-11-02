param(
  [Parameter(Mandatory)][string]$Set,
  [int]$Cycles=1,
  [int]$Do=0,
  [ValidateSet("ok","warn","fail")][string]$Status="ok",
  [string]$Schema="v1"
)
$vioPath = Join-Path $PSScriptRoot '..\STATUS\violets.log'
$ts = (Get-Date).ToString('yyyy-MM-dd')
$sha = (git -C (Split-Path $PSScriptRoot -Parent) rev-parse --short HEAD) 2>$null
$line = "[violet] $ts CoSteward@$sha set:$Set cycles:$Cycles do:$Do status:$Status ; s:$Schema"
New-Item -ItemType Directory -Force (Split-Path $vioPath) | Out-Null
Add-Content -Encoding utf8NoBOM $vioPath $line
pwsh -NoProfile -File (Join-Path $PSScriptRoot 'Receipt-Echo.ps1') | Write-Output
