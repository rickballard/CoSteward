param(
  [string]$RepoSlug = "rickballard/CoSteward",
  [string]$Branch   = "main",
  [int]$Approvals   = 1
)
$ErrorActionPreference='Stop'
# Require review from CODEOWNERS with N approvals; keep existing checks
$rule = gh api "repos/$RepoSlug/branches/$Branch/protection" | ConvertFrom-Json
$checks = $rule.required_status_checks.checks
$body = @{
  required_status_checks = @{
    strict = $rule.required_status_checks.strict
    checks = $checks
  }
  enforce_admins = $true
  required_pull_request_reviews = @{
    required_approving_review_count = $Approvals
    require_code_owner_reviews = $true
  }
  restrictions = $null
  allow_force_pushes = $false
  allow_deletions = $false
  block_creations = $false
  required_linear_history = $false
  require_conversation_resolution = $true
  required_signatures = $false
  required_commit_author_verification = $false
  lock_branch = $false
  allow_fork_syncing = $true
} | ConvertTo-Json -Depth 6
gh api -X PUT "repos/$RepoSlug/branches/$Branch/protection" `
  -H "Accept: application/vnd.github+json" `
  -f "required_status_checks=$($body | ConvertFrom-Json | Select-Object -Expand required_status_checks | ConvertTo-Json -Compress)" `
  -f enforce_admins=true `
  -f "required_pull_request_reviews=$($body | ConvertFrom-Json | Select-Object -Expand required_pull_request_reviews | ConvertTo-Json -Compress)" `
  -F restrictions= `
  -f allow_force_pushes=false `
  -f allow_deletions=false `
  -f block_creations=false `
  -f required_linear_history=false `
  -f require_conversation_resolution=true `
  -f required_signatures=false `
  -f required_commit_author_verification=false `
  -f lock_branch=false `
  -f allow_fork_syncing=true | Out-Null
Write-Host "[OK] Team mode enabled: approvals=$Approvals; CODEOWNERS required."
