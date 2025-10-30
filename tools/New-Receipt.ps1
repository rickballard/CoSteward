param(
  [string]$Repo     = "CoSteward",
  [string]$Area     = "ops",
  [string]$Action   = "",
  [int[]] $PR       = @(),
  [string]$Note     = "",
  [string]$RepoUrl  = "https://github.com/rickballard/CoSteward"
)
$ErrorActionPreference="Stop"
$VIOLET_SCHEMA = "v1"
$here = Split-Path -Parent $PSCommandPath
$root = (Resolve-Path (Join-Path $here "..")).Path  # tools/.. -> repo root
$docsOps = Join-Path $root "docs\ops"
$status  = Join-Path $root "STATUS"
$mdPath  = Join-Path $docsOps "RECEIPTS.md"
$csvPath = Join-Path $status  "receipts.csv"
foreach($p in @($docsOps,$status)){ if(-not (Test-Path $p)){ New-Item -ItemType Directory -Force $p | Out-Null } }
$utc = [DateTimeOffset]::UtcNow.ToString("yyyy-MM-ddTHH:mm:ssZ")
$branch = (& git -C $root branch --show-current).Trim(); if([string]::IsNullOrWhiteSpace($branch)){ $branch = "detached" }
$sha = (& git -C $root rev-parse --short HEAD).Trim()
$prs = if($PR){ ($PR | ForEach-Object { "#$_" }) -join "," } else { "" }
$prLinks = if($PR){ ($PR | ForEach-Object { "[#$_]($RepoUrl/pull/$_)" }) -join ", " } else { "" }
$csvLine = "{0},{1},{2},{3},{4},{5},{6},{7},{8}" -f $utc,$Repo,$branch,$sha,$Area,($Action -replace ",",";"),($prs -replace ",",";"),($Note -replace ",",";"),$VIOLET_SCHEMA
if(-not (Test-Path $csvPath)){ "utc,repo,branch,sha,area,action,prs,note,schema" | Add-Content -Encoding utf8NoBOM $csvPath }
Add-Content -Path $csvPath -Value $csvLine -Encoding utf8NoBOM
$mdPrSuffix = if([string]::IsNullOrWhiteSpace($prLinks)){ "" } else { " · PRs: " + $prLinks }
$mdPrSuffix = if([string]::IsNullOrWhiteSpace($prLinks)){ "" } else { " · PRs: " + $prLinks }
$line = "- **{0}** · `{1}@{2}` · **{3}** — {4}{5} ; s:{6}" -f $utc,$Repo,$sha,$Area,$Action,$mdPrSuffix,$VIOLET_SCHEMA

# Ensure RECEIPTS.md exists and has a header
$existing = Get-Content $mdPath -Raw -EA SilentlyContinue
if([string]::IsNullOrWhiteSpace($existing)){
  Set-Content -Path $mdPath -Value ("# Violet Receipts (Hybrid)"+[Environment]::NewLine+[Environment]::NewLine+"## Entries"+[Environment]::NewLine) -Encoding utf8NoBOM
}elseif($existing -notmatch '(?m)^\#\#\s+Entries\s*
  }
  Add-Content -Path $mdPath -Value $line -Encoding utf8NoBOM
}
$vioPrSuffix = if([string]::IsNullOrWhiteSpace($prs)){ "" } else { " ; " + $prs }
$noteSuffix  = if([string]::IsNullOrWhiteSpace($Note)){ "" } else { " ; " + $Note }
# --- VIOLET EMIT (console + clipboard) ---
$ansiStart = "`e[95m"; $ansiEnd = "`e[0m"
if ($PSBoundParameters.ContainsKey("PromptText") -and -not [string]::IsNullOrWhiteSpace($PromptText)) {
  Write-Host ($ansiStart + $PromptText + $ansiEnd)
}
Write-Host ($ansiStart + $violet + $ansiEnd)
try { Set-Clipboard -Value $violet } catch {}
# --- /VIOLET EMIT ---


# --- VIOLET EMIT (console + clipboard) ---
$ansiStart = "`e[95m"; $ansiEnd = "`e[0m"
if ($PSBoundParameters.ContainsKey("PromptText") -and -not [string]::IsNullOrWhiteSpace($PromptText)) {
  Write-Host ($ansiStart + $PromptText + $ansiEnd)
}
Write-Host ($ansiStart + $violet + $ansiEnd)
try { Set-Clipboard -Value $violet } catch {}
# --- /VIOLET EMIT ---


