param(
  [string]$TargetRepoName,
  [string]$SessionLabel,
  [string]$Role = 'product-session'
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$root      = Join-Path $HOME 'Documents\GitHub'
$coSteward = Join-Path $root 'CoSteward'

if(-not (Test-Path $coSteward)){
  throw "CoSteward repo not found at: $coSteward"
}

$CoBus    = $null
$CoAnchor = $null

# Optional CoBus bootstrap
$CoBusScript = Join-Path $coSteward 'scripts/Invoke-CoBusBootstrap.ps1'
if(Test-Path $CoBusScript){
  $CoBus = & $CoBusScript `
    -TargetRepoName $TargetRepoName `
    -SessionLabel   $SessionLabel `
    -Role           $Role
}

# Optional CoAnchor pointer
$CoAnchorScript = Join-Path $coSteward 'scripts/Get-CoAnchorQuickstart.ps1'
if(Test-Path $CoAnchorScript){
  $CoAnchor = & $CoAnchorScript `
    -SessionLabel $SessionLabel
}

[PSCustomObject]@{
  session_label = $SessionLabel
  target_repo   = $TargetRepoName
  role          = $Role
  cobus         = $CoBus
  coanchor      = $CoAnchor
  ts_utc        = (Get-Date).ToUniversalTime().ToString('yyyy-MM-ddTHHmmssZ')
}
