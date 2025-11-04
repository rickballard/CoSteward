param([Parameter(Mandatory)][string]$Message)
$ErrorActionPreference='Stop'
$root = (git -C $PSScriptRoot rev-parse --show-toplevel)
& "$PSScriptRoot\Write-Violet.ps1" -Message $Message -RepoRoot $root
