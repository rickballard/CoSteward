param(
  [string]$RepoPath = "$HOME\Documents\GitHub\CoCivium",
  [string]$SiteRoot = "$HOME\Documents\GitHub\CoCivium\site",
  [string]$Out      = "$HOME\Downloads\Lockdown_Triage",
  [string[]]$Patterns
)
$ErrorActionPreference='Stop'; Set-StrictMode -Version Latest
Write-Host "W3 defaults:" -ForegroundColor Cyan
Write-Host " - RepoPath : $RepoPath"
Write-Host " - SiteRoot : $SiteRoot"
Write-Host " - Out      : $Out"
Write-Host ""
$problems=@()
if(-not (Test-Path $RepoPath)){ $problems += "RepoPath not found: $RepoPath" }
if(-not (Test-Path $SiteRoot)){ $problems += "SiteRoot not found: $SiteRoot" }
if($problems.Count){
  Write-Host "Not running because a critical default path is missing:" -ForegroundColor Yellow
  $problems | ForEach-Object { Write-Host " - $_" -ForegroundColor Yellow }
  $cmd = 'pwsh -File "{0}" -RepoPath "<your repo path>" -SiteRoot "<your site path>" -Out "{1}"' -f (Join-Path $PSScriptRoot 'RUN_W3_v2.ps1'), $Out
  Write-Host "Re-run with your paths (copy/paste this and fill in the <> parts):" -ForegroundColor Yellow
  Write-Host $cmd -ForegroundColor White
  "CoBloat: CU=OK • PU=OK • HU=OK • WT=OK"
  exit 0
}
& "$PSScriptRoot\DO_W3A_Scan_ToCSV.ps1"        -RepoPath $RepoPath -Out $Out
& "$PSScriptRoot\DO_W3B_Quarantine_Plan.ps1"   -RepoPath $RepoPath -Out $Out
& "$PSScriptRoot\DO_W3C_History_Leak_Scan_v2.ps1" -RepoPath $RepoPath -Out $Out -Patterns $Patterns
if(Test-Path "$PSScriptRoot\DO_W3D_Site_NoIndex_Verify_v2.ps1"){
  & "$PSScriptRoot\DO_W3D_Site_NoIndex_Verify_v2.ps1" -SiteRoot $SiteRoot
} else {
  if(Test-Path "$PSScriptRoot\DO_W3D_Site_NoIndex_Verify.ps1"){
    & "$PSScriptRoot\DO_W3D_Site_NoIndex_Verify.ps1" -SiteRoot $SiteRoot
  } else {
    Write-Host "[W3D] verify script missing in repo. Skipping."
  }
}
"OK: W3 suite complete"
"CoBloat: CU=OK • PU=OK • HU=OK • WT=OK"
