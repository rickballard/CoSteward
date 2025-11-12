# CoPrime Handoff — Co1 → Co1b
**UTC:** 20251112T182847Z

This bundle is a self-contained, repo‑first handoff package. Land it with a short branch + PR in **CoSteward** (primary) and optionally add a CoSync note pointer in **CoCache**.

## Landing (PowerShell)
```powershell
$ErrorActionPreference='Stop'
$CS = Join-Path $HOME 'Documents\GitHub\CoSteward'
$Tmp = Join-Path $env:TEMP 'handoff_tmp'
$Zip = "$HOME\Downloads\AdviceBomb_Handoff_CoPrime_Co1_to_Co1b_20251112T182847Z.zip"

if(-not (Test-Path $Zip)){ throw "Place the zip at: $Zip" }
if(Test-Path $Tmp){ Remove-Item $Tmp -Recurse -Force }
Expand-Archive -Path $Zip -DestinationPath $Tmp -Force

# 0) CoSync
pushd $CS; git switch main *> $null; git pull --ff-only *> $null; popd

# 1) Short branch + copy payload
$Br = "docs/handoff_coprime_20251112_20251112T182847Z"
pushd $CS; git switch -c $Br *> $null; popd
Copy-Item -Recurse -Force (Join-Path $Tmp '*') $CS

# 2) Commit + push + PR
pushd $CS
git add -A
git commit -m "docs(handoff): CoPrime Co1 → Co1b handoff + CoSync note + next‑intent"
git push -u origin $Br
gh pr create --title "CoPrime Handoff: Co1 → Co1b" --body "Adds handoff docs, CoSync note, and next‑intent checklist."
popd
```
