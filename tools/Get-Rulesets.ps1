param([string]$RepoSlug="rickballard/CoSteward",[string]$Name="seed-mode (main)")
$ErrorActionPreference='Stop'
try{
  $json = gh api "repos/$RepoSlug/rulesets" --silent
} catch {
  Write-Error "gh api failed. Are you authenticated and owner of the repo?"
  exit 2
}
# PowerShell-safe jq string
$jq = ".[] | select(.target==\"branch\" and .name==\"$Name\") | {id,name,enforcement,includes:.conditions.ref_name.include,rules:[.rules[].type]}"
$sel = gh api "repos/$RepoSlug/rulesets" -q $jq 2>$null
if([string]::IsNullOrWhiteSpace($sel)){ Write-Host "[NO] ruleset '$Name' not found"; exit 3 }
Write-Output $sel
