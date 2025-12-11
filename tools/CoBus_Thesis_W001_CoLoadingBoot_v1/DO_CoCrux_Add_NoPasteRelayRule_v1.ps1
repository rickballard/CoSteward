param(
    [string]$GhRoot     = "$HOME\Documents\GitHub",
    [string]$StewardRel = "CoSteward"
)

$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

$repo  = Join-Path $GhRoot $StewardRel
$file  = Join-Path $repo "docs\BPOE\CoCrux_Workflow_Rules.md"

if (-not (Test-Path (Join-Path $repo ".git"))) {
    throw "CoSteward repo not found at $repo"
}

if (-not (Test-Path $file)) {
    throw "CoCrux workflow rules file not found at $file"
}

$content = Get-Content -Raw -Path $file

if ($content -match "## 9\. CoBus, not humans, for cross-session relay") {
    "OK: CoBus relay rule already present; no change."
    return
}

$append = @"
## 9. CoBus, not humans, for cross-session relay

9.1 No paste-relay monkeys by default.
Cross-session messages between key agents (for example Co1, CoPrime,
CoSteward) must travel via CoBus notes and repos, not manual copy and
paste by humans, except in emergencies.

9.2 CoBus as the default transport.
When a session needs to update another session or agent it should:
- write a small CoBus note under
  CoSteward/docs/intent/advice/notes/YYYYMMDD/...; and
- reference that note from wave logs, CoSync notes, or tickets.

9.3 Emergencies and fallbacks.
If CoBus is unavailable or broken:
- a human may relay content manually once; and
- a follow-up task must be created to repair the CoBus path and
  backfill any missing notes as soon as practical.
"@

$new = $content.TrimEnd() + "`n`n" + $append.Trim() + "`n"

$new | Set-Content -Path $file -Encoding UTF8

Push-Location $repo
try {
    git add $file
    $ts = (Get-Date).ToUniversalTime().ToString("yyyyMMddTHHmmssZ")
    git commit -m ("docs(BPOE): add CoBus cross-session relay rule ({0})" -f $ts)
    git push
    "OK: CoBus relay rule appended to CoCrux workflow rules and pushed."
}
finally {
    Pop-Location
}
