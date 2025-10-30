param([ValidateSet("Install","Restore")][string]$Mode="Install")
$ErrorActionPreference="Stop"
$repo = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$src  = Join-Path $repo "profiles\CoSuite.Profile.ps1"
$dst  = $PROFILE.CurrentUserAllHosts
$bak  = "$dst.bak_{0}" -f ([DateTimeOffset]::UtcNow.ToString("yyyyMMdd_HHmmssZ"))
if($Mode -eq "Install"){
  if(-not (Test-Path $src)){ throw "Repo profile missing: $src" }
  if(Test-Path $dst){ Copy-Item $dst $bak -Force; Write-Host "Backed up → $bak" }
  Copy-Item $src $dst -Force; Write-Host "Installed CoSuite profile → $dst"
} else {
  $dir = Split-Path $dst
  $latest = Get-ChildItem $dir -Filter "$(Split-Path $dst -Leaf).bak_*" -File -EA SilentlyContinue | Sort-Object LastWriteTimeUtc -Descending | Select-Object -First 1
  if($latest){ Copy-Item $latest.FullName $dst -Force; Write-Host "Restored from → $($latest.FullName)" }
  else{ if(Test-Path $dst){ Remove-Item $dst -Force; Write-Host "Removed profile (no backup found)" } else { Write-Host "Nothing to restore" } }
}
