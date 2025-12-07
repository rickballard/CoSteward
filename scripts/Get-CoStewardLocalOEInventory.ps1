param(
    [switch]$Quiet
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

function Write-Line {
    param([string]$Text)
    if ($Quiet) {
        $Text
    } else {
        Write-Output $Text
    }
}

Write-Line "# CoSteward Local OE Inventory"
Write-Line ""
Write-Line "GeneratedUTS: {0}" -f ((Get-Date).ToUniversalTime().ToString('yyyyMMddTHHmmssZ'))
Write-Line ""

# OS info
Write-Line "## OS"
Write-Line "MachineName: {0}" -f $env:COMPUTERNAME
Write-Line "OSVersion:   {0}" -f [System.Environment]::OSVersion.VersionString
Write-Line ""

# PowerShell info
Write-Line "## PowerShell"
Write-Line "PSVersion:   {0}" -f $PSVersionTable.PSVersion
Write-Line "Edition:     {0}" -f $PSVersionTable.PSEdition
Write-Line ""

# Git info
Write-Line "## Git"
try {
    $gitVersion = git --version 2>$null
    if ($gitVersion) {
        Write-Line "Git:         {0}" -f $gitVersion
    } else {
        Write-Line "Git:         not found or not on PATH"
    }
} catch {
    Write-Line "Git:         error while checking: {0}" -f $_.Exception.Message
}
Write-Line ""

# winget info
Write-Line "## winget"
try {
    $wingetVersion = winget --version 2>$null
    if ($wingetVersion) {
        Write-Line "winget:      {0}" -f $wingetVersion
    } else {
        Write-Line "winget:      not found"
    }
} catch {
    Write-Line "winget:      error while checking: {0}" -f $_.Exception.Message
}
Write-Line ""

# PowerToys info
Write-Line "## PowerToys"
$powerToysPath = Join-Path $env:LOCALAPPDATA 'Microsoft\PowerToys'
if (Test-Path $powerToysPath) {
    Write-Line "PowerToys:   installed at $powerToysPath"
    try {
        $exe = Get-ChildItem -Path $powerToysPath -Recurse -Filter 'PowerToys.exe' -ErrorAction SilentlyContinue | Select-Object -First 1
        if ($exe) {
            $v = (Get-Item $exe.FullName).VersionInfo.ProductVersion
            Write-Line "Version:     $v"
        }
    } catch {
        Write-Line "Version:     error while checking: {0}" -f $_.Exception.Message
    }
} else {
    Write-Line "PowerToys:   not detected"
}
Write-Line ""

# OpenAI key info (do not print actual key)
Write-Line "## OpenAI"
if ($env:OPENAI_API_KEY) {
    Write-Line "OPENAI_API_KEY: present (value hidden)"
} else {
    Write-Line "OPENAI_API_KEY: not set"
}
Write-Line ""

Write-Line "## Notes"
Write-Line "- This report is intended for Co1 and CoSteward BPOE alignment."
Write-Line "- Do not commit any secrets or full keys."
Write-Line ""
