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
if(-not $paths){ "[W3A] no files found after ignores"; return }
$outDir = Join-Path $Out $ts; New-Item -ItemType Directory -Force -Path $outDir *> $null
$csv = Join-Path $outDir "scan_hits.csv"; $rows = @()
foreach($rx in $patterns){
  $hits = Select-String -Path $paths -Pattern $rx -AllMatches -ErrorAction SilentlyContinue
  foreach($h in $hits){
    $rows += [pscustomobject]@{ Pattern=$rx; File=$h.Path; Line=$h.LineNumber; Snippet=($h.Line.Trim() -replace '\s+',' ') }
  }
  "{0}: {1}" -f $rx, (($hits | Measure-Object).Count)
}
if($rows.Count){ $rows | Export-Csv -Path $csv -NoTypeInformation -Encoding UTF8; "OK: CSV -> $csv" } else { "OK: no hits" }
