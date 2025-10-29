# PS7 Profile (CoSuite)

Use **`pwsh -NoProfile`** for automation/paste-heavy work.

## Install the interactive profile
```powershell
$src = Join-Path $PSScriptRoot "..\..\profiles\CoSuite.Profile.ps1"
Copy-Item $src -Destination $PROFILE.CurrentUserAllHosts -Force
Write-Host "Installed → $PROFILE.CurrentUserAllHosts"
```

## Why two modes?
- **Interactive (profile on):** nicer editing, history prediction.
- **Automation (NoProfile):** stable, avoids PSReadLine paste quirks.

## Safe-Proc
- `tools/Safe-Proc.ps1` wraps `git/gh/pwsh` with timeouts & clean output.
