<#
Use-CoPromptSimple.ps1

Defines a helper function Use-CoPromptSimple which, when invoked, checks the
current prompt function and replaces it with a simple:

  PS <path>

if it detects a fancy BPOE/heart-style prompt (e.g., with ♥ / ♡ / [BPOE:...]).

Usage:

  . tools/terminal/Use-CoPromptSimple.ps1
  Use-CoPromptSimple
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Use-CoPromptSimple {
  $promptCmd = Get-Command prompt -ErrorAction SilentlyContinue

  if ($null -ne $promptCmd -and $promptCmd.CommandType -eq 'Function') {
    $src = $promptCmd.ScriptBlock.ToString()

    # Only override if it looks like the fancy BPOE/heart prompt
    if ($src -match 'BPOE' -or $src -match '♥' -or $src -match '♡') {
      function prompt {
        $loc = $executionContext.SessionState.Path.CurrentLocation
        "PS $loc> "
      }

      Write-Host "Prompt normalized to: PS <path> >" -ForegroundColor Yellow
    }
    else {
      Write-Host "Prompt already simple; leaving as-is." -ForegroundColor DarkGray
    }
  }
  else {
    Write-Host "No custom prompt function found; nothing to change." -ForegroundColor DarkGray
  }
}
