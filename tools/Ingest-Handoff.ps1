param(
  [Parameter(Mandatory)] [string]$Repo,
  [Parameter(Mandatory)] [string]$Source,
  [string]$Url = "",
  [string]$Topic = "",
  [int[]] $PR = @(),
  [string]$Note = ""
)
$ErrorActionPreference="Stop"
$VIOLET_SCHEMA="v1"
$here = Split-Path -Parent $PSCommandPath
$root = (Resolve-Path (Join-Path $here "..")).Path
$status = Join-Path $root "STATUS"
$ops    = Join-Path $root "docs\ops"
$csv    = Join-Path $status "handoffs.csv"
$md     = Join-Path $ops    "HANDOFFS.md"
foreach($p in @($status,$ops)){ if(-not (Test-Path $p)){ New-Item -ItemType Directory -Force $p | Out-Null } }
$utc   = [DateTimeOffset]::UtcNow.ToString("yyyy-MM-ddTHH:mm:ssZ")
$branch= (& git -C $root branch --show-current).Trim(); if([string]::IsNullOrWhiteSpace($branch)){ $branch="detached" }
$sha   = (& git -C $root rev-parse --short HEAD).Trim()
$prs   = if($PR){ ($PR | ForEach-Object { "#$_" }) -join "," } else { "" }
if(-not (Test-Path $csv)){ "utc,repo,branch,sha,source,topic,url,prs,note,schema" | Add-Content -Encoding utf8NoBOM $csv }
$row = "{0},{1},{2},{3},{4},{5},{6},{7},{8},{9}" -f $utc,$Repo,$branch,$sha,($Source -replace ",",";"),($Topic -replace ",",";"),($Url -replace ",",";"),($prs -replace ",",";"),($Note -replace ",",";"),$VIOLET_SCHEMA
Add-Content -Path $csv -Value $row -Encoding utf8NoBOM
$mdHeader = if(Test-Path $md){ (Get-Content $md -Raw -EA SilentlyContinue) } else { "" }
if(-not $mdHeader){
  $mdHeader = "# Handoffs Index"+[Environment]::NewLine+[Environment]::NewLine+"Newest first."+[Environment]::NewLine+[Environment]::NewLine+"## Entries"+[Environment]::NewLine
  Set-Content -Path $md -Value $mdHeader -Encoding utf8NoBOM
}
# precompute MD suffixes (avoid inline-if in -f)
$mdTopic = if([string]::IsNullOrWhiteSpace($Topic)) { "" } else { $Topic }
$mdUrl   = if([string]::IsNullOrWhiteSpace($Url))   { "" } else { " · " + $Url }
$mdPrs   = if([string]::IsNullOrWhiteSpace($prs))   { "" } else { " · PRs: " + $prs }
$mdNote  = if([string]::IsNullOrWhiteSpace($Note))  { "" } else { " · " + $Note }
$mdLine = "- **{0}** · `{1}@{2}` · **{3}** — {4}{5}{6}{7} ; s:{8}" -f $utc,$Repo,$sha,$Source,$mdTopic,$mdUrl,$mdPrs,$mdNote,$VIOLET_SCHEMA
$existing = Get-Content $md -Raw -EA SilentlyContinue
$at = $existing.IndexOf("## Entries")
if($at -ge 0){
  $split = $existing.IndexOf([Environment]::NewLine,$at)
  $before = $existing.Substring(0,$split)
  $after  = $existing.Substring($split)
  Set-Content -Path $md -Value ($before + [Environment]::NewLine + [Environment]::NewLine + $mdLine + $after) -Encoding utf8NoBOM
} else {
  Add-Content -Path $md -Value $mdLine -Encoding utf8NoBOM
}
# precompute violet suffixes
$vioPr  = if([string]::IsNullOrWhiteSpace($prs))  { "" } else { " ; " + $prs }
$vioUrl = if([string]::IsNullOrWhiteSpace($Url))  { "" } else { " ; " + $Url }
$vioTop = if([string]::IsNullOrWhiteSpace($Topic)){ "" } else { " ; " + $Topic }
$vioNot = if([string]::IsNullOrWhiteSpace($Note)) { "" } else { " ; " + $Note }
$vio = "[violet] {0} {1}@{2} {3} — handoff{4}{5}{6}{7} ; s:{8}" -f $utc.Substring(0,10), $Repo, $sha, $branch, $vioTop, $vioUrl, $vioPr, $vioNot, $VIOLET_SCHEMA
Write-Host ("`e[95m"+$vio+"`e[0m")
try{ Set-Clipboard -Value $vio }catch{}
