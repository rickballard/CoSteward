[CmdletBinding()]
param(
  [Parameter(Mandatory=$true)][string]$Slug,
  [string]$Status = "ok",
  [string]$Symbol = "=",
  [int]   $BarLen = 24
)
$ErrorActionPreference = 'Stop'
Import-Module Microsoft.PowerShell.Management -EA SilentlyContinue | Out-Null
$root  = (Resolve-Path '.').Path
$setMd = Join-Path $root ("docs\intent\sets\" + $Slug + "\SET.md")
if(!(Test-Path $setMd)){ throw "SET.md not found for slug: $Slug at $setMd" }
$txt    = Get-Content $setMd -Raw -EA Stop
$cycles = ([regex]::Matches($txt,'(?im)^\s*##\s*Cycle\s+')).Count
$doBlk  = ([regex]::Matches($txt,'(?im)^\s*```powershell')).Count
$sha    = (git -C $root rev-parse --short HEAD) 2>$null; if([string]::IsNullOrWhiteSpace($sha)){$sha='n/a'}
$stamp  = (Get-Date -AsUTC).ToString('yyyy-MM-dd')
$violet = "[violet] {0} CoSteward@{1} set:S-{2} cycles:{3} do:{4} status:{5} ; s:v1" -f $stamp,$sha,$Slug,$cycles,$doBlk,$Status
$escStart="`e[95m"; $escEnd="`e[0m"
$bar = ($Symbol * [Math]::Max(1,$BarLen))
Write-Host ($escStart + $bar    + $escEnd)
Write-Host ($escStart + $violet + $escEnd)
Write-Host ($escStart + $bar    + $escEnd)
try{ Set-Clipboard -Value $violet }catch{}
$STATUS = Join-Path $root 'STATUS'
New-Item -ItemType Directory -Force $STATUS | Out-Null
$obj = [pscustomobject]@{ slug=$Slug; cycles=$cycles; do_blocks=$doBlk; status=$Status; sha=$sha; at_utc=(Get-Date -AsUTC).ToString('o') }
($obj | ConvertTo-Json -Compress) + [Environment]::NewLine | Add-Content -Path (Join-Path $STATUS 'sets.jsonl') -Encoding utf8NoBOM
($violet + [Environment]::NewLine) | Add-Content -Path (Join-Path $STATUS 'violets.log') -Encoding utf8NoBOM
