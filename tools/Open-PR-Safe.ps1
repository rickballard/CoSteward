param(
  [string]$RepoSlug = "rickballard/CoSteward",
  [string]$Head,
  [string]$Base = "main",
  [string]$Title = "docs: update",
  [string]$Body  = "automated"
)
$ErrorActionPreference='Stop'
# Ensure gh has repo context
Push-Location (Split-Path -Parent $PSCommandPath | Split-Path -Parent)
try{
  $pr = gh -R $RepoSlug pr list --head $Head --json url --jq '.[0].url' 2>$null
  if([string]::IsNullOrWhiteSpace($pr)){
    $pr = gh -R $RepoSlug pr create --head $Head --base $Base --title $Title --body $Body
  }
  Write-Output $pr
} finally { Pop-Location }
