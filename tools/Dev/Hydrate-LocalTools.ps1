param(
  [Parameter(Mandatory)][string]$Branch,
  [Parameter(Mandatory)][string]$RepoRelPath,
  [Parameter(Mandatory)][string]$OutPath
)
$ErrorActionPreference='Stop'
git fetch origin *> $null
$spec = 'origin/' + $Branch + ':' + $RepoRelPath
$content = git show $spec 2>$null
if(-not $content){ throw "Not found on branch: $Branch path: $RepoRelPath" }
$dir = Split-Path -Parent $OutPath
if(-not (Test-Path $dir)){ New-Item -ItemType Directory -Force $dir | Out-Null }
[IO.File]::WriteAllText($OutPath,$content,[Text.UTF8Encoding]::new($false))
Unblock-File -LiteralPath $OutPath
Write-Host "[ready] $OutPath"
