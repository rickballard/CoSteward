param(
  [string]$RepoSlug = "rickballard/CoSteward",
  [string]$TemplatePath
)
$ErrorActionPreference='Stop'
if(-not (Test-Path $TemplatePath)){ throw "Template not found: $TemplatePath" }
$json = Get-Content -Raw -LiteralPath $TemplatePath
$obj  = $json | ConvertFrom-Json

# Find existing by name/target
$existing = gh api "repos/$RepoSlug/rulesets" | ConvertFrom-Json |
  Where-Object { $_.target -eq $obj.target -and $_.name -eq $obj.name }

try{
  if($existing){
    $json | gh api -X PATCH "repos/$RepoSlug/rulesets/$($existing.id)" -H "Accept: application/vnd.github+json" --input - *> $null
    Write-Host "[OK] Updated ruleset '$($obj.name)' (id=$($existing.id))." -ForegroundColor Green
  } else {
    $created = $json | gh api -X POST "repos/$RepoSlug/rulesets" -H "Accept: application/vnd.github+json" --input - | ConvertFrom-Json
    Write-Host "[OK] Created ruleset '$($obj.name)' (id=$($created.id))." -ForegroundColor Green
  }
} catch {
  Write-Warning "Ruleset upsert failed. Dumping payload:"
  Write-Host $json
  throw
}
