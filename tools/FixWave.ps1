param(
  [string[]]$RepoSlug = @("rickballard/CoSteward"),
  [string[]]$Patterns = @(
    '^ci/nightly-costatus-',
    '^docs/cosync-(mw2|receipt|closewave)-',
    '^docs/sessionplan-',
    '^bpoe/do-template-heartbeat-'
  ),
  [switch]$Prune,
  [switch]$TagDirty,
  [switch]$ListRails,
  [switch]$DryRun
)

function Ensure-Repo($slug,$path){
  if(!(Test-Path $path)){ gh repo clone $slug $path 2>$null }
  git -C $path fetch origin *> $null
  try{ git -C $path switch main *> $null }catch{}
  git -C $path pull --ff-only *> $null
}

function Prune-Matching($path,$slug,[string[]]$pats,[switch]$DryRun){
  $rem = git -C $path ls-remote --heads origin 2>$null
  foreach($line in ($rem -split "`n" | ? { $_ })){
    if($line -match "refs/heads/(?<b>[^\s]+)$"){
      $b=$Matches.b
      if($pats | Where-Object { $b -match $_ }){
        if($DryRun){ Write-Host ("[DRY] would prune remote {0}:{1}" -f $slug,$b) -ForegroundColor Yellow }
        else { try{ git -C $path push origin --delete $b 2>$null; Write-Host ("✓ pruned remote {0}:{1}" -f $slug,$b) -ForegroundColor Green }catch{} }
      }
    }
  }
  $locals = git -C $path branch --list 2>$null -split "`n" | ? { $_ }
  foreach($ln in $locals){
    $b=($ln -replace '^\*?\s*','').Trim()
    if($b -and ($pats | Where-Object { $b -match $_ })){
      if($DryRun){ Write-Host ("[DRY] would prune local  {0}:{1}" -f $slug,$b) -ForegroundColor DarkYellow }
      else { try{ git -C $path branch -D $b 2>$null; Write-Host ("✓ pruned local  {0}:{1}" -f $slug,$b) -ForegroundColor DarkGreen }catch{} }
    }
  }
}

# main
foreach($slug in $RepoSlug){
  $owner,$name = $slug.Split('/')
  $path = "$HOME\Documents\GitHub\$name"
  Ensure-Repo $slug $path

  if($Prune){ Prune-Matching $path $slug $Patterns $DryRun }

  if($TagDirty){
    try{ gh label create "parked/needs-rebase" --repo $slug --color BFD4F2 --description "Blocked; needs rebase" 2>$null }catch{}
    $dirty = gh pr list --repo $slug --state open --json number,mergeStateStatus --jq '.[] | select(.mergeStateStatus=="DIRTY") | .number'
    if($dirty){
      foreach($n in ($dirty -split "`n" | ? { $_ })){
        try{ gh pr edit $n --repo $slug --add-label "parked/needs-rebase" }catch{}
      }
      Write-Host ("Tagged DIRTY PRs in {0}: {1}" -f $slug, $dirty)
    } else {
      Write-Host ("No DIRTY PRs to tag in {0}." -f $slug)
    }
  }

  if($ListRails){
    $pat = '^(ci/nightly-costatus-|docs/(cosync-(mw2|receipt|closewave)-|sessionplan-)|bpoe/do-template-heartbeat-)'
    $json = gh pr list --repo $slug --state open --limit 50 --json number,headRefName,url,mergeStateStatus
    if($json){
      ($json | ConvertFrom-Json | ? { $_.headRefName -match $pat }) |
        % { "{0} #{1}  {2}  {3}" -f $slug, $_.number, $_.mergeStateStatus, $_.url } |
        Write-Output
    }
  }
}
