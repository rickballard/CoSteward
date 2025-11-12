param(
  [Parameter(Mandatory)][string]$SessionId,
  [Parameter(Mandatory)][string]$Summary,
  [string]$Tier = 'T2',
  [string[]]$TouchesRepos = @('CoSteward'),
  [string[]]$TouchesPaths = @('docs/ops/*','README.md','.github/workflows/*')
)
$ErrorActionPreference='Stop'
$utf8 = [Text.UTF8Encoding]::new($false)
$root = (git rev-parse --show-toplevel).Trim()
$dir  = Join-Path $root 'docs/intent/sessions' | Join-Path -ChildPath $SessionId
$mf   = Join-Path $dir 'manifest.json'
New-Item -ItemType Directory -Force $dir | Out-Null

# collision scan
$active = Get-ChildItem -Recurse -Filter manifest.json (Join-Path $root 'docs/intent/sessions') -EA SilentlyContinue |
  ForEach-Object { Get-Content -Raw $_.FullName | ConvertFrom-Json } |
  Where-Object { $_.status -eq 'active' -and $_.session_id -ne $SessionId }

$collisions = @()
foreach($s in $active){
  foreach($p in $TouchesPaths){
    if($s.touches | Where-Object { $_.repo -in $TouchesRepos -and ($_.paths -contains $p -or $_.paths -contains '*') }){
      $collisions += $s; break
    }
  }
}
if($collisions){ Write-Warning ("Potential intent overlap with: " + ($collisions.session_id -join ', ')) }

# write manifest
$branch = git branch --show-current
$prUrl  = (gh pr list --head $branch --json url -q '.[0].url' 2>$null)
$doc = [ordered]@{
  session_id    = $SessionId
  owner         = 'CoPrime'
  created_utc   = (Get-Date -AsUTC).ToString('yyyy-MM-ddTHH:mm:ssZ')
  status        = 'active'
  tier          = $Tier
  summary       = $Summary
  touches       = @(@{repo=$TouchesRepos[0]; paths=$TouchesPaths})
  bpoe_required = @('BPOE.CoSync.v1','BPOE.Receipts.v1','BPOE.CoBloat.v1','BPOE.MegaWave.v1')
  links         = @{ branch=$branch; pr=$prUrl }
}
[IO.File]::WriteAllText($mf, ($doc | ConvertTo-Json -Depth 6), $utf8)
Write-Host "[handshake] intent recorded → $mf"