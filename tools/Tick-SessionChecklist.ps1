param(
  [Parameter(Mandatory, Position=0, ValueFromRemainingArguments=$true)]
  [string[]]$Items
)
$ErrorActionPreference = "Stop"

$plan = Get-ChildItem -Path "docs/intent/sessions/*/SessionPlan_*.md" -ErrorAction SilentlyContinue |
        Sort-Object LastWriteTime -Desc | Select-Object -First 1
if(-not $plan){ throw "No SessionPlan_*.md found." }

$content  = Get-Content -Raw -Path $plan.FullName
$origHash = (Get-FileHash -Algorithm SHA256 $plan.FullName).Hash

foreach($i in $Items){
  $pattern = '(?m)^\- \[ \] ' + [regex]::Escape($i)
  $new     = [regex]::Replace($content, $pattern, "- [x] $i", 1)
  if($new -eq $content){ Write-Warning ("No unchecked item starting with: " + $i) }
  $content = $new
}

Set-Content -Encoding utf8NoBOM -Path $plan.FullName -Value $content
$newHash = (Get-FileHash -Algorithm SHA256 $plan.FullName).Hash

if($newHash -ne $origHash){
  git add -- $plan.FullName
  git commit -m ("docs(session): tick checklist — " + ($Items -join ', ')) | Out-Null
  git push | Out-Null
  Write-Host ("Ticked & pushed: " + ($Items -join '; '))
} else {
  Write-Host "No checklist changes detected — nothing to commit."
}
