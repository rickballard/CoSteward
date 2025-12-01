[CmdletBinding()]
param(
    [string]$CoStewardPath = (Join-Path $HOME 'Documents\\GitHub\\CoSteward'),
    [string]$CoCachePath   = (Join-Path $HOME 'Documents\\GitHub\\CoCache'),
    [string]$CoCiviumPath  = (Join-Path $HOME 'Documents\\GitHub\\CoCivium'),

    [string]$SessionLabel  = 'CoPrime20251112',
    [string]$MissionId     = 'CoPrime_IntentCloud2025_Mission'
)

$ErrorActionPreference = 'Stop'

function Assert-Ok {
    param(
        [bool]$Condition,
        [string]$Message
    )
    if ($Condition) {
        Write-Host ("PASS  " + $Message) -ForegroundColor Green
    } else {
        Write-Host ("FAIL  " + $Message) -ForegroundColor Red
    }
}

Write-Host "== Verify-CoPrime_IntentCloud2025State ==" -ForegroundColor Yellow
Write-Host ""

# --- CoSteward -----------------------------------------------------------

if (Test-Path $CoStewardPath) {
    Write-Host "-- CoSteward ==" -ForegroundColor Cyan

    git -C $CoStewardPath switch main *> $null
    git -C $CoStewardPath pull  --ff-only *> $null

    $status = git -C $CoStewardPath status --porcelain
    Assert-Ok ([string]::IsNullOrWhiteSpace($status)) "CoSteward main has clean working tree"

    $rawScanRel = 'docs/ops/IntentCloud/IntentCloud_RawIntentScan.md'
    $rawScanAbs = Join-Path $CoStewardPath $rawScanRel
    $rawOk      = Test-Path $rawScanAbs
    Assert-Ok $rawOk "IntentCloud_RawIntentScan present on CoSteward main"

    if ($rawOk) {
        $msg   = git -C $CoStewardPath log -1 --pretty=%s -- $rawScanRel
        $okMsg = ($msg -like '*IntentCloud RawIntentScan*')
        Assert-Ok $okMsg "RawIntentScan last commit message looks right: '$msg'"
    }

    # Optional: check that the CoSync note PR exists (state not enforced).
    if (Get-Command gh -ErrorAction SilentlyContinue) {
        try {
            $prState = gh -R rickballard/CoSteward pr view 154 --json state,title -q '.state'
            $ok = -not [string]::IsNullOrWhiteSpace($prState)
            Assert-Ok $ok "CoSteward PR #154 exists (state: $prState)"
        } catch {
            Write-Host "WARN  Could not query CoSteward PR #154 via gh (ok to ignore)." -ForegroundColor DarkYellow
        }
    }

    Write-Host ""
} else {
    Write-Host "WARN  CoSteward path missing: $CoStewardPath" -ForegroundColor DarkYellow
    Write-Host ""
}

# --- CoCache -------------------------------------------------------------

if (Test-Path $CoCachePath) {
    Write-Host "-- CoCache ==" -ForegroundColor Cyan

    git -C $CoCachePath switch main *> $null
    git -C $CoCachePath pull  --ff-only *> $null

    $status = git -C $CoCachePath status --porcelain
    Assert-Ok ([string]::IsNullOrWhiteSpace($status)) "CoCache main has clean working tree"

    Write-Host ""
} else {
    Write-Host "WARN  CoCache path missing: $CoCachePath" -ForegroundColor DarkYellow
    Write-Host ""
}

# --- CoCivium ------------------------------------------------------------

if (Test-Path $CoCiviumPath) {
    Write-Host "-- CoCivium ==" -ForegroundColor Cyan

    git -C $CoCiviumPath switch main *> $null
    git -C $CoCiviumPath pull  --ff-only *> $null

    $status = git -C $CoCiviumPath status --porcelain

    $untracked = @()
    $modified  = @()

    $status -split "`n" | ForEach-Object {
        $line = $_.Trim()
        if (-not $line) { return }

        if ($line -like '?? *') {
            $untracked += $line.Substring(3)
        } else {
            $modified += $line
        }
    }

    Assert-Ok ($untracked.Count -eq 0) "CoCivium main has no untracked files"

    # Check that drift is still safely parked in WIP branches on origin
    $bpoeBranchRef = git -C $CoCiviumPath ls-remote origin 'refs/heads/wip/CoCivium_bpoe-diagrams_20251114'
    $bpoeOk        = -not [string]::IsNullOrWhiteSpace($bpoeBranchRef)
    Assert-Ok $bpoeOk "Remote branch wip/CoCivium_bpoe-diagrams_20251114 exists (drift parked)"

    $untrackedBranchRef = git -C $CoCiviumPath ls-remote origin 'refs/heads/wip/CoCivium_untracked_20251114'
    $untrackedOk        = -not [string]::IsNullOrWhiteSpace($untrackedBranchRef)
    Assert-Ok $untrackedOk "Remote branch wip/CoCivium_untracked_20251114 exists (earlier untracked WIP)"

    if ($modified.Count -eq 0) {
        Assert-Ok $true "CoCivium main has clean working tree"
    } else {
        Write-Host "WARN  CoCivium main has modified tracked files:" -ForegroundColor DarkYellow
        $modified
    }

    Write-Host ""
} else {
    Write-Host "WARN  CoCivium path missing: $CoCiviumPath" -ForegroundColor DarkYellow
    Write-Host ""
}

# --- CoPong heartbeat ----------------------------------------------------

$CU = 'SOFT'
$PU = 'SOFT'
$HU = 'SOFT'
$WT = 'SOFT'

$line = "████ CoPong: [Verify-CoPrime_IntentCloud2025State] [CU:$CU PU:$PU HU:$HU WT:$WT] [Session:$SessionLabel] [Mission:$MissionId] ████"
Write-Host ""
Write-Host $line
Write-Host ""
