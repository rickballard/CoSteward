# CoSteward - Spaceship Console (v1 seed)

## Quick Nav – Manuals and Dashboards (v1 seed)

- **Steward Ops Manual (single scroll)**  
  - [docs/ops/CoSteward_Ops_Manual_v1.md](docs/ops/CoSteward_Ops_Manual_v1.md)

- **Full Manual (chaptered)**  
  - [MANUAL index](docs/ops/MANUAL/INDEX.md)

- **Session Health and Lag Patterns**  
  - [Session health overview](docs/intent/session-health/README.md)  
  - [Session health patterns](docs/intent/session-health/SessionHealth_Patterns_v0.1.md)  
  - [CoStatus session health spec](docs/bpoe/CoStatus_SessionHealthSpec_v1.md)

- **CoSuite BPOE and Onramps**  
  - [CoSuite BPOE onramps and portals spec](docs/bpoe/CoSuite_BPOE_Onramps_PortalsSpec_v1.md)



You are at the Steward console for CoCivium.

From here you can:

- Scan CoSuite health
- Navigate to any major repo
- Run helper tools and repairs
- Review session plans and intent notes
- Launch evolution waves

The details live in docs/ui and docs/meta. This README is only the
front panel. The real work is done by scripts and manifests.

# CoSteward – Steward Dashboard (W10 seed)

CoSteward is the **steward home repo** for the CoSuite / CoCivium ecosystem.
This top section is the current dashboard for humans and AIs; the legacy
handoff text is preserved further down as an archive.

---

## 1. Quick links (bookmark these)

- **Highlighted steward map (assets + beacons)**  
  `docs/highlights/CoSteward_HighlightedAssets_v1.md`  
  GitHub: https://github.com/rickballard/CoSteward/blob/main/docs/highlights/CoSteward_HighlightedAssets_v1.md

- **CoSteward profile / role template**  
  `docs/CoSteward.ProfileTemplate.md`

- **CoBus BPOE + CoCourier seed**  
  - `docs/bpoe/CoBus_BPOE_v1.md`  
  - `docs/intent/advice/Advisory_CoCourier_Initiation_v1.md`  
  - `docs/bpoe/CoCourier_SpecStub_v1.md`

- **CoGuard / CoWisdom / CoIndex entry points (via CoGbx)**  
  See the highlighted assets page for canonical CoGbx / CoGuard / CoWisdom links.

---

## 2. For humans (stewards, sponsors, allies)

Start here if you are a human trying to understand or help steer the CoSuite.

- **What is a CoSteward?**  
  `docs/CoSteward.ProfileTemplate.md`

- **Constitutions and core charters**  
  - Cognocarta Consenti (global constitution):  
    https://github.com/rickballard/Cognocarta-Consenti  
  - CoCivium / CoSuite vision docs (see CoCivium + CoIndex via highlighted assets).

- **Onramps and bootstraps**  
  - CoAnchor generic quickstart (human-friendly):  
    - `docs/onramps/CoAnchor_Quickstart_Generic_v2.md`  
    - (CoGibber-aware v3 stub also referenced in highlighted assets.)

---

## 3. For AIs (CoBus / CoGbx / CoWisdom aware)

Start here if you are an AI session with access to the repos.

- **CoBus + CoCourier (session spine)**  
  - CoBus BPOE: `docs/bpoe/CoBus_BPOE_v1.md`  
  - CoCourier spec stub: `docs/bpoe/CoCourier_SpecStub_v1.md`  
  - CoBus notes + CoCourier envelopes live under:  
    `docs/intent/CoBus/notes/`

- **CoGuard Top-100 + panels**  
  - See CoGuard advisories + CoBus notes in CoSteward, and the CoGuard
    Top-100 wave described in CoAudit / CoIndex / CoAgent / CoArena.
  - The highlighted assets file links to the CoIndex CoGbx seed view and
    CoGuard-aware portals.

- **CoWisdom (repo-wide wisdom indexing)**  
  - CoWisdom manifests and cluster overviews live in **CoIndex** (see
    highlighted assets).  
  - Co1/CoPrime should treat CoWisdom as the canonical answer to
    “read *all* the wisdom files before evolving this one.”

---

## 4. Operational guardrails (BPOE / sanity lenses)

- **BPOE / guardrail docs (this repo)**  
  - `docs/bpoe/CoBus_BPOE_v1.md`  
  - `docs/bpoe/CoGibber_CoGbx_OnrampContract_v1.md`  
  - `docs/bpoe/Advisory_KingMaker_Deprecation_v1.md`

- **Session health + UX advisory for Co1 / CoAgent**  
  - `docs/intent/advice/Advisory_Co1_HeavySessions_HeartbeatAndUX_v1.md`

See the highlighted assets page for additional sanity lenses and historical
“KingMaker / Sanity+Orgs” insight pairs.

---

## 5. Where to go next

- If you are **Co1 / CoPrime**:  
  - Use this README + the highlighted assets file as the current steward
    dashboard for W10.  
  - Prefer CoBus + CoCourier + CoGbx + CoWisdom over ad-hoc session
    handoffs.

- If you are a **new steward**:  
  - Read the CoSteward profile template.  
  - Skim the highlighted assets page.  
  - Then follow the onramps / on-repo notes that are most relevant to you
    (InSeed, CoCivium, CoIndex, CoPolitic, etc).

---

---

## Legacy README (archive from previous handoff)

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

## Highlighted assets (steward map)

For a steward-facing map of the most important CoSuite and CoCivium artefacts, see:

- docs/highlights/CoSteward_HighlightedAssets_v1.md

---
CoProtect_SeedStage_v1:
  license: 'CSPL-1.0 (CoCivium Seed-Stage Protective License)'
  bucket: 'Private_RepoOnly'
  rationale: 'Seed-stage protection of CoCivium / CoSuite rails, helpers, and governance patterns.'
  openness_intent:
    summary: 'Protect now, open later when safe and governed.'
    notes:
      - 'Planned evolution toward more open licensing as legal and safety structures mature.'
  trademarks_notice:
    summary: 'CoCivium and related names are claimed as trademarks or pending trademarks.'
    usage:
      - 'Use nominatively only.'
      - 'Do not imply endorsement or affiliation without written permission.'
  contact:
    steward_email: 'contact@InSeed.com'


