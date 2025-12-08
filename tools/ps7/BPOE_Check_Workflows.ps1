param([string]$Root)
$ErrorActionPreference='Stop'; Set-StrictMode -Version Latest
if(-not $Root){ $Root = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path }
$allowPath = Join-Path $Root '.github\bpoe\allowed_actions.txt'
$allow = @()
if(Test-Path $allowPath){
  $allow = Get-Content -Path $allowPath | Where-Object { $_ -and -not $_.StartsWith('#') } | ForEach-Object { $_.Trim() }
}
$bad = @()
Get-ChildItem -Path (Join-Path $Root '.github\workflows') -File -Recurse -Include *.yml,*.yaml -ErrorAction SilentlyContinue |
  ForEach-Object {
    $t = Get-Content -Raw $_.FullName
    foreach($m in [regex]::Matches($t, '(?im)^\s*uses:\s*([^\s@]+\/[^\s@]+)@([^\s]+)\s*$')){
      $uses = $m.Groups[1].Value
      if(-not ($allow -contains $uses) -and -not ($uses -like 'actions/*') -and -not ($uses -like 'github/*')){
        $bad += "$($_.FullName): $uses"
      }
    }
  }
if($bad.Count){
  Write-Host '[BPOE guard] Non-approved actions detected:' -ForegroundColor Red
  $bad | ForEach-Object { Write-Host " - $_" -ForegroundColor Red }
  exit 2
} else {
  Write-Host '[BPOE guard] OK - workflows use only approved actions.'
}
"CoBloat: CU=OK • PU=OK • HU=OK • WT=OK"
