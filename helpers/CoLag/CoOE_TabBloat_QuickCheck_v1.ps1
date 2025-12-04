# CoOE_TabBloat_QuickCheck_v1.ps1
# Minimal OE snapshot for browser tab bloat
param()

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

function UTS { (Get-Date).ToUniversalTime().ToString('yyyyMMddTHHmmssZ') }

$ts   = UTS
$root = Join-Path $HOME 'Desktop\CoOE'
New-Item -ItemType Directory -Path $root -Force | Out-Null
$log  = Join-Path $root "CoOE_TabBloat_QuickCheck_$ts.txt"

"[{0}] CoOE TabBloat QuickCheck starting" -f (UTS) | Tee-Object -FilePath $log

$os = Get-CimInstance Win32_OperatingSystem
$totalGB = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2)
$freeGB  = [math]::Round($os.FreePhysicalMemory      / 1MB, 2)
$usedGB  = [math]::Round($totalGB - $freeGB, 2)
$usedPct = [math]::Round(($usedGB / $totalGB) * 100, 1)

"RAM: Total={0}GB Used={1}GB ({2}%) Free={3}GB" -f $totalGB, $usedGB, $usedPct, $freeGB |
  Tee-Object -FilePath $log -Append

$browserNames = @('chrome','msedge','brave','firefox')
$browserProcs = Get-Process -ErrorAction SilentlyContinue |
  Where-Object { $browserNames -contains $_.ProcessName }

if (-not $browserProcs) {
  "No browser processes found." | Tee-Object -FilePath $log -Append
  $result = [pscustomobject]@{
    BrowserRAMMB = 0
    BrowserCount = 0
  }
}
else {
  $browserRAM = [math]::Round(( ($browserProcs | Measure-Object WorkingSet64 -Sum).Sum / 1MB ), 1)
  "BrowserRAM: {0}MB across {1} browser processes" -f $browserRAM, $browserProcs.Count |
    Tee-Object -FilePath $log -Append

  "Top 5 browser workers by WorkingSetMB:" | Tee-Object -FilePath $log -Append

  $top = $browserProcs |
    Sort-Object WorkingSet64 -Descending |
    Select-Object -First 5 @{
      n='Name';e={$_.ProcessName}
    }, Id, @{
      n='WS_MB';e={[math]::Round($_.WorkingSet64/1MB,1)}
    }

  $top | Format-Table -AutoSize | Out-String |
    Tee-Object -FilePath $log -Append

  $result = [pscustomobject]@{
    BrowserRAMMB = $browserRAM
    BrowserCount = $browserProcs.Count
  }
}

"[{0}] CoOE TabBloat QuickCheck finished. Log: {1}" -f (UTS), $log |
  Tee-Object -FilePath $log -Append

Write-Host "CoOE TabBloat QuickCheck complete. Log:" -ForegroundColor Green
Write-Host "  $log" -ForegroundColor Yellow

# Return basic metrics for callers
return $result
