param(
  [string]$Repo     = "CoSteward",
  [string]$Area     = "ops",
  [string]$Action   = "",
  [int[]] $PR       = @(),
  [string]$Note     = "",
  [string]$RepoUrl  = "https://github.com/rickballard/CoSteward"
)
$ErrorActionPreference="Stop"
$VIOLET_SCHEMA = "v1"
$here = Split-Path -Parent $PSCommandPath
$root = (Resolve-Path (Join-Path $here "..")).Path  # tools/.. -> repo root
$docsOps = Join-Path $root "docs\ops"
$status  = Join-Path $root "STATUS"
$mdPath  = Join-Path $docsOps "RECEIPTS.md"
$csvPath = Join-Path $status  "receipts.csv"
foreach($p in @($docsOps,$status)){ if(-not (Test-Path $p)){ New-Item -ItemType Directory -Force $p | Out-Null } }
$utc = [DateTimeOffset]::UtcNow.ToString("yyyy-MM-ddTHH:mm:ssZ")
$branch = (& git -C $root branch --show-current).Trim(); if([string]::IsNullOrWhiteSpace($branch)){ $branch = "detached" }
$sha = (& git -C $root rev-parse --short HEAD).Trim()
$prs = if($PR){ ($PR | ForEach-Object { "#$_" }) -join "," } else { "" }
$prLinks = if($PR){ ($PR | ForEach-Object { "[#$_]($RepoUrl/pull/$_)" }) -join ", " } else { "" }
$csvLine = "{0},{1},{2},{3},{4},{5},{6},{7},{8}" -f $utc,$Repo,$branch,$sha,$Area,($Action -replace ",",";"),($prs -replace ",",";"),($Note -replace ",",";"),$VIOLET_SCHEMA
if(-not (Test-Path $csvPath)){ "utc,repo,branch,sha,area,action,prs,note,schema" | Add-Content -Encoding utf8NoBOM $csvPath }
Add-Content -Path $csvPath -Value $csvLine -Encoding utf8NoBOM
$mdPrSuffix = if([string]::IsNullOrWhiteSpace($prLinks)){ "" } else { " · PRs: " + $prLinks }
$line = "- **{0}** · `{1}@{2}` · **{3}** — {4}{5} ; s:{6}" -f $utc,$Repo,$sha,$Area,$Action,$mdPrSuffix,$VIOLET_SCHEMA
$existing = Get-Content $mdPath -Raw -EA SilentlyContinue
$idx = $existing.IndexOf("## Entries")
if($idx -ge 0){
  $afterHeader = $existing.IndexOf([Environment]::NewLine,$idx)
  $before = $existing.Substring(0,$afterHeader)
  $after  = $existing.Substring($afterHeader)
  Set-Content -Path $mdPath -Value ($before + [Environment]::NewLine + [Environment]::NewLine + $line + $after) -Encoding utf8NoBOM
} else {
  if(-not $existing){
    Set-Content -Path $mdPath -Value ("# Violet Receipts (Hybrid)"+[Environment]::NewLine+[Environment]::NewLine+"## Entries"+[Environment]::NewLine) -Encoding utf8NoBOM
  }
  Add-Content -Path $mdPath -Value $line -Encoding utf8NoBOM
}
$vioPrSuffix = if([string]::IsNullOrWhiteSpace($prs)){ "" } else { " ; " + $prs }
$noteSuffix  = if([string]::IsNullOrWhiteSpace($Note)){ "" } else { " ; " + $Note }
$ansiStart = "`e[95m"; $ansiEnd = "`e[0m"
if(-not [string]::IsNullOrWhiteSpace($PromptText)){
  Write-Host ($ansiStart + $PromptText + $ansiEnd)
}
Write-Host ($ansiStart + $violet + $ansiEnd)
try{ Set-Clipboard -Value $violet }catch{}

