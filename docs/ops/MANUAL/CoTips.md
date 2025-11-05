# CoTips (Repo-first)

This page collects small, enforceable practices for CoStewards who work **directly with repos** (without a containerizer like CoAgent). Keep entries short, testable, and repo-first.

> **Scope of this PR:** placeholder + link only. Deep content will be added in subsequent PRs.

## Open Topics Queue
1. Here-strings & ticks in CoPingPong — prefer emitted files over giant DO blocks.
2. Megazip (BPOE default for speed) — one datestamped zip to Downloads + tiny DO; promote via PR.
3. Downloadables policy — timestamped, SHA-256, disposable; repo is source of truth.
4. Violet receipt usage — optional if PR/CI green.
5. Session hygiene — `git switch main && git pull --ff-only`; idempotent DO; leave a trail.
---
## CoTip: Here-strings & Backticks (PowerShell) {#cotips-here-strings}

**Problem:** chat UIs mangle escaping; giant DO blocks with backticks/here-strings get corrupted.

**BPOE Pattern**
1. **Emit files, not escape puzzles.** Write .ps1/.json/.yml files directly; keep the chat DO block tiny and only *move/verify/apply* those files.
2. **Literal paths, no Join-Path arrays** inside code you paste.
3. **Idempotence:** scripts must re-run safely; print what changed.
4. **Verification-first:** after writing files, run repo helpers (e.g., dvice/inbox/.CoVerify.ps1) instead of embedding long inline checks.

**Tiny DO skeleton**
~~~powershell
 = "C:\Users\Chris\Documents\GitHub\CoCache"
 = Join-Path  "tools/Example-Task.ps1"
@'
param([string])
Write-Host "Example ran with: "
'@ | Set-Content -Encoding UTF8 
git -C  add "tools/Example-Task.ps1"
# keep execution in a separate, short DO block:
# & "C:\Users\Chris\Documents\GitHub\CoCache\tools\Example-Task.ps1" -Arg "demo"
~~~
---
## CoTip: Megazip (BPOE default for speed) {#cotips-megazip}

**Intent:** When an AI would otherwise drip 10–50 helpers, ship **one** datestamped zip to **Downloads**, and a short DO block to verify + apply. All durable work must land in repo via PR.

**Requirements**
- **Filename:** AdviceBomb_<topic>_<UTCSTAMP>.zip
- **Sidecar:** Write a .sha256 next to the zip.
- **Receipt:** Append a row to CoCache/advice/inbox/INBOX_LOG.md when promoted to repo.
- **Disposable:** Downloads are temporary; **repo is source of truth**.

**Operator DO (user side)**
~~~powershell
  = "C:\Users\Chris\Downloads"
 = Join-Path  'AdviceBomb_<topic>_<UTCSTAMP>.zip'
 = '<sha256-from-session>'

# 1) Verify
 = (Get-FileHash -Algorithm SHA256 ).Hash.ToLower()
if( -ne ){ throw "SHA mismatch." }

# 2) Unpack/apply per instructions, then run repo helpers (e.g., advice/inbox/.CoVerify.ps1)
~~~
---
## CoTip: Downloadables Policy (Timestamped, Hashed, Disposable) {#cotips-downloadables}

**Rules**
1. **Datestamp everything**: YYYYMMDD_HHMMSSZ in filenames.
2. **Hash everything**: produce or record **SHA-256** for each download.
3. **Repo-or-bust**: promote artifacts into repo **only via PR**; downloads are cleanable temp state.
4. **Trail**: when a download is promoted (e.g., AdviceBomb), write .sha256 and append to dvice/inbox/INBOX_LOG.md.
5. **No memory reliance**: never depend on chat/session memory; re-pull from repo and verify.

**Checklist**
- [ ] Timestamp in filename
- [ ] SHA-256 verified
- [ ] Promotion via PR only
- [ ] INBOX_LOG row (if applicable)
- [ ] CoSync note with pointers
---
## CoTip: Robust Branch & gh Context {#cotips-branch-gh}
**Why:** Avoids null/trim errors and "gh: not a git repo" when creating PRs.

**Pattern**
1. **Branch existence check** via ev-parse --verify --quiet.
2. **Switch safely**: git switch <branch> or -c if missing.
3. **gh context**: Push-Location into repo before gh pr list/create.

~~~powershell
# Exists?
C:\Users\Chris\Documents\GitHub\CoSteward = "C:\Users\Chris\Documents\GitHub/CoSteward"
docs/cotips-extras   = "docs/example"
 = git -C C:\Users\Chris\Documents\GitHub\CoSteward rev-parse --verify --quiet docs/cotips-extras
if(0 -eq 0){ git -C C:\Users\Chris\Documents\GitHub\CoSteward switch docs/cotips-extras } else { git -C C:\Users\Chris\Documents\GitHub\CoSteward switch -c docs/cotips-extras }

# gh in repo context
Push-Location C:\Users\Chris\Documents\GitHub\CoSteward
try{
  https://github.com/rickballard/CoSteward/pull/72 = gh -R rickballard/CoSteward pr list --head docs/cotips-extras --json url --jq '.[0].url'
  if([string]::IsNullOrWhiteSpace(https://github.com/rickballard/CoSteward/pull/72)){
    https://github.com/rickballard/CoSteward/pull/72 = gh -R rickballard/CoSteward pr create --head docs/cotips-extras --base main --title "demo" --body "demo"
  }
} finally { Pop-Location }
~~~
---
## CoTip: Labels & Line-Endings (No Foot-guns) {#cotips-labels-eol}
**Labels**
- Pre-create labels you rely on (e.g., docs, ops, session) to prevent PR creation failures.
- Pattern: query → create if missing (idempotent).

**Line endings**
- CRLF↔LF warnings are harmless; prefer repo policy via .gitattributes or core.autocrlf.

~~~powershell
# Ensure labels exist (idempotent)
rickballard/CoSteward = "rickballard/CoSteward"
 = @(
  @{name='docs';    color='6f42c1'; desc='Documentation'},
  @{name='ops';     color='0e8a16'; desc='Operational change'},
  @{name='session'; color='0366d6'; desc='Session-related'}
)
foreach(System.Collections.Hashtable in ){
  try{
     = gh -R rickballard/CoSteward label list --json name --jq (".[] | select(.name==""session"") | .name")
    if(-not ){ gh -R rickballard/CoSteward label create System.Collections.Hashtable.name --color 0366d6 --description Session-related | Out-Null }
  } catch {}
}

# Optional EOL policy
git -C C:\Users\Chris\Documents\GitHub\CoSteward config core.autocrlf true     # Windows-friendly
# or add a .gitattributes entry:  *.md text eol=lf
~~~
