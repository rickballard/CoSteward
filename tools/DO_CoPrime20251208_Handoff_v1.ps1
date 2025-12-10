# ♦ DO CoPrime20251208_Handoff_v1_UTS
# CoTense: CoDoing

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

function UTS {
    (Get-Date).ToUniversalTime().ToString('yyyyMMddTHHmmssZ')
}

$repoPath = "$HOME\Documents\GitHub\CoSteward"
if (-not (Test-Path $repoPath)) {
    throw "RepoPath not found: $repoPath"
}

Set-Location $repoPath

$today    = Get-Date -Format 'yyyyMMdd'
$uts      = UTS

$notesDir = Join-Path $repoPath "docs/intent/advice/notes/$today"
$cobusDir = Join-Path $repoPath 'docs/intent/cobus'
$mirrorDir = Join-Path $repoPath 'docs/session-offload/mined-deleted/mirror'

@($notesDir, $cobusDir) | ForEach-Object {
    if (-not (Test-Path $_)) {
        New-Item -ItemType Directory -Path $_ -Force | Out-Null
    }
}

$handoffNotePath = Join-Path $notesDir ("CoPrime20251208_Handoff_Summary_v1_{0}.md" -f $uts)
$cobusNoticePath = Join-Path $cobusDir ("CoBus_Notice_CoPrime20251208_SessionHandoff_v1_{0}.md" -f $uts)

# Try to run CoRetro_MineDeleted if the DO tool exists
$mineTool = Join-Path $repoPath 'tools/DO_CoRetro_MineDeleted_v1.ps1'
$mineResult = 'not-run'
if (Test-Path $mineTool) {
    try {
        & $mineTool
        $mineResult = 'ran-ok'
    }
    catch {
        $mineResult = "error: $($_.Exception.Message)"
    }
} else {
    $mineResult = 'tool-missing'
}

# Paths we expect to be relevant for CoPrime handoff
$handoffSources = @()

# CoTense and session templates
$CoTenseSpec   = Join-Path $repoPath 'docs/bpoe/CoTense_Spec_v1.md'
$SessHeaderTpl = Join-Path $repoPath 'docs/bpoe/CoSession_Header_Template_v1.md'
$SessFooterTpl = Join-Path $repoPath 'docs/bpoe/CoSession_Footer_Template_v1.md'

$CoRetroBpoe   = Join-Path $repoPath 'docs/bpoe/CoRetro_BPOE_v1.md'
$CoRetroRoot   = Join-Path $repoPath 'docs/insights/CoRetro'

# Add files only if they exist, to avoid hard failures
foreach ($p in @(
    $CoTenseSpec,
    $SessHeaderTpl,
    $SessFooterTpl,
    $CoRetroBpoe
)) {
    if (Test-Path $p) {
        $handoffSources += $p
    }
}

if (Test-Path $CoRetroRoot) {
    $handoffSources += $CoRetroRoot
}

if (Test-Path $mirrorDir) {
    $handoffSources += $mirrorDir
}

# Also include the handoff note and cobus notice once written
# (we will add them after creating content)

# Write handoff summary note
$handoffContent = @"
# CoPrime20251208 Handoff Summary v1

Repo: CoSteward
Generated: $uts
Session: prior Co1 (this session) handing off to CoPrime20251208

## What this session already set up

- CoTense spec and session header / footer templates in multiple repos.
- CoRetro BPOE and CoRetro insights triplet (theory, practice, CoMetaTrain seed).
- CoRetro_MineDeleted tool and mining pass over deleted CoGibber and reload assets.
- Initial CoBus notices to route attention to Thursday prep and handoffs.
- Early CoTabBoot guidance and CoSession header ideas.

## CoRetro_MineDeleted status

- DO_CoRetro_MineDeleted_v1.ps1 run result: $mineResult
- Public mirror (near repo) expected at:
  - docs/session-offload/mined-deleted/mirror
- Secret HP57 stash (off repo) expected at:
  - C:\CoCiviumAdmin\HP57\MinedDeleted_CoSteward

CoPrime20251208 should treat anything in HP57 paths as crown jewel or GLUKEY-adjacent
and avoid re-adding such material to public repos.

## Handoff pack contents (expected)

Included in the CoPrime handoff megazip:

