param(
  [string]$RepoSlug = 'rickballard/CoCivium'
)
$patterns = 'repo-quality','^yamllint$','PR labeler','lock-readme','name-pending'
$wfs = gh workflow list --repo $RepoSlug --json id,name,state,path | ConvertFrom-Json
foreach($wf in $wfs){
  if($patterns | Where-Object { $wf.name -match $_ }){
    if($wf.state -eq 'enabled' -or $wf.state -eq 'active'){
      gh workflow disable --repo $RepoSlug $wf.id | Out-Null
    }
  }
}
# Show final state
gh workflow list --repo $RepoSlug --json name,state,path |
  ConvertFrom-Json | ForEach-Object { "{0} — {1}" -f $_.name,$_.state }