# --- begin: safe RECEIPTS.md write helper ---
function Add-ReceiptMarkdownLine {
  param(
    [Parameter(Mandatory)] [string]$MdPath,
    [Parameter(Mandatory)] [string]$Line
  )
  $exists = Test-Path $MdPath
  $content = if($exists){ Get-Content $MdPath -Raw -EA SilentlyContinue } else { "" }

  if([string]::IsNullOrWhiteSpace($content)){
    $content = "# Violet Receipts (Hybrid)`n`n## Entries`n"
  }elseif($content -notmatch '(?m)^\#\#\s+Entries\s*$'){
    # Ensure we have the section anchor
    $content = $content.TrimEnd()+"`n`n## Entries`n"
  }

  # Insert the line immediately after the '## Entries' header line
  $lines = $content -split "`r?`n"
  $idx = ($lines | ForEach-Object {$_}) | Select-String -SimpleMatch '## Entries' | Select-Object -First 1
  if($null -eq $idx){
    # Fallback: append header + line
    $lines += '## Entries'
    $lines += $Line
  }else{
    $insertAt = $idx.LineNumber
    # Make sure there's an empty spacer line after header (for readability)
    if($insertAt -lt $lines.Count -and $lines[$insertAt] -ne ''){
      $lines = $lines[0..$insertAt] + @('') + $lines[($insertAt+1)..($lines.Count-1)]
      $insertAt += 1
    }
    $lines = $lines[0..$insertAt] + @($Line) + $lines[($insertAt+1)..($lines.Count-1)]
  }

  Set-Content -Path $MdPath -Value ($lines -join [Environment]::NewLine) -Encoding utf8NoBOM
}
# --- end: safe RECEIPTS.md write helper ---

){
  Add-Content -Path $mdPath -Value "## Entries" -Encoding utf8NoBOM
}

# Append the new line (stable, non-brittle). We can re-enable newest-first later.
Add-Content -Path $mdPath -Value $line -Encoding utf8NoBOM
  }
  Add-Content -Path $mdPath -Value $line -Encoding utf8NoBOM
}
$vioPrSuffix = if([string]::IsNullOrWhiteSpace($prs)){ "" } else { " ; " + $prs }
$noteSuffix  = if([string]::IsNullOrWhiteSpace($Note)){ "" } else { " ; " + $Note }
# --- VIOLET EMIT (console + clipboard) ---
$ansiStart = "`e[95m"; $ansiEnd = "`e[0m"
if ($PSBoundParameters.ContainsKey("PromptText") -and -not [string]::IsNullOrWhiteSpace($PromptText)) {
  Write-Host ($ansiStart + $PromptText + $ansiEnd)
}
Write-Host ($ansiStart + $violet + $ansiEnd)
try { Set-Clipboard -Value $violet } catch {}
# --- /VIOLET EMIT ---


# --- VIOLET EMIT (console + clipboard) ---
$ansiStart = "`e[95m"; $ansiEnd = "`e[0m"
if ($PSBoundParameters.ContainsKey("PromptText") -and -not [string]::IsNullOrWhiteSpace($PromptText)) {
  Write-Host ($ansiStart + $PromptText + $ansiEnd)
}
Write-Host ($ansiStart + $violet + $ansiEnd)
try { Set-Clipboard -Value $violet } catch {}
# --- /VIOLET EMIT ---


# --- begin: safe RECEIPTS.md write helper ---
function Add-ReceiptMarkdownLine {
  param(
    [Parameter(Mandatory)] [string]$MdPath,
    [Parameter(Mandatory)] [string]$Line
  )
  $exists = Test-Path $MdPath
  $content = if($exists){ Get-Content $MdPath -Raw -EA SilentlyContinue } else { "" }

  if([string]::IsNullOrWhiteSpace($content)){
    $content = "# Violet Receipts (Hybrid)`n`n## Entries`n"
  }elseif($content -notmatch '(?m)^\#\#\s+Entries\s*$'){
    # Ensure we have the section anchor
    $content = $content.TrimEnd()+"`n`n## Entries`n"
  }

  # Insert the line immediately after the '## Entries' header line
  $lines = $content -split "`r?`n"
  $idx = ($lines | ForEach-Object {$_}) | Select-String -SimpleMatch '## Entries' | Select-Object -First 1
  if($null -eq $idx){
    # Fallback: append header + line
    $lines += '## Entries'
    $lines += $Line
  }else{
    $insertAt = $idx.LineNumber
    # Make sure there's an empty spacer line after header (for readability)
    if($insertAt -lt $lines.Count -and $lines[$insertAt] -ne ''){
      $lines = $lines[0..$insertAt] + @('') + $lines[($insertAt+1)..($lines.Count-1)]
      $insertAt += 1
    }
    $lines = $lines[0..$insertAt] + @($Line) + $lines[($insertAt+1)..($lines.Count-1)]
  }

  Set-Content -Path $MdPath -Value ($lines -join [Environment]::NewLine) -Encoding utf8NoBOM
}
# --- end: safe RECEIPTS.md write helper ---



