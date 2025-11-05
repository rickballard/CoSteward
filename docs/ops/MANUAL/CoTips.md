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
