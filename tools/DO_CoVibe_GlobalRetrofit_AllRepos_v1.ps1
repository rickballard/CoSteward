[CmdletBinding()]
param(
    [string]  $GhRoot       = "$HOME\Documents\GitHub",
    [string[]]$ExcludeRepos = @('AmpliPi'),
    [switch]  $DryRun
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

function UTS {
    (Get-Date).ToUniversalTime().ToString('yyyyMMddTHHmmssZ')
}

$covibeBlock = @"
## CoVibe - Scope checklist

### DONE
- [ ]

### DOING
- [ ]

### PLANNED
- [ ]
"@

Write-Host '== CoVibe global retrofit =='
Write-Host "GhRoot: $GhRoot"
Write-Host "Exclude repos: $($ExcludeRepos -join ', ')"
if ($DryRun) { Write-Host 'Mode: DRY RUN (no git changes)' }

if (-not (Test-Path -LiteralPath $GhRoot)) {
    throw "GhRoot not found at $GhRoot"
}

$repoDirs = Get-ChildItem -LiteralPath $GhRoot -Directory | Where-Object {
    $name = $_.Name
    $full = $_.FullName
    -not ($ExcludeRepos -contains $name) -and
    (Test-Path (Join-Path $full '.git'))
}

if (-not $repoDirs) {
    Write-Host 'No git repos found under GhRoot (after exclusions). Nothing to do.'
    return
}

$globalReport = @()

foreach ($repoDir in $repoDirs) {
    $repoPath = $repoDir.FullName
    $repoName = $repoDir.Name

    Write-Host ''
    Write-Host "== Repo: $repoName =="
    Write-Host "Path: $repoPath"

    $waveNotes = Get-ChildItem -Path $repoPath -Recurse -Filter 'wave_notes.md' -ErrorAction SilentlyContinue

    if (-not $waveNotes) {
        Write-Host 'No wave_notes.md files found. Skipping.'
        $globalReport += [pscustomobject]@{
            Repo   = $repoName
            Path   = $repoPath
            Files  = @()
            Status = 'No wave_notes.md found'
            UTS    = (UTS)
        }
        continue
    }

    $changedFiles = @()

    foreach ($file in $waveNotes) {
        $notesPath = $file.FullName
        $text      = Get-Content -LiteralPath $notesPath -Raw

        if ($text -like '*CoVibe - Scope checklist*') {
            Write-Host "Already has CoVibe: $notesPath"
            continue
        }

        Write-Host "Adding CoVibe block: $notesPath"

        $newText = ($text.TrimEnd() + "`r`n`r`n" + $covibeBlock.Trim() + "`r`n")
        if (-not $DryRun) {
            $newText | Set-Content -LiteralPath $notesPath -Encoding utf8
        }
        $changedFiles += $notesPath
    }

    if (-not $changedFiles) {
        Write-Host 'All wave_notes.md already CoVibe-compliant. No changes.'
        $globalReport += [pscustomobject]@{
            Repo   = $repoName
            Path   = $repoPath
            Files  = @()
            Status = 'Already compliant'
            UTS    = (UTS)
        }
        continue
    }

    if ($DryRun) {
        Write-Host "DRYRUN: would git-add and commit in ${repoName}:"
        $changedFiles | ForEach-Object { Write-Host "  - $_" }

        $globalReport += [pscustomobject]@{
            Repo   = $repoName
            Path   = $repoPath
            Files  = $changedFiles
            Status = 'DRYRUN changes only'
            UTS    = (UTS)
        }
        continue
    }

    Push-Location -LiteralPath $repoPath
    try {
        foreach ($path in $changedFiles) {
            $rel = $path.Substring($repoPath.Length).TrimStart('\')
            git add $rel
        }

        $ts  = UTS
        $msg = "CoVibe: ensure scope checklist in wave notes ($ts)"
        git commit -m $msg 2>$null | Out-Null

        # Only push if a remote is configured
        $remotes = git remote 2>$null
        if ([string]::IsNullOrWhiteSpace($remotes)) {
            Write-Host "No git remotes configured for ${repoName}; commit is local only."
            $statusMsg = 'Committed (local only, no remote)'
        }
        else {
            git push
            Write-Host "Committed and pushed CoVibe retrofit in $repoName."
            $statusMsg = 'Committed and pushed'
        }

        $globalReport += [pscustomobject]@{
            Repo   = $repoName
            Path   = $repoPath
            Files  = $changedFiles
            Status = $statusMsg
            UTS    = $ts
        }
    }
    catch {
        $errMsg = $_.Exception.Message
        Write-Warning ("Git operation failed for repo {0}: {1}" -f $repoName, $errMsg)
        $globalReport += [pscustomobject]@{
            Repo   = $repoName
            Path   = $repoPath
            Files  = $changedFiles
            Status = "ERROR: $errMsg"
            UTS    = (UTS)
        }
    }
    finally {
        Pop-Location
    }
}

Write-Host ''
Write-Host '== Global CoVibe retrofit summary =='

foreach ($item in $globalReport) {
    Write-Host "Repo: $($item.Repo)"
    Write-Host "  Status: $($item.Status)"
    Write-Host "  UTS: $($item.UTS)"
    if ($item.Files -and $item.Files.Count -gt 0) {
        Write-Host '  Files:'
        $item.Files | ForEach-Object { Write-Host "    - $_" }
    }
}

# Optional: CoBus report into CoSteward
try {
    $stewardRoot = Join-Path $GhRoot 'CoSteward'
    if (Test-Path (Join-Path $stewardRoot '.git')) {
        $reportRoot = Join-Path $stewardRoot 'docs\intent\advice\notes'
        $dayFolder  = Join-Path $reportRoot (Get-Date -Format 'yyyyMMdd')
        if (-not (Test-Path $dayFolder)) {
            New-Item -ItemType Directory -Path $dayFolder -Force | Out-Null
        }

        $uts      = UTS
        $reportMd = Join-Path $dayFolder ("CoBus_CoVibe_GlobalRetrofit_{0}.md" -f $uts)

        $mdLines = @()
        $mdLines += '# CoBus - CoVibe global retrofit report'
        $mdLines += ''
        $mdLines += "- UTS: $uts"
        $mdLines += "- GhRoot: $GhRoot"
        $mdLines += "- Excluded repos: $($ExcludeRepos -join ', ')"
        $mdLines += "- DryRun: $DryRun"
        $mdLines += ''
        $mdLines += '## Per repo summary'
        $mdLines += ''

        foreach ($item in $globalReport) {
            $mdLines += "### $($item.Repo)"
            $mdLines += "- Path: $($item.Path)"
            $mdLines += "- Status: $($item.Status)"
            $mdLines += "- UTS: $($item.UTS)"
            if ($item.Files -and $item.Files.Count -gt 0) {
                $mdLines += '- Files:'
                foreach ($f in $item.Files) {
                    $mdLines += "  - $f"
                }
            }
            $mdLines += ''
        }

        $mdLines -join "`r`n" | Set-Content -LiteralPath $reportMd -Encoding utf8

        Write-Host ''
        Write-Host 'Report written to:'
        Write-Host "  $reportMd"
        Write-Host 'You can now add it to any CoBus / Co1 notice as needed.'
    }
}
catch {
    $errMsg = $_.Exception.Message
    Write-Warning ("Failed to write CoBus report markdown: {0}" -f $errMsg)
}
