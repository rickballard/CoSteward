[CmdletBinding()]
param(
    [switch]$DryRun
)
# CoSteward_SessionPurgePrep_v1.ps1
# Purpose:
#   - PREPARE for a safe session wipe, not perform it.
#   - Snapshot attachments, tool versions, repo health markers.
#   - Provide guidance for determining when a session is safe to purge.
#   - Never modifies repo; never clears browser; never touches user files outside repo.

$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

$ts = (Get-Date).ToUniversalTime().ToString("yyyyMMddTHHmmssZ")

Write-Host "[INFO] Preparing CoSession purge snapshot at $ts"

# Snapshot attachments count
$repo      = Split-Path -Parent $MyInvocation.MyCommand.Path
$repo      = Split-Path -Parent $repo
$attachDir = Join-Path $repo 'attachments'

$files = Get-ChildItem -LiteralPath $attachDir -File -Recurse -ErrorAction SilentlyContinue
Write-Host "[INFO] Attachment files detected: $($files.Count)"

# Snapshot basic repo health markers:
$health = @{
    TimestampUTC = $ts
    RepoRoot     = $repo
    Attachments  = $files.Count
    GitStatus    = (git -C $repo status --short)
    Branch       = (git -C $repo rev-parse --abbrev-ref HEAD)
}

$healthPath = Join-Path $repo "docs/intent/attachments/CoSessionPurgePrep_$ts.json"
$health | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath $healthPath -Encoding UTF8

Write-Host "[OK] SessionPurgePrep snapshot created:"
Write-Host "     $healthPath"

Write-Host "[INFO] No purge actions executed. This script never deletes anything."
Write-Host "[INFO] Review snapshot before enabling any CoReload lane."
