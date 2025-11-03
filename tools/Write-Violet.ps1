param(
  [Parameter(Mandatory)][string]$Message,
  [string]$RepoRoot = (git rev-parse --show-toplevel)
)
$ErrorActionPreference='Stop'
if(-not $RepoRoot){ throw "RepoRoot not resolved; run inside a repo." }

$finder = Join-Path $PSScriptRoot 'Find-CanonicalViolet.ps1'
if(!(Test-Path $finder)){ throw "Missing tools/Find-CanonicalViolet.ps1" }

try {
  $canon = & $finder
  & $canon -Message $Message -RepoRoot $RepoRoot
} catch {
  $vio = Join-Path $RepoRoot 'advice/STATUS/violets.log'
  New-Item -ItemType Directory -Force (Split-Path $vio) | Out-Null
  "[violet] $(Get-Date -AsUTC) :: $Message" | Add-Content -Encoding utf8NoBOM $vio
  Write-Warning "Canonical violet writer not found; wrote locally to $vio"
}
