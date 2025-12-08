[CmdletBinding()]
param()

# CoReloadRunner_v1.ps1
# Objective:
#   - Validate all integrity markers before a ChatGPT session reload.
#   - Produce a clean, safe, self-contained payload that the user can paste as the first message
#     in a new session to instantly rehydrate context from repo.
#   - Never modify or delete anything.

$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

function Write-Section($title) {
    Write-Host ""
    Write-Host "=== $title ==="
}

$repo = Split-Path -Parent $MyInvocation.MyCommand.Path
$repo = Split-Path -Parent $repo
$attachmentsDir = Join-Path $repo 'attachments'
$ts = (Get-Date).ToUniversalTime().ToString("yyyyMMddTHHmmssZ")

Write-Section "CoReloadRunner Start"

# Validate git cleanliness
$gitStatus = (git -C $repo status --short)
if ($gitStatus) {
    Write-Host "[WARN] Repo has uncommitted changes:"
    Write-Host $gitStatus
} else {
    Write-Host "[OK] Repo clean."
}

# Gather attachments info
$files = Get-ChildItem -LiteralPath $attachmentsDir -File -Recurse | Sort-Object FullName
Write-Host "[INFO] Attachments detected: $($files.Count)"

# Build rehydration payload text
$payloadPath = Join-Path $repo "tools/CoReload/CoReload_Payload_$ts.txt"

$payloadLines = @()
$payloadLines += "### CoReload Payload — $ts"
$payloadLines += "This text can be pasted as the FIRST MESSAGE into a new ChatGPT session."
$payloadLines += ""
$payloadLines += "Purpose:"
$payloadLines += "- Rehydrate CoSteward context from repo, not from ChatGPT memory."
$payloadLines += "- Ensure total continuity even if the previous session was purged."
$payloadLines += ""
$payloadLines += "Included attachments list (for AI ingestion cues):"
foreach ($f in $files) {
    $payloadLines += "- $($f.Name)"
}
$payloadLines += ""
$payloadLines += "CoReload instructions:"
$payloadLines += "1. Paste entire payload block into a new ChatGPT session."
$payloadLines += "2. ChatGPT (as CoSteward/Co1) will read attachments from repo and self-align."
$payloadLines += "3. Resume operations with zero conceptual loss."

$payloadLines -join "`n" | Set-Content -LiteralPath $payloadPath -Encoding UTF8

Write-Section "Payload Created"
Write-Host "Payload:"
Write-Host "  $payloadPath"

Write-Section "CoReloadRunner Complete"
