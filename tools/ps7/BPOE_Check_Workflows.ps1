param([string]$Root)
$ErrorActionPreference='Stop'; Set-StrictMode -Version Latest
if(-not $Root){ $Root = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path }
$allowPath = Join-Path $Root '.github\bpoe\allowed_actions.txt'
$allow = @()
if(Test-Path $allowPath){
  $allow = Get-Content -Path $allowPath | Where-Object { $_ -and -not $_.StartsWith('#') } | ForEach-Object { $_.Trim() }
}
$bad = @()
$unPinned = @()
Get-ChildItem -Path (Join-Path $Root '.github\workflows') -File -Recurse -Include *.yml,*.yaml -ErrorAction SilentlyContinue |
  ForEach-Object {
    $t = Get-Content -Raw $_.FullName
    foreach($m in [regex]::Matches($t, '(?im)^\s*uses:\s*([^\s@]+\/[^\s@]+)@([^\s]+)\s*$')){
      $uses = $m.Groups[1].Value
      $ver  = $m.Groups[2].Value
      # Allow list by owner/repo (no version here)
      if(-not ($allow -contains $uses) -and -not ($uses -like 'actions/*') -and -not ($uses -like 'github/*')){
        $bad += "$($_.FullName): $uses@$ver"
      }
      # Require version pin: @vN or @<sha>
      if($ver -notmatch '^(v?\d+(\.\d+){0,2}|[0-9a-f]{7,40})$'){
        $unPinned += "$($_.FullName): $uses@$ver"
      }
    }
  }
if($bad.Count){
  Write-Host '[BPOE guard] Non-approved actions detected:' -ForegroundColor Red
  $bad | ForEach-Object { Write-Host " - $_" -ForegroundColor Red }
  exit 2
}
if($unPinned.Count){
  Write-Host '[BPOE guard] Unpinned actions detected (pin to @vN or commit SHA):' -ForegroundColor Red
  $unPinned | ForEach-Object { Write-Host " - $_" -ForegroundColor Red }
  exit 2
}
Write-Host '[BPOE guard] OK - approved and pinned.'
"CoBloat: CU=OK • PU=OK • HU=OK • WT=OK"
