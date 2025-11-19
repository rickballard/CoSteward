# Co1 Session Wrap  -  CoCivium Branch Protection + Backlog Intake
**UTC:** 2025-11-19 03:23:21Z  
**Session Label:** CoPrime20251118

## What we did
- Normalized branch protection on `rickballard/CoCivium` main:
  - Required checks: `safety-gate/gate`, `readme-smoke/check`
  - Enforced admins, linear history, conversation resolution
- Landed idea/backlog docs via PR and fixed README cache-buster.
- Disabled noisy advisory workflows (kept minimal required gates).
- Added canonical script: `scripts/ops/SetBranchProtection.ps1`.
- Created (or attempted) operations doc: `docs/ops/BRANCH_PROTECTION.md`.

## Why
- Keep PR flow fast and safe (hard gates minimal; other linters advisory).
- Make the policy re-applicable with a single PS7 command.

## How to reapply policy (from any machine with gh CLI auth)
```powershell
# Apply minimal required checks + flags
scripts\ops\SetBranchProtection.ps1
```
If running without repo context:
```powershell
# Inline minimal payload (no files needed)
$owner='rickballard'; $repo='CoCivium'; $branch='main'
$required=@('safety-gate/gate','readme-smoke/check')
$payload=@{ required_status_checks=@{ strict=$false; checks=$required | % {@{context=$_}} }
  enforce_admins=$true; required_pull_request_reviews=$null; restrictions=$null;
  required_linear_history=$true; allow_force_pushes=$false; allow_deletions=$false;
  block_creations=$false; required_conversation_resolution=$true } | ConvertTo-Json -Depth 6
$tmp=New-TemporaryFile; [IO.File]::WriteAllText($tmp,$payload,[Text.UTF8Encoding]::new($false))
gh api -X PUT "repos/$owner/$repo/branches/$branch/protection" --input $tmp; Remove-Item $tmp -Force
```

## Notes
- If CI noise returns, disable advisory workflows (`repo-quality`, `yamllint`, etc.).
- Only the two hard gates should block merges.

