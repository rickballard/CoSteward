[CmdletBinding()]
param(
[string]$MissionId = 'CoPrime_IntentCloud2025_Mission',
[string]$SessionTag = 'CoPrime_bootstrap'
)

$ErrorActionPreference = 'Stop'

$repoRoot = Join-Path $HOME 'Documents\GitHub\CoSteward'
if (-not (Test-Path $repoRoot)) {
throw "CoSteward repo not found at: $repoRoot"
}

$megaWaveDoc = 'docs/ops/MegaWave/CoSuite_BPOE_MegaWavePattern_v1.md'
$reposDoc = 'docs/ops/MegaWave/CoSuite_CurrentRepos_v1.md'
$aiEntryDoc = 'docs/ops/MegaWave/CoSuite_BPOE_AIEntry_v1.md'
$anchorDoc = 'docs/ops/MegaWave/CoSuite_CoAnchorPattern_v1.md'

Write-Host "==== CoSuite Bootstrap Prompt ($SessionTag) ====" -ForegroundColor Yellow
Write-Host ""
Write-Host "Mission Id : $MissionId"
Write-Host "MegaWave BPOE doc : $megaWaveDoc"
Write-Host "Current repos doc : $reposDoc"
Write-Host "AI-entry doc : $aiEntryDoc"
Write-Host "CoAnchor doc : $anchorDoc"
Write-Host ""
Write-Host "Paste the following into a new session, then say 'CoSync':" -ForegroundColor Cyan
Write-Host ""

$snippet = @"
CoSync.

You are engaging with the CoSuite as a CoPrime/CoArena-style session.

Treat the following as your BPOE surface:

CoSteward/$megaWaveDoc

CoSteward/$reposDoc

CoSteward/$aiEntryDoc

CoSteward/$anchorDoc

Default to MegaWave cycles for non-trivial missions.
Repos are source of truth; Run-code / sandbox is helper-only.

Mission Id : $MissionId
SessionTag : $SessionTag
"@

Write-Host $snippet
