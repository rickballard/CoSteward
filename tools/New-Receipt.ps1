param(
  [string]$Repo     = "CoSteward",
  [string]$Area     = "ops",
  [string]$Action   = "",
  [int[]] $PR       = @(),
  [string]$Note     = ""
)
$ErrorActionPreference="Stop"
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
$csvLine = "{0},{1},{2},{3},{4},{5},{6},{7}" -f $utc,$Repo,$branch,$sha,$Area,($Action -replace ",",";"),($prs -replace ",",";"),($Note -replace ",",";")
if(-not (Test-Path $csvPath)){ "utc,repo,branch,sha,area,action,prs,note" | Add-Content -Encoding utf8NoBOM $csvPath }
Add-Content -Path $csvPath -Value $csvLine -Encoding utf8NoBOM

# precompute suffixes to avoid inline-if in -f
$mdPrSuffix = if([string]::IsNullOrWhiteSpace($prs)){ "" } else { " · PRs: " + $prs }
$vioPrSuffix = if([string]::IsNullOrWhiteSpace($prs)){ "" } else { " ; "   + $prs }
$noteSuffix  = if([string]::IsNullOrWhiteSpace($Note)){ "" } else { " ; " + $Note }

$line = "- **{0}** · `{1}@{2}` · **{3}** — {4}{5}" -f $utc,$Repo,$sha,$Area,$Action,$mdPrSuffix
$existing = Get-Content $mdPath -Raw -EA SilentlyContinue
$idx = $existing.IndexOf("## Entries")
if($idx -ge 0){
  $afterHeader = $existing.IndexOf([Environment]::NewLine,$idx)
  $before = $existing.Substring(0,$afterHeader)
  $after  = $existing.Substring($afterHeader)
  Set-Content -Path $mdPath -Value ($before + [Environment]::NewLine + [Environment]::NewLine + $line + $after) -Encoding utf8NoBOM
} else {
  Add-Content -Path $mdPath -Value $line -Encoding utf8NoBOM
}

$violet = "[violet] {0} {1}@{2} {3} — {4}{5}{6}" -f $utc.Substring(0,10), $Repo, $sha, $branch, $Action, $vioPrSuffix, $noteSuffix
# Console: magenta (ANSI 95); Clipboard: plain
$ansiStart = "`e[95m"; $ansiEnd = "`e[0m"
Write-Host ($ansiStart + $violet + $ansiEnd)
try{ Set-Clipboard -Value $violet }catch{}

