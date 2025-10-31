param(
  [string]$RepoRoot = $(Resolve-Path "."),
  [int]   $BloatBudgetMB = 500,
  [int]   $LookbackDays  = 14,
  [switch]$EmitViolet,
  [string]$PromptText = "Please triple-click the next violet line and paste it back into AI chat:"
)

$ErrorActionPreference='Stop'
Import-Module Microsoft.PowerShell.Management, Microsoft.PowerShell.Utility -EA SilentlyContinue | Out-Null
$Utf8NoBom = [System.Text.UTF8Encoding]::new($false)
function Ensure-Dir([string]$p){ $d=Split-Path $p; if($d){ New-Item -ItemType Directory -Force $d | Out-Null } }

$root = (Resolve-Path $RepoRoot).Path
Set-Location $root

# 1) Catalog helpers
$helperGlobs = @(
  "tools/*.ps1","tools/*.psm1","tools/**/*.ps1","tools/**/*.psm1",
  "scripts/*.ps1","scripts/**/*.ps1",
  ".github/workflows/*.yml",".github/workflows/*.yaml",
  "docs/ops/**/*.md","advice/inbox/README.md"
)
$helpers = @()
foreach($g in $helperGlobs){ $helpers += Get-ChildItem -File -Path (Join-Path $root $g) -EA SilentlyContinue }
$helpers = $helpers | Sort-Object FullName -Unique
$helpersCount = $helpers.Count

# 2) Recently touched (“re-read”) alignment assets
$since = (Get-Date).ToUniversalTime().AddDays(-$LookbackDays)
$alignmentCount = ($helpers | Where-Object { $_.LastWriteTimeUtc -ge $since } | Measure-Object).Count

# 3) Bloat proxy via git (safe fallbacks)
$sizePackKB = 0
try{
  $gitInfo = (& git -C $root count-objects -v) -join "`n"
  $line = ($gitInfo -split "`r?`n") | Where-Object { $_ -match "^size-pack:\s+(\d+)" } | Select-Object -First 1
  if($line){ $null=[int]::TryParse(($line -split ":\s*")[-1],[ref]$sizePackKB) }
}catch{}
$workingMB = [math]::Round($sizePackKB/1024.0,2)
$bloatPct  = if($BloatBudgetMB -gt 0){ [math]::Min(999,[math]::Round(100.0*$workingMB/$BloatBudgetMB,2)) } else { 0 }

# 4) Receipts (machine + human)
$stampUtc = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
$sha   = "n/a"; $branch="n/a"
try{ $sha = (& git -C $root rev-parse --short HEAD).Trim() }catch{}
try{ $branch = (& git -C $root branch --show-current).Trim(); if([string]::IsNullOrWhiteSpace($branch)){ $branch="detached" } }catch{}

$STATUS = Join-Path $root "STATUS"
$OPS    = Join-Path $root "docs/ops"
Ensure-Dir $STATUS; Ensure-Dir $OPS

# Machine log (JSONL)
$cosyncJson = Join-Path $STATUS "cosync_log.jsonl"
$entry = @{
  utc=$stampUtc; sha=$sha; branch=$branch;
  helpers_indexed=$helpersCount; assets_reread=$alignmentCount;
  working_set_mb=$workingMB; budget_mb=$BloatBudgetMB; bloat_pct=$bloatPct
}
($entry | ConvertTo-Json -Compress) + [Environment]::NewLine | Add-Content -Path $cosyncJson -Encoding utf8NoBOM

# Human doc (newest first beneath "## Entries")
$md = Join-Path $OPS "COSYNC.md"
if(-not (Test-Path $md)){
  Set-Content -Path $md -Value ("# CoSync Handshakes`n`nNewest first.`n`n## Entries`n") -Encoding utf8NoBOM
}
$line = "- **$stampUtc** · `$sha@$branch` — helpers:$helpersCount · reread:$alignmentCount · working_set:${workingMB}MB/${BloatBudgetMB}MB (${bloatPct}%)"
$existing = Get-Content $md -Raw -EA SilentlyContinue
$anchor = $existing.IndexOf("## Entries")
if($anchor -ge 0){
  $nl = [Environment]::NewLine
  $afterHeader = $existing.IndexOf($nl,$anchor)
  if($afterHeader -lt 0){ $afterHeader = $existing.Length }
  $before = $existing.Substring(0,$afterHeader)
  $after  = $existing.Substring($afterHeader)
  Set-Content -Path $md -Value ($before+$nl+$nl+$line+$after) -Encoding utf8NoBOM
}else{
  Add-Content -Path $md -Value $line -Encoding utf8NoBOM
}

# 5) Optional VIOLET emit (console shows prompt + payload; clipboard = payload)
if($EmitViolet){
  $violet = "[violet] {0} CoSteward@{1} {2} — cosync ; h:{3} ; r:{4} ; z:{5}% ; s:v1" -f (Get-Date -AsUTC).ToString("yyyy-MM-dd"), $sha, $branch, $helpersCount, $alignmentCount, $bloatPct
  $ansiStart = "`e[95m"; $ansiEnd = "`e[0m"
  if(-not [string]::IsNullOrWhiteSpace($PromptText)){ Write-Host ($ansiStart + $PromptText + $ansiEnd) }
  Write-Host ($ansiStart + $violet + $ansiEnd)
  try{ Set-Clipboard -Value $violet }catch{}
}

Write-Host "CoSync: helpers=$helpersCount reread=$alignmentCount bloat=${bloatPct}% (${workingMB}MB/${BloatBudgetMB}MB)."
