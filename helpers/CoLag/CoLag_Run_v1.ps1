# CoLag_Run_v1.ps1
# Interactive CoLag helper to classify lag type for CoSessions
param(
    [string] $SessionId
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

function UTS { (Get-Date).ToUniversalTime().ToString('yyyyMMddTHHmmssZ') }

$ts = UTS

Write-Host ''
Write-Host 'CoLag: Lag classifier starting...' -ForegroundColor Cyan
if (-not $SessionId) {
    $SessionId = Read-Host 'Enter a short label for this session (e.g. Co1, BusPlan, OnboardingAIs)'
}

Write-Host ''
Write-Host 'Q1: Is the lag only happening in THIS ChatGPT conversation/tab?' -ForegroundColor Cyan
Write-Host '    - Answer Y if other ChatGPT conversations and sites feel normal.' -ForegroundColor DarkGray
Write-Host '    - Answer N if new chats or other sites also feel slow.' -ForegroundColor DarkGray
$chatOnly = (Read-Host 'Y/N').Trim().ToUpperInvariant()

# Run OE snapshot so we have metrics
$coOEPath = Join-Path $PSScriptRoot 'CoOE_TabBloat_QuickCheck_v1.ps1'
if (-not (Test-Path $coOEPath)) {
    throw "Expected CoOE helper not found at $coOEPath"
}

Write-Host ''
Write-Host 'Running CoOE_TabBloat_QuickCheck_v1.ps1 for OE metrics...' -ForegroundColor Cyan

# CoOE may emit log lines + an object; normalize to a single stats object
$oeRaw = & $coOEPath

$oe = $null

if ($oeRaw -is [System.Array]) {
    $oe = $oeRaw |
      Where-Object {
        $_ -is [pscustomobject] -and
        $_.PSObject.Properties.Name -contains 'BrowserRAMMB'
      } |
      Select-Object -Last 1
}
elseif ($oeRaw -is [pscustomobject]) {
    if ($oeRaw.PSObject.Properties.Name -contains 'BrowserRAMMB') {
        $oe = $oeRaw
    }
}

if (-not $oe) {
    $oe = [pscustomobject]@{
        BrowserRAMMB = $null
        BrowserCount = $null
    }
}

$browserRAM   = $oe.BrowserRAMMB
$browserCount = $oe.BrowserCount

# Basic classification heuristics (for 32GB host; adjust as needed)
$classification = 'Unknown'
if ($chatOnly -eq 'Y') {
    $classification = 'CoLag-Chat'
}
else {
    if ($browserRAM -ne $null -and $browserRAM -ge 6000) {
        $classification = 'CoLag-OE'
    }
    else {
        $classification = 'CoLag-Net/Platform-or-Other'
    }
}

Write-Host ''
Write-Host ("CoLag classification: {0}" -f $classification) -ForegroundColor Green
Write-Host ("  SessionId     : {0}" -f $SessionId)
Write-Host ("  BrowserRAMMB  : {0}" -f $browserRAM)
Write-Host ("  BrowserCount  : {0}" -f $browserCount)

# Emit advisory text snippet to a log for Co1 / CoSteward to reuse
$logRoot = Join-Path $HOME 'Documents\CoLagLogs'
New-Item -ItemType Directory -Path $logRoot -Force | Out-Null

$logPath = Join-Path $logRoot ("CoLag_Advisory_{0}_{1}.md" -f $SessionId, $ts)

$advisory = @"
# CoLag Advisory

- Timestamp     : $ts
- SessionId     : $SessionId
- Classification: $classification
- BrowserRAMMB  : $browserRAM
- BrowserCount  : $browserCount

## Recommended next steps (human-facing sketch)

### If classification == CoLag-Chat

- This suggests lag is tied to this specific ChatGPT conversation.
- Recommended:
  - Summarise this session into a compact handoff note (intent, current state, active tasks).
  - Start a new session seeded with that summary.
  - Keep the OS and browser as-is; treat this as chat-age bloat, not OE failure.

### If classification == CoLag-OE

- This suggests local OE / tab bloat issues.
- Recommended:
  - Close heavy or unused browser tabs, possibly full browsers.
  - Restart the preferred browser with only essential tabs (ChatGPT + minimal support).
  - Consider using a dedicated clean profile or browser for CoSuite work.

### If classification == CoLag-Net/Platform-or-Other

- Lag may be related to network or platform behavior rather than this session or local OE alone.
- Recommended:
  - Test from a clean browser profile or alternate browser.
  - Check network connectivity and any VPN / filtering layers.
  - If problems persist across devices and networks, consider reporting a platform issue with timestamp and context.
"@

Set-Content -Path $logPath -Value $advisory -Encoding UTF8

Write-Host ''
Write-Host 'CoLag advisory written to:' -ForegroundColor Cyan
Write-Host "  $logPath" -ForegroundColor Yellow

# Return an object for callers
[pscustomobject]@{
    Timestamp      = $ts
    SessionId      = $SessionId
    Classification = $classification
    BrowserRAMMB   = $browserRAM
    BrowserCount   = $browserCount
    AdvisoryPath   = $logPath
}
