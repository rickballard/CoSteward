[CmdletBinding()]
param(
    [string]$MntRoot = 'C:\mnt',
    [string]$AttachmentsSubdir = 'attachments',
    [switch]$DryRun
)
# CoSteward_SessionRescue_FromMnt.ps1
# - Purpose: copy files from an optional mnt root into the repo attachments dir.
# - BPOE: C:\mnt is treated as best-effort only; script MUST NOT fail if it is absent.

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

# Derive repo root from script location
$scriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$repo       = Split-Path -Parent $scriptRoot
$attachmentsDir = Join-Path $repo $AttachmentsSubdir
New-Item -ItemType Directory -Path $attachmentsDir -Force | Out-Null

$files = @()

if (Test-Path $MntRoot) {
    Write-Host "[INFO] Scanning mnt root '$MntRoot' for files to rescue..."
    $files = Get-ChildItem -LiteralPath $MntRoot -File -Recurse
} else {
    Write-Host "[INFO] No mnt root found at '$MntRoot'; skipping mnt-based rescue."
}

if (-not $files -or $files.Count -eq 0) {
    Write-Host "[INFO] No files found to rescue from mnt root."
    return
}

foreach ($f in $files) {
    $dest = Join-Path $attachmentsDir $f.Name
    if ($DryRun) {
        Write-Host "[DRYRUN] Would copy '$($f.FullName)' -> '$dest'"
    } else {
        Copy-Item -LiteralPath $f.FullName -Destination $dest -Force
        Write-Host "[OK] Copied '$($f.FullName)' -> '$dest'"
    }
}
