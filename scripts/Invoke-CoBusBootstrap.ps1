param(
  [string]$TargetRepoName,
  [string]$SessionLabel,
  [string]$Role = 'product-session'
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$root = Join-Path $HOME 'Documents\GitHub'
$coSteward = Join-Path $root 'CoSteward'
if(-not (Test-Path $coSteward)){
  throw "CoSteward repo not found at: $coSteward"
}

$bpoe = Join-Path $coSteward 'docs/bpoe/CoBus_BPOE_v1.md'
$cobusStatus = Join-Path $coSteward 'docs/ops/COBUS_STATUS.md'

$targetRepoPath = $null
if([string]::IsNullOrWhiteSpace($TargetRepoName)){
  $targetRepoPath = (Get-Location).ProviderPath
  $TargetRepoName = Split-Path $targetRepoPath -Leaf
} else {
  $targetRepoPath = Join-Path $root $TargetRepoName
}

$lanesDoc = $null
if(Test-Path $targetRepoPath){
  $lanesRoot = Join-Path $targetRepoPath 'docs/intent'
  if(Test-Path $lanesRoot){
    $pattern = 'CoBus_Lanes_*_v1.md'
    $hit = Get-ChildItem -Path $lanesRoot -Filter $pattern -Recurse -File -ErrorAction SilentlyContinue | Select-Object -First 1
    if($hit){
      $lanesDoc = $hit.FullName
    }
  }
}

Write-Host '=== CoBus bootstrap v1 ==='
Write-Host " session_label : $SessionLabel"
Write-Host " role          : $Role"
Write-Host " repo_name     : $TargetRepoName"
Write-Host " repo_path     : $targetRepoPath"
Write-Host " BPOE          : $bpoe " -NoNewline
Write-Host ($(if(Test-Path $bpoe){'(found)'} else {'(missing)'}))
Write-Host " COBUS_STATUS  : $cobusStatus " -NoNewline
Write-Host ($(if(Test-Path $cobusStatus){'(found)'} else {'(missing)'}))
Write-Host " lanes_doc     : $lanesDoc"

[PSCustomObject]@{
  session_label = $SessionLabel
  role          = $Role
  repo_name     = $TargetRepoName
  repo_path     = $targetRepoPath
  bpoe_path     = $bpoe
  cobus_status  = $cobusStatus
  lanes_doc     = $lanesDoc
  ts_utc        = (Get-Date).ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ssZ')
}
