param()
$ErrorActionPreference='Stop'
$Root = Split-Path -Parent $PSCommandPath | Split-Path -Parent
$CoTips = Join-Path $Root 'docs/ops/MANUAL/CoTips.md'
$raw = Get-Content -Raw $CoTips
$checks = @(
  @{id='#cotips-here-strings';    name='here-strings/backticks'},
  @{id='#cotips-megazip';         name='megazip BPOE'},
  @{id='#cotips-downloadables';   name='downloadables policy'},
  @{id='#cotips-branch-gh';       name='branch & gh context'},
  @{id='#cotips-labels-eol';      name='labels & EOL'}
)
foreach($c in $checks){
  if($raw -match [regex]::Escape($c.id)){ Write-Host ("[OK] {0}" -f $c.name) -ForegroundColor Green }
  else { Write-Host ("[NO] {0}" -f $c.name) -ForegroundColor Yellow; $global:Fail=$true }
}
if($global:Fail){ exit 2 }
