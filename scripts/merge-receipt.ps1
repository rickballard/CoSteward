param([Parameter(Mandatory)] [int]$PR, [Parameter(Mandatory)] [string]$Action, [string]$Note='')
$ErrorActionPreference='Stop'
$repo='rickballard/CoSteward'
gh -R $repo pr merge $PR --squash --delete-branch --admin
git pull --ff-only
pwsh -NoProfile -File tools/New-Receipt.ps1 -Repo 'CoSteward' -Area 'ops' -Action $Action -PR $PR -Note $Note
pwsh -NoProfile -File .\scripts\reemit.ps1 -Slug 'ops-gibindex-multicycle-v1'
pwsh -NoProfile -File .\tools\New-CoSyncNote.ps1 -RepoSlug $repo -Tail 12
