# PowerShell pre-commit (advisory)
$changed = git diff --cached --name-only
if($changed -match '^docs/ops/|^README\.md'){
  Write-Host "[advice] Remember: manifest + receipt with CoBloat heartbeat." -ForegroundColor Yellow
}