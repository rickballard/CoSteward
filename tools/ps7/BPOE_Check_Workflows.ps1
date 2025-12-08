param([string]$Root = "$PSScriptRoot\..\..")
$ErrorActionPreference="Stop"; Set-StrictMode -Version Latest
$allow = Get-Content -Path (Join-Path $PSScriptRoot "..\..\ .github\bpoe\allowed_actions.txt") | Where-Object { $_ -and -not $_.StartsWith("#") } | ForEach-Object { $_.Trim() }

$bad = @()
Get-ChildItem -Path (Join-Path $Root ".github\workflows") -File -Recurse -Include *.yml,*.yaml -ErrorAction SilentlyContinue |
  ForEach-Object {
    $t = Get-Content -Raw $_.FullName
    foreach($m in [regex]::Matches($t, "(?im)^\s*uses:\s*([^\s@]+\/[^\s@]+)@([^\s]+)\s*$")){
      $uses = $m.Groups[1].Value
      if(-not ($allow -contains $uses) -and -not ($uses -like "actions/*") -and -not ($uses -like "github/*")){
        $bad += "$($_.FullName): $uses"
      }
    }
  }

if($bad.Count){
  Write-Host "[BPOE guard] Non-approved actions detected:" -ForegroundColor Red
  $bad | ForEach-Object { Write-Host " - $_" -ForegroundColor Red }
  exit 2
} else {
  Write-Host "[BPOE guard] OK - workflows use only approved actions."
}
