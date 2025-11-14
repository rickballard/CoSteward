function Convert-CoTranscriptToPs1 {
    [CmdletBinding()]
    param(
        # Raw transcript file (with "PS C:\...>" prompts etc)
        [Parameter(Mandatory)]
        [string]$InputPath,

        # Where to write the cleaned .ps1; default = same path, .ps1 extension
        [string]$OutputPath,

        # Show what would be written instead of saving
        [switch]$DryRun
    )

    Set-StrictMode -Version Latest
    $ErrorActionPreference = "Stop"

    if (-not (Test-Path -LiteralPath $InputPath)) {
        throw "Input transcript not found: $InputPath"
    }

    $raw   = Get-Content -LiteralPath $InputPath -Raw
    $lines = $raw -split "`r?`n"

    $outLines = New-Object System.Collections.Generic.List[string]

    foreach ($line in $lines) {
        $t = $line.TrimEnd()

        # Drop blank lines
        if ([string]::IsNullOrWhiteSpace($t)) { continue }

        # Drop obvious "PS C:\...>" prompt-only lines
        if ($t -match '^PS\s+[A-Z]:\\' -and $t -notmatch '>\s+\S') {
            continue
        }

        # Strip leading "PS <path> > " when there's actual content after ">"
        if ($t -match '^PS\s+[^>]+>\s*(.*)$') {
            $cmd = $Matches[1]
            if (-not [string]::IsNullOrWhiteSpace($cmd)) {
                $outLines.Add($cmd)
            }
            continue
        }

        # Drop obvious Get-Process noise from bad pastes
        if ($t -match '^\w+:\s+Cannot find a process with the name "C:\\Users\\Chris\\Documents\\GitHub\\') {
            continue
        }

        # Drop usage blurb spam from failed pwsh -File calls
        if ($t -match '^Usage:\s+pwsh\[\.exe\]') { continue }

        # Keep everything else
        $outLines.Add($t)
    }

    if ($DryRun) {
        $outLines -join "`n" | Write-Output
        return
    }

    if (-not $OutputPath) {
        $OutputPath = [System.IO.Path]::ChangeExtension($InputPath, '.ps1')
    }

    $dir = Split-Path -Parent $OutputPath
    if ($dir -and -not (Test-Path -LiteralPath $dir)) {
        New-Item -ItemType Directory -Force -Path $dir *> $null
    }

    $outLines | Set-Content -LiteralPath $OutputPath -Encoding UTF8
    Write-Host "Wrote cleaned script to: $OutputPath" -ForegroundColor Green
}
