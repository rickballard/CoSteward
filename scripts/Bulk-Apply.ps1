param(
  [string]$Seed = "$(Join-Path $PSScriptRoot '..\seeds\repos.txt')",
  [switch]$IncludeHub,
  [string]$SnippetsRoot = "$(Join-Path $PSScriptRoot '..\snippets')"
)
$ErrorActionPreference="Stop"
$apply = Join-Path $PSScriptRoot "Apply-To-Current-Repo.ps1"
$repos = Get-Content $Seed | ? { $_ -and -not $_.StartsWith("#") }
foreach($r in $repos){
  $org,$name = $r -split '/'
  $local = Join-Path $HOME "Documents\GitHub\$name"
  if(!(Test-Path $local)){ gh repo clone $r $local }
  Push-Location $local
  try {
    if($IncludeHub -and $name -eq 'GIBindex'){
      & $apply -Hub -SnippetsRoot $SnippetsRoot
    } else {
      & $apply -SnippetsRoot $SnippetsRoot
    }
  } finally { Pop-Location }
}
