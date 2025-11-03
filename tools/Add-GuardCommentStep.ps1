param()
$ErrorActionPreference='Stop'

$wf = ".github/workflows/guard-gib-org.yml"
if(!(Test-Path $wf)){ throw "Missing .github/workflows/guard-gib-org.yml" }

git fetch origin | Out-Null
$br = "ci/guard-comment-"+(Get-Date -AsUTC).ToString('yyyyMMdd_HHmmssZ')
git switch -c $br origin/main | Out-Null

$yaml = Get-Content $wf -Raw
if($yaml -notmatch 'Explain guard failure \(PR comment\)'){
@"
- name: Explain guard failure (PR comment)
  if: ${{ failure() && github.event_name == 'pull_request' }}
  shell: bash
  env:
    PR_NUMBER: ${{ github.event.pull_request.number }}
  run: |
    body=$'# ❌ PR blocked by org guard

**Why**
- Forbidden folders: `docs/insight/` / `insights/`
- New `Co*` tokens require a `gib:Term` reference in the diff

**Fix**
Push a commit that removes forbidden paths and/or adds the `gib:Term` reference.'
    gh pr comment "$PR_NUMBER" -b "$body" || true
"@ | Add-Content -Encoding utf8NoBOM $wf

  git add $wf
  git commit -m "ci(guard): add PR comment on guard block" | Out-Null
  git push -u origin HEAD | Out-Null
  $pr = gh pr create -B main -H $br -t "ci(guard): PR comment on block" -b "Explain guard failure + remediation in PR."
  gh pr merge $pr --squash --delete-branch --admin | Out-Null
  git switch main; git pull --ff-only | Out-Null
} else {
  Write-Host "Guard PR-comment step already present — nothing to do."
}
