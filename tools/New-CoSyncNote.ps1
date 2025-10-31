[CmdletBinding()]
param([string]$RepoSlug="rickballard/CoSteward",[int]$Tail=10)
$ErrorActionPreference="Stop"
Import-Module Microsoft.PowerShell.Management -EA SilentlyContinue | Out-Null
$root=(Resolve-Path ".").Path
$status=Join-Path $root "STATUS"
$vio  = Join-Path $status "violets.log"
$jsonl= Join-Path $status "sets.jsonl"
$yyyymmdd=(Get-Date -AsUTC).ToString("yyyyMMdd")
$stampZ  =(Get-Date -AsUTC).ToString("yyyyMMdd-HHmmssZ")
$dir = Join-Path $root ("docs/intent/advice/notes/" + $yyyymmdd)
New-Item -ItemType Directory -Force $dir | Out-Null
$path= Join-Path $dir ("CoSync_" + $stampZ + ".md")
$sha = (git -C $root rev-parse --short HEAD) 2>$null; if([string]::IsNullOrWhiteSpace($sha)){$sha="n/a"}
$vioTail  = (Test-Path $vio)   ? (Get-Content -Tail $Tail $vio)   : @("no violets.log")
$setTail  = (Test-Path $jsonl) ? (Get-Content -Tail $Tail $jsonl) : @("no sets.jsonl")
try{ $prs = (& gh -R $RepoSlug pr list --limit 20 --state open --json number,title,url | ConvertFrom-Json) }catch{ $prs=@() }
$lines = @()
$lines += "# CoSync $stampZ"
$lines += ""
$lines += "**Repo:** $RepoSlug @ $sha"
$lines += ""
$lines += "## Violet tail"
$lines += '`'
$lines += $vioTail
$lines += '`'
$lines += ""
$lines += "## sets.jsonl tail"
$lines += '`'
$lines += $setTail
$lines += '`'
$lines += ""
$lines += "## Open PRs"
if($prs.Count -gt 0){ $prs | ForEach-Object { $lines += ("- PR #{0}: {1}  " -f $_.number,$_.title); $lines += ("  - " + $_.url) } } else { $lines += "- (none or gh unavailable)" }
$lines += ""
$lines += "## Next steps"
$lines += "- Merge CI/ops PRs when green."
$lines += "- Emit violet on close if final changes land."
[IO.File]::WriteAllLines($path,$lines,[System.Text.UTF8Encoding]::new($false))
Write-Host ("CoSync note → " + $path)
$violet = "[violet] {0} CoSyncNote@{1} path:{2} ; s:v1" -f ((Get-Date -AsUTC).ToString("yyyy-MM-dd")),$sha,($path -replace [regex]::Escape($root),".")
$escStart="`e[95m"; $escEnd="`e[0m"
Write-Host ($escStart + ($violet) + $escEnd)
try{ Set-Clipboard -Value $violet }catch{}
