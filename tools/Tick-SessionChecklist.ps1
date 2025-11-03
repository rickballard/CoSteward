param([Parameter(Mandatory)][string[]]$Items)
Stop='Stop'

C:\Users\Chris\Documents\GitHub\CoSteward\docs\intent\sessions\20251103\SessionPlan_20251103-063650Z.md = Get-ChildItem 'docs/intent/sessions/*/SessionPlan_*.md' -ErrorAction SilentlyContinue |
        Sort-Object LastWriteTime -Desc | Select-Object -First 1
if(-not $plan){ throw 'No SessionPlan_*.md found.' }

$content = Get-Content $plan.FullName -Raw
foreach($i in $Items){
  $pattern = '(?m)^\- \[ \] ' + [regex]::Escape($i)
  $new = [regex]::Replace($content, $pattern, '- [x] ' + $i, 1)
  if($new -eq $content){ Write-Warning ('No unchecked item starting with: ' + $i) }
  $content = $new
}
Set-Content -Encoding utf8NoBOM $plan.FullName $content

git add $plan.FullName
git commit -m ('docs(session): tick checklist — ' + ($Items -join ', ')) | Out-Null
git push | Out-Null

Write-Host ('Ticked & pushed: ' + ($Items -join '; '))
