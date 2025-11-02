param([string]$Label='■[Receipt]')
$ErrorActionPreference='Stop'
$logPath = Resolve-Path (Join-Path $PSScriptRoot '..\STATUS\violets.log') -EA SilentlyContinue
if(-not $logPath){ return }
# Read a tail window; choose the last explicit [violet] line
$window = Get-Content -Tail 200 -Encoding UTF8 $logPath
$vio = $window | Where-Object { $_ -match '^\[violet\]\s+' } | Select-Object -Last 1
if([string]::IsNullOrWhiteSpace($vio)){
  # fallback: last non-box, non-empty line
  $vio = ($window | Where-Object { $_ -and ($_ -notmatch '^■+$') }) | Select-Object -Last 1
}
if($vio -match '^\[violet\]\s*(.+)$'){
  "$Label $($matches[1])"
}else{
  "$Label $vio"
}
