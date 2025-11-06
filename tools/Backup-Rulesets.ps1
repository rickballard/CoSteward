param(
  [string]$RepoSlug = "rickballard/CoSteward",
  [string]$OutDir
)
$ErrorActionPreference='Stop'
if(-not $OutDir){ $OutDir = Join-Path (Split-Path -Parent $PSCommandPath | Split-Path -Parent) "docs/ops/policies/rulesets/_snapshots" }
New-Item -ItemType Directory -Force $OutDir *> $null
$UTC = (Get-Date).ToUniversalTime().ToString("yyyyMMdd_HHmmssZ")
$data = gh api "repos/$RepoSlug/rulesets" | ConvertFrom-Json
$file = Join-Path $OutDir ("rulesets_{0}.json" -f $UTC)
($data | ConvertTo-Json -Depth 100) | Set-Content -Encoding UTF8 $file
Write-Host ("[OK] Snapshot -> {0}" -f $file) -ForegroundColor Green
