param([string]$LogPath = 'docs/ops/status/STATUS.log.jsonl', [int]$DriftWindow=3)
Set-StrictMode -Version Latest
$ErrorActionPreference='Stop'

if(-not (Test-Path $LogPath)){ Write-Error "Status JSONL not found: $LogPath" }

# Read last 50 records
$lines = Get-Content $LogPath -ErrorAction Stop | Select-Object -Last 50
if(-not $lines){ Write-Error "Status JSONL empty" }

# Parse
$recs = foreach($l in $lines){ try{ $l | ConvertFrom-Json -ErrorAction Stop } catch{ $null } } | Where-Object {$_}
if(-not $recs){ Write-Error "No valid JSON objects in $LogPath" }

# Require latest record freshness vs HEAD files touching docs/ or policy/ or tools/
$headTime = git log -1 --pretty=%cI -- docs/ policy/ tools/ 2>$null
if(-not $headTime){ $headTime = git log -1 --pretty=%cI }
$latest = $recs | Select-Object -Last 1
if([DateTimeOffset]::Parse($latest.ts) -lt [DateTimeOffset]::Parse($headTime)){
  Write-Error "Latest status ts ($([$latest.ts])) older than HEAD ($headTime)"
}

# Gate requires hint
if($latest.gate -ne 'none' -and ([string]::IsNullOrWhiteSpace($latest.hint))){
  Write-Error "Gate '$([$latest.gate])' set but 'hint' is empty"
}

# Drift monotone-increase for last N
$tail = $recs | Select-Object -Last $DriftWindow
if($tail.Count -ge $DriftWindow){
  $mags = $tail | ForEach-Object {[math]::Abs([int]$_.drift_pct)}
  $inc = $true
  for($i=1; $i -lt $mags.Count; $i++){
    if($mags[$i] -lt $mags[$i-1]){ $inc=$false; break }
  }
  if($inc -and ($mags | Select-Object -Unique).Count -gt 1){
    Write-Error "Drift magnitude increased across last $DriftWindow entries: $([string]::Join(',',$mags))"
  }
}

Write-Host "status-lint: OK — ts=$([$latest.ts]) gate=$([$latest.gate]) drift=$([$latest.drift_pct])" -ForegroundColor Green
