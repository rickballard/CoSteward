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
  [CmdletBinding()]
  param(
    [string]$RepoSlug = "rickballard/CoSteward",
    [string]$OutDir
  )
  $ErrorActionPreference='Stop'
  $bk = Join-Path (Split-Path -Parent $PSCommandPath) 'Backup-Rulesets.ps1'
  if(!(Test-Path $bk)){ throw "Missing helper: tools/Backup-Rulesets.ps1" }
  if($OutDir){ & $bk -RepoSlug $RepoSlug -OutDir $OutDir } else { & $bk -RepoSlug $RepoSlug }
}

Export-ModuleMember -Function Invoke-InboxGuard,Invoke-VerifyCoTips,Get-Rulesets,Upsert-Ruleset,Backup-Rulesets
