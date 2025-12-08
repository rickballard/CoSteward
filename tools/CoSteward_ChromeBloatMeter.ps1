param(
    [int]$WarnPercent = 60,
    [int]$HardPercent = 75
)

$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

function Get-PhysicalMemoryBytes {
    $cs = Get-CimInstance Win32_ComputerSystem
    return [int64]$cs.TotalPhysicalMemory
}

$ramTotal = Get-PhysicalMemoryBytes
if (-not $ramTotal -or $ramTotal -le 0) {
    throw "Unable to read total physical memory."
}

$targets = @("chrome","msedge")
$procs = @()

foreach ($name in $targets) {
    $p = Get-Process -Name $name -ErrorAction SilentlyContinue
    if ($p) { $procs += $p }
}

if (-not $procs) {
    Write-Host "[CoBloat] No Chrome / Edge processes detected."
    return
}

$sumWS = ($procs | Measure-Object -Property WorkingSet64 -Sum).Sum
$percent = [math]::Round(($sumWS / $ramTotal) * 100, 1)

$tier = "OK"
if ($percent -ge $HardPercent) {
    $tier = "HARD"
} elseif ($percent -ge $WarnPercent) {
    $tier = "SOFT"
}

Write-Host ("[CoBloat] Browser RAM use: {0:N1}% of physical (tier={1})" -f $percent,$tier)

# Optional: show top 5 browser processes by working set
$top = $procs | Sort-Object -Property WorkingSet64 -Descending | Select-Object -First 5
Write-Host ""
Write-Host "Top browser processes by WorkingSet:"
foreach ($p in $top) {
    $mb = [math]::Round($p.WorkingSet64 / 1MB, 1)
    Write-Host ("  {0,-10} PID={1,-6} WS={2,6} MB" -f $p.ProcessName,$p.Id,$mb)
}

if ($tier -eq "SOFT") {
    Write-Host ""
    Write-Host "Hint: SOFT tier – consider a cache flush / browser restart when convenient."
} elseif ($tier -eq "HARD") {
    Write-Host ""
    Write-Host "Hint: HARD tier – lag is likely. Strongly consider a browser restart."
}
