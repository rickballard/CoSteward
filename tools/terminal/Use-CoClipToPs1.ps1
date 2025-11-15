function Use-CoClipToPs1 {
    [CmdletBinding()]
    param(
        # Label for the filenames, e.g. "DiaCont_MegaWave"
        [string]$Label  = 'CoTranscript',

        # Optional override for output directory (default = Downloads)
        [string]$OutDir = (Join-Path $HOME 'Downloads'),

        # If set, just show what would be written instead of saving .ps1
        [switch]$DryRun
    )

    Set-StrictMode -Version Latest
    $ErrorActionPreference = "Stop"

    $CoSteward = Join-Path $HOME 'Documents\GitHub\CoSteward'
    $helper    = Join-Path $CoSteward 'tools/terminal/Convert-CoTranscriptToPs1.ps1'

    if (-not (Test-Path -LiteralPath $helper)) {
        throw "Convert-CoTranscriptToPs1.ps1 not found at $helper"
    }

    . $helper

    if (-not (Get-Command Get-Clipboard -ErrorAction SilentlyContinue)) {
        throw "Get-Clipboard not available in this session."
    }

    $clip = Get-Clipboard
    if (-not $clip) {
        throw "Clipboard is empty or not text."
    }

    if (-not (Test-Path -LiteralPath $OutDir)) {
        New-Item -ItemType Directory -Force -Path $OutDir *> $null
    }

    $ts             = (Get-Date).ToString('yyyyMMddTHHmmss')
    $baseName       = "{0}_{1}" -f $Label, $ts
    $TranscriptPath = Join-Path $OutDir ($baseName + '.txt')
    $SnippetPath    = Join-Path $OutDir ($baseName + '.ps1')

    $clip | Set-Content -LiteralPath $TranscriptPath -Encoding UTF8
    Write-Host "Raw transcript → $TranscriptPath" -ForegroundColor Cyan

    if ($DryRun) {
        Write-Host "DryRun: showing cleaned content only (no file written)..." -ForegroundColor Yellow
        Convert-CoTranscriptToPs1 -InputPath $TranscriptPath -DryRun
        return
    }

    Convert-CoTranscriptToPs1 -InputPath $TranscriptPath -OutputPath $SnippetPath
    Write-Host "Cleaned script → $SnippetPath" -ForegroundColor Green

    if (Get-Command code -ErrorAction SilentlyContinue) {
        code $SnippetPath
    } else {
        Write-Host "VS Code ('code') not found; open manually if you like." -ForegroundColor Yellow
    }
}
