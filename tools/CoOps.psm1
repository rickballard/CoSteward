# CoOps.psm1 — thin aggregation over existing repo helpers
# Exported functions: Invoke-InboxGuard, Invoke-VerifyCoTips, Get-Rulesets, Upsert-Ruleset, Backup-Rulesets

function Invoke-InboxGuard {
  [CmdletBinding()]
  param(
    [string]$RepoRoot = (Split-Path -Parent $PSCommandPath | Split-Path -Parent)
  )
  $ErrorActionPreference='Stop'
  $guard = Join-Path $RepoRoot 'advice/inbox/.CoVerify.ps1'
  if(Test-Path $guard){
    & $guard
    return
  }
  Write-Host "[NOTE] inbox guard script not found at advice/inbox/.CoVerify.ps1 — nothing to run." -ForegroundColor Yellow
}

function Invoke-VerifyCoTips {
  [CmdletBinding()]
  param(
    [string]$RepoRoot = (Split-Path -Parent $PSCommandPath | Split-Path -Parent)
  )
  $ErrorActionPreference='Stop'
  $ver = Join-Path $RepoRoot 'tools/Verify-CoTips.ps1'
  if(!(Test-Path $ver)){ throw "Missing: tools/Verify-CoTips.ps1" }
  & $ver
}

function Get-Rulesets {
  [CmdletBinding()]
  param(
    [string]$RepoSlug = "rickballard/CoSteward",
    [string]$Name = "seed-mode (main)"
  )
  $ErrorActionPreference='Stop'
  $jq = ".[] | select(.target==\"branch\" and .name==\"$Name\") | {id,name,enforcement,includes:.conditions.ref_name.include,rules:[.rules[].type]}"
  gh api "repos/$RepoSlug/rulesets" -q $jq
}

function Upsert-Ruleset {
  [CmdletBinding()]
  param(
    [string]$RepoSlug = "rickballard/CoSteward",
    [string]$TemplatePath
  )
  $ErrorActionPreference='Stop'
  $up = Join-Path (Split-Path -Parent $PSCommandPath) 'Upsert-Ruleset.ps1'
  if(!(Test-Path $up)){ throw "Missing helper: tools/Upsert-Ruleset.ps1" }
  & $up -RepoSlug $RepoSlug -TemplatePath $TemplatePath
}
function Backup-Rulesets {
  [CmdletBinding()] param(
    [string]rickballard/CoSteward = "rickballard/CoSteward",
    [string]C:\Users\Chris\docs\_reports
  )
  \Stop='Stop'
  \ = Join-Path (Split-Path -Parent \) 'Backup-Rulesets.ps1'
  if (Test-Path \) {
    if (\C:\Users\Chris\docs\_reports) { & \ -RepoSlug \rickballard/CoSteward -OutDir \C:\Users\Chris\docs\_reports } else { & \ -RepoSlug \rickballard/CoSteward }
    return
  }
  # Fallback: call GitHub REST via 'gh api' and save to snapshots
  if ([string]::IsNullOrWhiteSpace(\C:\Users\Chris\docs\_reports)) { \C:\Users\Chris\docs\_reports = "docs/ops/policies/rulesets/_snapshots" }
  if (-not (Test-Path \C:\Users\Chris\docs\_reports)) { New-Item -ItemType Directory -Force -Path \C:\Users\Chris\docs\_reports | Out-Null }
  if (-not \ -and -not \) {
    throw "GH_TOKEN/GITHUB_TOKEN not set; export one in the workflow step."
  }
  \20251106_033712Z = (Get-Date).ToUniversalTime().ToString('yyyyMMdd_HHmmssZ')
  \ = Join-Path \C:\Users\Chris\docs\_reports ("rulesets_{0}.json" -f \20251106_033712Z)
  # Use gh api (which ships on ubuntu runners); GH_TOKEN is picked up automatically
  \ = gh api "repos/\rickballard/CoSteward/rulesets" 2>&1
  if (\0 -ne 0) { throw "gh api failed: \" }
  [IO.File]::WriteAllText(\, [string]\, [Text.UTF8Encoding]::new(\False))
  Write-Host "[OK] Snapshot -> \" -ForegroundColor Green
}Export-ModuleMember -Function Invoke-InboxGuard,Invoke-VerifyCoTips,Get-Rulesets,Upsert-Ruleset,Backup-Rulesets
