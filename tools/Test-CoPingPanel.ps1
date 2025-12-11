param(
    [string] $RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

function New-CoPingCheck {
    param(
        [Parameter(Mandatory)]
        [string] $Name,
        [Parameter(Mandatory)]
        [bool]   $Ok,
        [string] $Detail
    )
    [pscustomobject]@{
        Name   = $Name
        Ok     = $Ok
        Detail = $Detail
    }
}

function Get-CoPingErrorDetail {
    param(
        [System.Management.Automation.ErrorRecord] $ErrorRecord
    )

    if (-not $ErrorRecord) {
        return 'Unknown error (no ErrorRecord).'
    }

    $msg = $ErrorRecord.Exception.Message
    if ([string]::IsNullOrWhiteSpace($msg)) {
        $msg = $ErrorRecord.ToString()
    }

    # Be very defensive here: only use TargetObject if present and safe.
    $targetInfo = $null
    try {
        if ($ErrorRecord.CategoryInfo -and $ErrorRecord.CategoryInfo.TargetName) {
            $targetInfo = " Target: $($ErrorRecord.CategoryInfo.TargetName)"
        }
    } catch {
        $targetInfo = ''
    }

    return "$msg$targetInfo"
}

$checks = New-Object System.Collections.Generic.List[object]
$hadError = $false

# --- Check 1: CoModules core files exist ---
$expectedFiles = @(
    'tools/Test-CoPingPanel.ps1',
    'tools/CoBlock_Snapshot_LocalContext.ps1',
    'schemas/EdgeControl.json',
    'docs/internal/CoModulesStatus.md',
    'docs/specs/CoPing_HealthSignals.md'
)

foreach ($relPath in $expectedFiles) {
    $fullPath = Join-Path $RepoRoot $relPath
    $exists = Test-Path $fullPath
    $checks.Add(
        (New-CoPingCheck -Name "Path: $relPath" -Ok:$exists -Detail:(
            if ($exists) { "Found at $fullPath" } else { "Missing: expected at $fullPath" }
        ))
    )
    if (-not $exists) { $hadError = $true }
}

# --- Check 2: EdgeControl.json parses as JSON ---
$edgeControlPath = Join-Path $RepoRoot 'schemas/EdgeControl.json'
if (Test-Path $edgeControlPath) {
    try {
        $json = Get-Content $edgeControlPath -Raw -ErrorAction Stop | ConvertFrom-Json -ErrorAction Stop
        $checks.Add(
            (New-CoPingCheck -Name 'EdgeControl.json: parse' -Ok:$true -Detail:'Valid JSON.')
        )

        # Optional: minimal expected shape (very light-touch to avoid false negatives)
        if (-not $json.mode) {
            $checks.Add(
                (New-CoPingCheck -Name 'EdgeControl.json: mode' -Ok:$false -Detail:'Property "mode" is missing; consider adding a default.')
            )
            $hadError = $true
        } else {
            $checks.Add(
                (New-CoPingCheck -Name 'EdgeControl.json: mode' -Ok:$true -Detail:"mode = $($json.mode)")
            )
        }
    }
    catch {
        $hadError = $true
        $detail = Get-CoPingErrorDetail -ErrorRecord $_
        $checks.Add(
            (New-CoPingCheck -Name 'EdgeControl.json: parse' -Ok:$false -Detail:$detail)
        )
    }
}
else {
    $checks.Add(
        (New-CoPingCheck -Name 'EdgeControl.json: parse' -Ok:$false -Detail:'File not found, cannot parse.')
    )
    $hadError = $true
}

# --- Output summary table ---
$checks | Sort-Object Name | Format-Table -AutoSize

if ($hadError) {
    Write-Host ''
    Write-Host 'CoPing panel validator: FAIL (one or more checks failed).' -ForegroundColor Red
    exit 1
}
else {
    Write-Host ''
    Write-Host 'CoPing panel validator: OK (all checks passed).' -ForegroundColor Green
    exit 0
}