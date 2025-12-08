param(
    [switch]$Quiet
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

function Write-Step {
    param([string]$Text)
    if (-not $Quiet) {
        Write-Host " - $Text"
    }
}

Write-Host ""
Write-Host "CoSteward OE Bootstrap (PowerToys + 4VPanel + OpenAI key)" -ForegroundColor Cyan
Write-Host ""

# 1. Check repo location
if (-not (Test-Path $PSScriptRoot)) {
    Write-Host "Warning: PSScriptRoot not found; script context looks odd." -ForegroundColor Yellow
}

# 2. Check for PowerToys installation (simple heuristic)
$powerToysPath = Join-Path $env:LOCALAPPDATA 'Microsoft\PowerToys'
if (Test-Path $powerToysPath) {
    Write-Step "PowerToys appears to be installed at: $powerToysPath"
} else {
    Write-Host "PowerToys does not appear to be installed." -ForegroundColor Yellow
    Write-Host "Install suggestion (run in elevated PowerShell):" -ForegroundColor Yellow
    Write-Host "  winget install --id Microsoft.PowerToys -s winget"
    Write-Host ""
}

# 3. Check OpenAI API key in environment
if ($env:OPENAI_API_KEY) {
    Write-Step "OPENAI_API_KEY is set in the current environment."
} else {
    Write-Host "OPENAI_API_KEY is NOT set." -ForegroundColor Yellow
    Write-Host "If you want a standard CoSteward OE setup, consider:" -ForegroundColor Yellow
    Write-Host "  1) Create a normal API key at https://platform.openai.com/api-keys"
    Write-Host "  2) Set it locally, for example:"
    Write-Host "     [System.Environment]::SetEnvironmentVariable('OPENAI_API_KEY','sk-...','User')"
    Write-Host "  3) Restart PowerShell and PowerToys."
    Write-Host ""
}

# 4. Reminder: PowerToys AI + OpenAI key wiring
Write-Step "In PowerToys, open the AI / OpenAI settings and paste your 'sk-...' key into the API key field."
Write-Step "Choose an appropriate model (for example, gpt-4.1-mini if available)."

# 5. 4VPanel layout reminder
Write-Host ""
Write-Host "4VPanel layout (CoSteward_4VPanel) pattern:" -ForegroundColor Green
Write-Step "Zone 1 (outer left): PS7 panel for Session Group A."
Write-Step "Zone 2 (inner left): Chat session A."
Write-Step "Zone 3 (inner right): Chat session B."
Write-Step "Zone 4 (outer right): PS7 panel for Session Group B."
Write-Host ""
Write-Step "Open PowerToys -> FancyZones -> Launch layout editor."
Write-Step "Select or create a 4-column layout named 'CoSteward_4VPanel'."
Write-Step "Set it as the default layout for your primary monitor."

# 6. FancyZones usage tips
Write-Host ""
Write-Host "FancyZones CoTips:" -ForegroundColor Green
Write-Step "Hold Shift and drag a window by its title bar to show zones."
Write-Step "Drop the window into a zone to snap it there."
Write-Step "Optional: enable the setting 'Override Windows Snap shortcut' so Win+Left/Right moves windows between zones."

# 7. Pointer to the OE doc in this repo
$oeDocRel = 'docs/intent/operations/CoSteward_OE_PowerToys4VPanel_v1.md'
$oeDocFull = Join-Path $PSScriptRoot '..\' $oeDocRel

Write-Host ""
Write-Step "Further details are documented in:"
Write-Host "  $oeDocRel"
if (Test-Path $oeDocFull) {
    Write-Step "Verified that the OE doc file currently exists on disk."
} else {
    Write-Host "Note: OE doc not found at expected path; check repo layout." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "CoSteward OE Bootstrap completed." -ForegroundColor Cyan
Write-Host ""
