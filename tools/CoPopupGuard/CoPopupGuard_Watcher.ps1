param(
    [int]$PollMs = 2000,
    [string[]]$BrowserProcesses = @('chrome', 'msedge', 'brave'),
    [string[]]$Patterns = @(
        'inactivity detected',
        'are you still there',
        'session about to expire',
        'due to inactivity'
    ),
    [string]$LogRoot = "$HOME\Documents\GitHub\CoSteward\logs\CoPopupGuard",
    [switch]$AutoDismiss,
    [switch]$VerboseConsole
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$null = New-Item -ItemType Directory -Path $LogRoot -Force

Add-Type -AssemblyName UIAutomationClient

function Get-UTS {
    (Get-Date).ToUniversalTime().ToString('yyyyMMddTHHmmssZ')
}

function Write-CoPopupGuardEvent {
    param(
        [string]$Source,
        [string]$ProcessName,
        [int]$ProcessId,
        [string]$Text,
        [string]$WindowTitle
    )

    $uts = Get-UTS
    $logFile = Join-Path $LogRoot ("CoPopupGuard_Events_{0}.jsonl" -f (Get-Date -Format 'yyyyMMdd'))

    $obj = [ordered]@{
        UTS         = $uts
        Source      = $Source
        ProcessName = $ProcessName
        ProcessId   = $ProcessId
        WindowTitle = $WindowTitle
        Text        = $Text
        Machine     = $env:COMPUTERNAME
        User        = $env:USERNAME
    }

    $line = ($obj | ConvertTo-Json -Depth 5 -Compress)
    Add-Content -Path $logFile -Value $line

    if ($VerboseConsole) {
        Write-Host "[CoPopupGuard] $uts $ProcessName($ProcessId): $Text"
    }
}

function Test-PatternHit {
    param(
        [string]$Text,
        [string[]]$Patterns
    )

    if ([string]::IsNullOrWhiteSpace($Text)) { return $false }

    foreach ($p in $Patterns) {
        if ($Text -match [Regex]::Escape($p)) {
            return $true
        }
    }

    return $false
}

function Invoke-AutoDismiss {
    param(
        [System.Windows.Automation.AutomationElement]$Element
    )

    try {
        Add-Type -AssemblyName System.Windows.Forms

        $pattern = $Element.GetCurrentPattern([System.Windows.Automation.WindowPatternIdentifiers]::Pattern)
        if ($pattern -is [System.Windows.Automation.WindowPattern]) {
            $pattern.SetWindowVisualState([System.Windows.Automation.WindowVisualState]::Normal)
        }

        Start-Sleep -Milliseconds 100
        [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
    } catch {
        Write-Verbose "AutoDismiss failed: $_"
    }
}

function Get-BrowserRootElements {
    param(
        [string[]]$BrowserProcesses
    )

    $procs = Get-Process | Where-Object { $BrowserProcesses -contains $_.ProcessName } |
        Select-Object -ExpandProperty Id

    if (-not $procs) { return @() }

    $root = [System.Windows.Automation.AutomationElement]::RootElement

    $cond = [System.Windows.Automation.Condition]::TrueCondition
    $wins = $root.FindAll([System.Windows.Automation.TreeScope]::Children, $cond)

    $list = @()
    for ($i = 0; $i -lt $wins.Count; $i++) {
        $w = $wins.Item($i)
        try {
            $pid = $w.Current.ProcessId
        } catch {
            continue
        }
        if ($procs -contains $pid) {
            $list += $w
        }
    }

    return $list
}

Write-Host "[CoPopupGuard] Started at $(Get-UTS). PollMs=$PollMs"

while ($true) {
    try {
        $browserWindows = Get-BrowserRootElements -BrowserProcesses $BrowserProcesses

        foreach ($bw in $browserWindows) {
            $pid   = $bw.Current.ProcessId
            $title = $bw.Current.Name
            $proc  = Get-Process -Id $pid -ErrorAction SilentlyContinue

            if (-not $proc) { continue }

            $procName = $proc.ProcessName

            if (Test-PatternHit -Text $title -Patterns $Patterns) {
                Write-CoPopupGuardEvent -Source 'WindowTitle' -ProcessName $procName -ProcessId $pid -Text $title -WindowTitle $title
                if ($AutoDismiss) { Invoke-AutoDismiss -Element $bw }
                continue
            }

            $cond = [System.Windows.Automation.Condition]::TrueCondition
            $children = $bw.FindAll([System.Windows.Automation.TreeScope]::Subtree, $cond)

            for ($i = 0; $i -lt $children.Count; $i++) {
                $c = $children.Item($i)
                $name = $null
                try { $name = $c.Current.Name } catch { continue }

                if (Test-PatternHit -Text $name -Patterns $Patterns) {
                    Write-CoPopupGuardEvent -Source 'ElementName' -ProcessName $procName -ProcessId $pid -Text $name -WindowTitle $title
                    if ($AutoDismiss) { Invoke-AutoDismiss -Element $bw }
                    break
                }
            }
        }
    } catch {
        Write-Warning "[CoPopupGuard] Error: $_"
    }

    Start-Sleep -Milliseconds $PollMs
}