- CoTense_Spec_v1.md
- CoSession_Header_Template_v1.md
- CoSession_Footer_Template_v1.md
- CoRetro_BPOE_v1.md
- CoRetro insights:
  - CoRetro_Theory_v1.md
  - CoRetro_Practice_v1.md
  - CoMetaTrain_CoRetro_Seed_v1.md
- Mined deleted mirror folder:
  - docs/session-offload/mined-deleted/mirror
- This handoff summary file
- The CoBus notice file for CoPrime20251208

## Guidance to CoPrime20251208

Suggested next steps:

1. Pull latest CoSteward main and any active feature branches relevant to BPOE and CoRetro.
2. Inspect the handoff megazip and its sha256 sidecar in the Downloads folder.
3. Promote stable wisdom into:
   - docs/bpoe for general BPOE standards.
   - docs/CoGibber for public CoGibber specifications.
   - docs/intent/reload or successor tools if reload remains in scope.
   - tools and quickstarts for CoAnchor, CoPopupGuard, NotesAutoBranch successors.
4. For HP57 material:
   - Review offline from C:\CoCiviumAdmin\HP57\MinedDeleted_CoSteward.
   - Summarise any GLUKEY-adjacent insights in private CoPrime notes.
   - Do not commit HP57 specifics back to public repos.
5. Improve future handoffs by:
   - Having a standard CoHandoff DO tool per repo that:
     - Mines deleted content.
     - Builds a handoff pack megazip.
     - Writes a CoBus notice plus advice/notes for the next Co1.
   - Bundling these DO tools into a small public helper product
     that ships alongside RepoZipper and friends.

## CoTense for this handoff

- CoStub  - previous scattered handoff ideas.
- CoDoing - this handoff script and pack creation run.
- CoDone  - once the megazip and sha256 exist in Downloads.
- CoDoneVerified - once CoPrime20251208:
  - Confirms the zip and hash.
  - Integrates selected content.
  - Marks this handoff as ingested in its own notes.

"@

$handoffContent | Set-Content -Encoding UTF8 $handoffNotePath

# Now that the note exists, include it in the sources for the zip
$handoffSources += $handoffNotePath

# Write CoBus notice for CoPrime
$cobusContent = @"
# CoBus Notice – CoPrime20251208 Session Handoff v1

From: prior Co1 session (this CoSteward session)
To:   CoPrime20251208

A CoPrime handoff pack has been prepared.

## Key artifacts

- Handoff summary:
  - $handoffNotePath

- Handoff megazip:
  - See Downloads folder on rick's desktop for CoPrime20251208_HandoffPack_v1_*.zip
  - A matching .sha256 sidecar file should be present.

## Action for CoPrime20251208

- Ingest the handoff summary into CoPrime notes.
- Use the megazip to explore:
  - CoTense spec and session templates.
  - CoRetro BPOE and insights.
  - Mined deleted mirror content.
- Review HP57 stash offline and keep GLUKEY-adjacent details off public repos.
- Mark this handoff as CoDoneVerified once integrated.

"@

$cobusContent | Set-Content -Encoding UTF8 $cobusNoticePath

# Include cobus notice in the zip as well
$handoffSources += $cobusNoticePath

# Build a single megazip in Downloads
$downloads = Join-Path $HOME 'Downloads'
if (-not (Test-Path $downloads)) {
    New-Item -ItemType Directory -Path $downloads -Force | Out-Null
}

$zipName = "CoPrime20251208_HandoffPack_v1_{0}.zip" -f $uts
$zipPath = Join-Path $downloads $zipName

if (Test-Path $zipPath) {
    Remove-Item $zipPath -Force
}

Compress-Archive -Path $handoffSources -DestinationPath $zipPath -Force

# Compute sha256 sidecar
$hash = Get-FileHash -Path $zipPath -Algorithm SHA256
$shaPath = "$zipPath.sha256"
$hashLine = "{0}  {1}" -f $hash.Hash, $zipName
$hashLine | Set-Content -Encoding ASCII $shaPath

# Final console output
Write-Host "CoPrime20251208 handoff pack created." 
Write-Host "  Zip:      $zipPath"
Write-Host "  SHA256:   $shaPath"
Write-Host ""
Write-Host "Next steps:"
Write-Host "  - Drag the zip into the CoPrime20251208 session."
Write-Host "  - Optionally paste the CoBus notice content there for context."
Write-Host ""
Write-Host "CoTense: CoDone (handoff pack built). CoDoneVerified once CoPrime ingests."
