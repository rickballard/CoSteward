param(
  [string]$RepoPath = 'C:\Users\Chris\Documents\GitHub\CoSteward',
  [string]$Policy   = 'C:\Users\Chris\Documents\GitHub\CoSteward\docs\ops\COSYNC_POLICY.json',
  [string]$CoSync   = 'C:\Users\Chris\CoPolitic\scripts\CoSync.ps1'
)
$ErrorActionPreference='SilentlyContinue'
try{
  git -C $RepoPath pull --ff-only | Out-Null
  if(!(Test-Path $Policy)){ return }
  $p = Get-Content $Policy -Raw | ConvertFrom-Json
  if(-not $p.enabled){ return }
  if(-not $p.runIfOnBattery){
    try{
      # Skip if on battery (best-effort)
      $onDC = (Get-CimInstance -Class Win32_Battery -ErrorAction SilentlyContinue | Where-Object { $_.BatteryStatus -eq 2 }).Count -gt 0
      if(-not $onDC){ return }
    }catch{}
  }
  if(Test-Path $CoSync){
    & $CoSync -Mode auto -ErrorAction SilentlyContinue | Out-Null
  }
}catch{}
