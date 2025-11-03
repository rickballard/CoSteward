param()
$ErrorActionPreference='Stop'
$index = Join-Path $HOME 'Documents\GitHub\CoCache\docs\index\ASSETS_INDEX.json'
if(Test-Path $index){
  $j = Get-Content -Raw $index | ConvertFrom-Json
  $p = $j.meta.canonical.violet_writer
  if($p -and (Test-Path $p)){ $p; return }
}
$guess = Join-Path $HOME 'Documents\GitHub\CoCache\tools\Violet\Write-Violet.ps1'
if(Test-Path $guess){ $guess; return }

$cc = Join-Path $HOME 'Documents\GitHub\CoCache'
if(Test-Path $cc){
  Push-Location $cc
  try {
    $hit = (git ls-files 'tools/Violet/Write-Violet.ps1' 2>$null | Select-Object -First 1)
    if($hit){ (Join-Path $cc $hit); return }
  } finally { Pop-Location }
}
throw "Canonical Write-Violet.ps1 not found. Ensure CoCache clone and index exist."
