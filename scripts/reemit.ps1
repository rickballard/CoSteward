param([Parameter(Mandatory)][string]$Slug,[int]$RecentShas=5,[int]$Hours=24)
$ErrorActionPreference='Stop'
$root = (Resolve-Path '.').Path
pwsh -NoProfile -File "$root\tools\ReEmit-SetVioletIfHeadChanged.ps1" -Slug $Slug
pwsh -NoProfile -File "$root\tools\Verify-Set.ps1" -Slug $Slug -RecentShas $RecentShas -Hours $Hours
