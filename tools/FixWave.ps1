param(
  [string]$RepoSlug = "rickballard/CoSteward",
  [string[]]$Patterns = @(
    '^ci/nightly-costatus-','^docs/cosync-(mw2|receipt|closewave)-','^docs/sessionplan-'
  ),
  [switch]$Prune, [switch]$TagDirty, [switch]$ListRails
)

function Prune-Matching($path,$slug,[string[]]$pats){
  $rem = git -C $path ls-remote --heads origin 2>$null
  foreach($line in ($rem -split "`n" | ? { $_ })){
    if($line -match 'refs/heads/(?<b>[^\s]+)$'){ $b=$Matches.b
      if($pats | Where-Object { $b -match $_ }){
        try{ git -C $path push origin --delete $b 2>$null; Write-Host ("✓ pruned remote ${slug}:$b") -ForegroundColor Green }catch{}
      }
    }
  }
  $locals = git -C $path branch --list 2>$null -split "`n" | ? { $_ }
  foreach($ln in $locals){
    $b=($ln -replace '^\*?\s*','').Trim()
    if($b -and ($pats | Where-Object { $b -match $_ })){
      try{ git -C $path branch -D $b 2>$null; Write-Host ("✓ pruned local  ${slug}:$b") -ForegroundColor DarkGreen }catch{}
    }
  }
}

function Ensure-Repo($slug,$path){
  if(!(Test-Path $path)){ gh repo clone $slug $path 2>$null }
  git -C $path fetch origin *> $null
  try{ git -C $path switch main *> $null }catch{}
  git -C $path pull --ff-only *> $null
}

# Actions
$owner,$name = $RepoSlug.Split('/')
$path = "$HOME/Documents/GitHub/$name"; Ensure-Repo $RepoSlug $path

if($Prune){
  Prune-Matching $path $RepoSlug $Patterns
}

if($TagDirty){
  try{ gh label create "parked/needs-rebase" --repo $RepoSlug --color BFD4F2 --description "Blocked; needs rebase" 2>$null }catch{}
  $dirty = gh pr list --repo $RepoSlug --state open --json number,mergeStateStatus --jq '.[] | select(.mergeStateStatus=="DIRTY") | .number'
  if($dirty){
    foreach($n in ($dirty -split "`n" | ? { $_ })){
      try{ gh pr edit $n --repo $RepoSlug --add-label "parked/needs-rebase" }catch{}
    }
  }
}

if($ListRails){
  $pat = '^(ci/nightly-costatus-|docs/(cosync-(mw2|receipt|closewave)-|sessionplan-))'
  $json = gh pr list --repo $RepoSlug --state open --limit 50 --json number,headRefName,url,mergeStateStatus
  if($json){
    ($json | ConvertFrom-Json | Where-Object { $_.headRefName -match $pat }) |
      ForEach-Object { "{0} #{1}  {2}  {3}" -f $RepoSlug, $_.number, $_.mergeStateStatus, $_.url }
  }
}
