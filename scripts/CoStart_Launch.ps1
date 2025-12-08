param(
  [string]$TargetRepoName = '',
  [string]$SessionLabel   = '',
  [string]$Role           = 'product-session'
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

if(-not $TargetRepoName){
  $TargetRepoName = Read-Host 'Target repo name (e.g. CoIndex, CoAgent, CoCivium)'
}

if(-not $SessionLabel){
  $SessionLabel = Read-Host 'Session label (e.g. CoIndex20251128)'
}

$root      = Join-Path $HOME 'Documents\GitHub'
$coSteward = Join-Path $root 'CoSteward'

$bootstrapScript = Join-Path $coSteward 'scripts\Invoke-CoSessionBootstrap.ps1'
if(-not (Test-Path $bootstrapScript)){
  throw "Invoke-CoSessionBootstrap.ps1 not found at: $bootstrapScript"
}

$SessionBootstrap = & $bootstrapScript `
  -TargetRepoName $TargetRepoName `
  -SessionLabel   $SessionLabel `
  -Role           $Role

''
'=== CoStart session bootstrap ==='
" session_label : $($SessionBootstrap.session_label)"
" target_repo   : $($SessionBootstrap.target_repo)"
" role          : $($SessionBootstrap.role)"

if($SessionBootstrap.coanchor){
  " CoAnchor path : $($SessionBootstrap.coanchor.anchor_path)"
  " CoAnchor ok   : $($SessionBootstrap.coanchor.exists)"
}

if($SessionBootstrap.cobus){
  " CoBus repo    : $($SessionBootstrap.cobus.repo_name)"
  " CoBus lanes   : $($SessionBootstrap.cobus.lanes_doc)"
}

''
'You can now paste the CoAnchor quickstart into an AI session if desired.'
''

'Press Enter to close this window when ready...' | Out-Host
[void](Read-Host)
