param([Parameter(Mandatory=$true)][string]$RepoPath,[string]$Out="$HOME\Downloads\Lockdown_Triage")
$ErrorActionPreference='Stop'; Set-StrictMode -Version Latest
function UTS { (Get-Date).ToUniversalTime().ToString('yyyyMMddTHHmmssZ') }
$ts = UTS
$patterns   = @('(?i)\bGLUKEY\b','(?i)\bbusiness\s+plan\b','(?i)\bvaluation\b','(?i)\bconfidential\b','(?i)\bsecrets?\b','(?i)\bcrown\b','(?i)\bCoGbx\b','(?i)\bCoIndex\b')
$ignoreDirs = @('\.git($|\\)','node_modules($|\\)','\.venv($|\\)','dist($|\\)','build($|\\)','out($|\\)','\.cache($|\\)')
$files = Get-ChildItem -Path (Join-Path $RepoPath '*') -Recurse -File -ErrorAction SilentlyContinue | Where-Object {
  $p=$_.FullName; -not ( ($ignoreDirs | Where-Object { $p -match $_ } | Select-Object -First 1) )
}
$paths = @($files | Select-Object -Expand FullName -ErrorAction SilentlyContinue)
if(-not $paths){ "[W3B] no files found after ignores"; return }
$hitsMap = @{}
foreach($rx in $patterns){
  $hits = Select-String -Path $paths -Pattern $rx -AllMatches -ErrorAction SilentlyContinue
  foreach($h in $hits){
    $k = $h.Path; if(-not $hitsMap.ContainsKey($k)){ $hitsMap[$k]=@() }
    $hitsMap[$k] += @{ pattern=$rx; line=$h.LineNumber; snippet=($h.Line.Trim() -replace '\s+',' ') }
  }
}
$outDir = Join-Path $Out $ts; New-Item -ItemType Directory -Force -Path $outDir *> $null
$manifestPath = Join-Path $outDir "quarantine_manifest.json"
($hitsMap.Keys | ForEach-Object {
  [pscustomobject]@{ path=$_; suggestions=@('copy to server-only vault','replace with sanitized stub','add CODEOWNERS gate','consider git history scrub'); hits=$hitsMap[$_] }
}) | ConvertTo-Json -Depth 8 | Set-Content -Path $manifestPath -Encoding UTF8
"OK: plan -> $manifestPath"
