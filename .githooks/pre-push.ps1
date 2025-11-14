param([switch]$VerboseMode)
$ErrorActionPreference='Stop'
function Write-Status($level,$msg){
  $c = @{ 'OK'='Green'; 'SOFT'='Yellow'; 'HARD'='Red'; 'FATAL'='Red' }[$level]
  if(-not $c){ $c='Gray' }
  Write-Host ("[{0}] {1}" -f $level,$msg) -ForegroundColor $c
}
Write-Status 'SOFT'  'CU compute usage: elevated'
Write-Status 'HARD'  'PU process usage: MW cycles ~60m; enforce rails'
Write-Status 'SOFT'  'HU human load: spikes'
Write-Status 'SOFT'  'WT waits: nominal'
git --version *> $null; gh --version  *> $null
Write-Host "Env OK — git/gh present."
$repos = @('rickballard/CoCache','rickballard/CoSteward')
foreach($r in $repos){ "`n== $r =="; gh pr list --repo $r --state open --limit 5 --json number,title,url }
if($VerboseMode){ Write-Host "`nTip: hook into .githooks/pre-push.ps1 & PR comment workflow." }
