param([Parameter(Mandatory=$true)][string]$RepoPath,[string]$Out="$HOME\Downloads\Lockdown_Triage")
$ErrorActionPreference='Stop'; Set-StrictMode -Version Latest
function UTS { (Get-Date).ToUniversalTime().ToString('yyyyMMddTHHmmssZ') }
$ts = UTS
$patterns = @('GLUKEY','business plan','valuation','confidential','secret','crown','CoGbx','CoIndex')

if(-not (Test-Path (Join-Path $RepoPath ".git"))){ throw "Not a git repo: $RepoPath" }

$outDir = Join-Path $Out $ts; New-Item -ItemType Directory -Force -Path $outDir *> $null

function Invoke-NativeCapture {
  param([string]$Exe,[string[]]$Args)
  $tmp = [IO.Path]::GetTempFileName()
  $p = Start-Process -FilePath $Exe -ArgumentList $Args -NoNewWindow -RedirectStandardOutput $tmp -PassThru
  $p.WaitForExit()
  $out = Get-Content -Raw $tmp
  Remove-Item $tmp -Force
  return $out
}

$commits = Invoke-NativeCapture -Exe 'git' -Args @('-C', $RepoPath, 'rev-list', '--all') -split '\r?\n' | Where-Object { $_ }

foreach($p in $patterns){
  $safe = ($p -replace '[^A-Za-z0-9]+','_')
  $outfile = Join-Path $outDir ("history_hits_{0}.txt" -f $safe)
  $args = @('-C', $RepoPath, '--no-pager', 'grep','-n','-i','-F','--break','--heading','--line-number','-e',"$p") + $commits
  $res  = Invoke-NativeCapture -Exe 'git' -Args $args
  $res | Set-Content -Path $outfile -Encoding UTF8
  "{0} -> {1}" -f $p, $outfile
}
"OK: history scan -> $outDir"
