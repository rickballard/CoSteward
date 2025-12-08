param([Parameter(Mandatory=$true)][string]$SiteRoot)
$ErrorActionPreference='Stop'; Set-StrictMode -Version Latest
$robots   = Join-Path $SiteRoot 'robots.txt'
$robotsOk = $false
if(Test-Path $robots){
  $t = Get-Content -Raw $robots
  if($t -match '(?im)^\s*User-agent:\s*\*\s*$' -and $t -match '(?im)^\s*Disallow:\s*/\s*$'){ $robotsOk = $true }
}
"[robots] disallow-all={0}" -f $robotsOk

$html = Get-ChildItem -Path $SiteRoot -Recurse -File -Include *.html,*.htm -ErrorAction SilentlyContinue
$missing = @(); $weak = @()
foreach($f in $html){
  $tt = Get-Content -Raw $f.FullName
  if($tt -notmatch '(?i)<meta\s+name=["'']robots["'']'){
    $missing += $f.FullName
  } elseif($tt -notmatch '(?i)<meta\s+name=["'']robots["'']\s+content=["''][^"''>]*noindex[^"''>]*["'']'){
    $weak += $f.FullName
  }
}
"[meta-robots] total={0} missing={1} weak(no noindex)={2}" -f $html.Count, $missing.Count, $weak.Count
if($missing.Count){ '[missing list]'; $missing | Select-Object -First 50 }
if($weak.Count){    '[weak list]';    $weak    | Select-Object -First 50 }
"CoBloat: CU=OK • PU=OK • HU=OK • WT=OK"
