param(
  [switch]$Hub,
  [string]$SnippetsRoot = "$(Join-Path $PSScriptRoot '..\snippets')"
)
$ErrorActionPreference="Stop"
$Repo = (Get-Location).Path
$wfDir = Join-Path $Repo ".github/workflows"
New-Item -ItemType Directory -Force $wfDir | Out-Null

# Always install repo rails
Copy-Item (Join-Path $SnippetsRoot 'guard-gib-org.yml')           (Join-Path $wfDir "guard-gib-org.yml")           -Force
Copy-Item (Join-Path $SnippetsRoot 'gib-satellite.yml')           (Join-Path $wfDir "gib-satellite.yml")          -Force
Copy-Item (Join-Path $SnippetsRoot 'violet-receipts-summary.yml') (Join-Path $wfDir "violet-receipts-summary.yml") -Force

# Hub extras
if($Hub){
  Copy-Item (Join-Path $SnippetsRoot 'drift-catcher.yml')    (Join-Path $wfDir "drift-catcher.yml")     -Force
  Copy-Item (Join-Path $SnippetsRoot 'gib-hub-annotate.yml') (Join-Path $wfDir "gib-hub-annotate.yml")  -Force
  New-Item -ItemType Directory -Force (Join-Path $Repo "ops") | Out-Null
  if(Test-Path (Join-Path $PSScriptRoot '..\ops\flags.yml')){
    Copy-Item (Join-Path $PSScriptRoot '..\ops\flags.yml') (Join-Path $Repo 'ops\flags.yml') -Force
  }
}

git -C $Repo fetch origin
$br = "ci/gib-rails-"+(Get-Date -AsUTC).ToString("yyyyMMdd_HHmmssZ")
git -C $Repo switch -c $br origin/main
git -C $Repo add --all
if(git -C $Repo diff --cached --quiet){ Write-Host "No changes to commit."; exit 0 }
git -C $Repo commit -m "ci: add gib rails (guard+satellite+violet$([string]::IsNullOrEmpty($Hub) ? '' : '+hub'))"
git -C $Repo push -u origin HEAD
gh pr create -B main -H $br -t "ci: gib rails" -b "Add guard + satellite + violet$([string]::IsNullOrEmpty($Hub) ? '' : ' + hub')"
gh pr merge --squash --delete-branch --admin
git -C $Repo switch main; git -C $Repo pull --ff-only
