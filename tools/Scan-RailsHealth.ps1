param([string]$Seed = "$(Join-Path $PSScriptRoot '..\seeds\repos.txt')")

$repos = Get-Content $Seed | ? { $_ -and -not $_.StartsWith('#') }
$rows = foreach($r in $repos){
  $org,$name = $r -split '/'
  $local = Join-Path $HOME "Documents\GitHub\$name"
  if(!(Test-Path $local)){ gh repo clone $r $local | Out-Null }
  $wf = Join-Path $local '.github\workflows'
  $guard = Test-Path (Join-Path $wf 'guard-gib-org.yml')
  $sat   = Test-Path (Join-Path $wf 'gib-satellite.yml')
  $vio   = Test-Path (Join-Path $wf 'violet-receipts-summary.yml')

  $art = $null
  try {
    $q = '.artifacts[] | select(.name=="gib-satellite") | {updated_at,expired}'
    $json = gh api "repos/$r/actions/artifacts" --paginate -q $q 2>$null
    if($json){ $art = $json | ConvertFrom-Json | Sort-Object updated_at -Descending | Select-Object -First 1 }
  } catch {}

  [pscustomobject]@{
    Repo      = $r
    Guard     = $guard
    Satellite = $sat
    Violet    = $vio
    SatUpdated= $art.updated_at
    Expired   = $art.expired
  }
}

# Print as a compact markdown table for easy paste into Session Plan
$md = @()
$md += "| Repo | Guard | Satellite | Violet | SatUpdated (UTC) | Expired |"
$md += "|------|-------|-----------|--------|-------------------|---------|"
foreach($row in $rows){
  $md += "| {0} | {1} | {2} | {3} | {4} | {5} |" -f $row.Repo,$row.Guard,$row.Satellite,$row.Violet,$row.SatUpdated,$row.Expired
}
$md -join "`n"
