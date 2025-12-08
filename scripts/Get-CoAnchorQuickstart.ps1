param(
  [string]$SessionLabel = '',
  [switch]$AsText
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$root      = Join-Path $HOME 'Documents\GitHub'
$coSteward = Join-Path $root 'CoSteward'

if(-not (Test-Path $coSteward)){
  throw "CoSteward repo not found at: $coSteward"
}

$anchorPath = Join-Path $coSteward 'docs/onramps/CoAnchor_Quickstart_Generic_v2.md'

$result = [PSCustomObject]@{
  session_label = $SessionLabel
  anchor_path   = $anchorPath
  exists        = (Test-Path $anchorPath)
  ts_utc        = (Get-Date).ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ssZ')
}

if($AsText){
  if(-not (Test-Path $anchorPath)){
    throw "CoAnchor quickstart file not found at: $anchorPath"
  }
  Get-Content $anchorPath -Raw
} else {
  $result
}

# Example usage (for other DO blocks), all commented so safe to paste:

# $CoBus = & "$HOME\Documents\GitHub\CoSteward\scripts\Invoke-CoBusBootstrap.ps1" `
#   -TargetRepoName 'CoIndex' `
#   -SessionLabel   'MySessionLabel' `
#   -Role           'product-session'
#
# $CoAnchor = & "$HOME\Documents\GitHub\CoSteward\scripts\Get-CoAnchorQuickstart.ps1" `
#   -SessionLabel 'MySessionLabel'
#
# Write-Host "CoAnchor path :" $CoAnchor.anchor_path
# Write-Host "CoAnchor exists:" $CoAnchor.exists
#
# # If you ever need the raw markdown:
# # $text = & "$HOME\Documents\GitHub\CoSteward\scripts\Get-CoAnchorQuickstart.ps1" `
# #   -SessionLabel 'MySessionLabel' -AsText
# # $text | Out-Host
