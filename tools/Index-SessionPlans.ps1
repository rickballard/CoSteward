param([string]$Seed = "$(Join-Path $PSScriptRoot '..\seeds\repos.txt')")

$ErrorActionPreference='Stop'
$repos = Get-Content $Seed | ? { $_ -and -not $_.StartsWith('#') }

$rows = foreach($r in $repos){
  $org,$name = $r -split '/'
  $root = Join-Path $HOME "Documents\GitHub\$name"
  if(!(Test-Path $root)){ continue }

  $plans = Get-ChildItem -Path (Join-Path $root 'docs\intent\sessions') -Recurse -Filter 'SessionPlan_*.md' -ErrorAction SilentlyContinue |
           Sort-Object LastWriteTime -Desc

  foreach($p in $plans){
    $rel = $p.FullName.Substring($root.Length+1).Replace('\','/')
    # Pull first 3 checklist lines as a preview
    $lines = (Get-Content $p.FullName -Raw) -split "`r?`n"
    $checks = $lines | ? { $_ -match '^- \[( |x)\] ' } | Select-Object -First 3 -Skip 0
    [pscustomobject]@{
      Repo   = $r
      File   = $rel
      Date   = ($p.LastWriteTimeUtc.ToString('yyyy-MM-ddTHH:mm:ssZ'))
      Checks = ($checks -join ' · ')
    }
  }
}

$md = @()
$md += "# Session Plans Index"
$md += ""
$md += "| Repo | Last Modified (UTC) | File | First Checks |"
$md += "|------|---------------------|------|--------------|"
foreach($row in ($rows | Sort-Object Repo, Date -Descending)){
  $md += "| {0} | {1} | {2} | {3} |" -f $row.Repo,$row.Date,$row.File,$row.Checks
}

$dest = Join-Path $PSScriptRoot '..\docs\intent\sessions\INDEX.md'
New-Item -ItemType Directory -Force (Split-Path $dest) | Out-Null
$md -join "`n" | Set-Content -Encoding utf8NoBOM $dest

git -C (Join-Path $PSScriptRoot '..') add $dest
git -C (Join-Path $PSScriptRoot '..') commit -m "docs(session): refresh consolidated Session Plans index" | Out-Null
git -C (Join-Path $PSScriptRoot '..') push | Out-Null

Write-Host "Updated docs/intent/sessions/INDEX.md"
