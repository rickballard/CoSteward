# CoSuite BPOE: Megazip CoPingPong Workflow

_Last updated: 20251113T235848Z (UTC seed)_

This page defines the **default, BPOE-grade workflow** for driving CoSuite work
from repos using **megazips + CoBlocks + CoPingPong** between CoPrime (AI) and
the human CoSteward.

It is intended as operational guidance for CoStewards and for any
**CoAgent-commercial** integration that wishes to “drive from repo” with
minimal human finger-work.

---

## 1. Core Ideas

1. **Repo is source of truth**
   - All intent, helpers, and BPOE defaults live on GitHub repos.
   - Sessions consume from repos; they don’t rely on in-session memory.

2. **Megazip per MegaWave**
   - Each “wave” of work is packaged as a **single zip**:
     - docs, scripts, snippets, and CoBlocks.
   - One zip → one PS7 CoBlock → one CoPingPong cycle.

3. **CoBlocks only, no hand-typing**
   - Humans paste a complete CoBlock into PS7.
   - CoBlock:
     - verifies paths and preconditions,
     - unzips into the correct repo(s),
     - runs any safe helper scripts,
     - stages/commits/pushes where appropriate.

4. **Minimal CoPong**
   - Preferred human response after a CoBlock completes:
     - either paste the PS7 transcript tail, **or**
     - just type a single . in the chat to indicate
       “CoBlock ran, no visible errors; continue”.

5. **CoPrime as the only driver**
   - CoPrime session coordinates all CoBlocks across AIs.
   - Other sessions are “back seat devs” that propose work, but
     **only CoPrime** (or its delegated operator) fires official megazips.

---

## 2. Standard Cycle (One MegaWave)

Each MegaWave should follow this pattern.

### 2.1 Plan (CoPrime, on repo)

Update a short plan/checklist on repo, not in-session, for example:

- CoSteward/docs/intent/advice/notes/YYYYMMDD/CoPrime_MegaWave_<id>.md

Include:

- scope for this wave,
- target repos and branches,
- any BPOE changes being trialed.

### 2.2 Assemble Megazip (AI side)

AI prepares a zip with:

- new/updated .md docs,
- scripts / CoBlocks (PS7),
- README snippet(s) for relevant repos,
- pointers for CoSync/CoStatus/CoPing dashboards.

Name pattern (example):

- CoSuite_MegaWave_<topic>_<UTCSTAMP>.zip

### 2.3 Deliver Megazip + CoBlock (AI → Human)

AI provides:

- a download link to the zip,
- a single **CoBlock** that:
  - checks the zip in ~/Downloads,
  - unzips into the right repo roots,
  - runs safe install/update steps,
  - commits + pushes on appropriate branches.

### 2.4 Run CoBlock (Human)

Human:

- downloads the zip (if not already),
- opens PS7 at any repo root or neutral path,
- pastes and runs the CoBlock as-is,
- waits for completion.

### 2.5 CoPong (Human → AI)

If no errors:

- type . in chat _or_
- paste the tail of the PS7 output if interesting.

If errors:

- paste the failing lines from PS7 and the error message.

### 2.6 Verify & Log (AI)

AI:

- verifies expected files/paths exist (via repo-reading in later waves),
- updates any relevant dashboards,
- appends to INBOX_LOG.md if AdviceBombs are involved,
- suggests the next MegaWave needed.

---

## 3. Defaults for CoCacheGlobal and CoAgent

These defaults are assumed unless explicitly overridden.

### 3.1 CoCacheGlobal

- Purpose: mythos + coordination hub for CoCivia and CoCacheGlobal-aware AIs.
- Key paths:
  - docs/CoCivia/Home.md
  - docs/CoCivia/README_CoCiviaSnippet.md
- Expected usage:
  - Other repos (CoCivium, CoSteward, CoAgent, etc.) refer to CoCivia home here.
  - Future: status/log JSONL, CoPing/CoSync Bus mirrors, and global coordination.

### 3.2 CoAgent

- Purpose: vendor-agnostic CoAgent middleware product.
- Branding paths:
  - docs/branding/CoAgent_Logo_Usage.md
  - docs/branding/README_CoAgentLogoSnippet.md
- Expected usage:
  - CoAgent README, website, and marketing assets pull branding rules from here.
  - CoAgent UI eventually uses the same logos/avatars defined here.

---

## 4. Relationship to CoPing / CoPong

- **Co1 (CoPrime)** owns the canonical CoPing/CoPong schema.
- This BPOE page:
  - **does not** redefine that schema,
  - assumes CoPing/CoPong lines already exist and are stable,
  - treats them as the backbone trace for:
    - CoSync Bus visibility,
    - CoCacheGlobal heartbeats,
    - CoAudit traces.

Other sessions:

- may **advise** Co1 via docs/intent/advice/notes/,
- must not mutate the schema directly.

---

## 5. CoStatus / CoPing Expectations

Every committed BPOE change that materially alters workflows should be reflected in:

1. A CoPing / CoStatus line somewhere visible, such as:
   - PS7 status output,
   - CoAgent status panel,
   - CoSteward products or ops dashboards.

2. That line should carry at least:
   - CU/PU/HU/WT tiers,
   - current MegaWave id,
   - approximate drift index,
   - short focus note.

Example (conceptual only):

> CoPing: [MW 2/10/12 | drift: ▯▯▯▯▯ (-8)] [CU:● SOFT PU:● SOFT HU:● SOFT WT:● SOFT ] [Session:CoPrime20251112] [Note:docs/intent/advice/notes/20251113/CoSync_20251113T191106Z.md] [Zip:CoPrime20251112_MW2_CoSyncBus_Megazip.zip] [SHA256:…]

This ops page does not constrain the exact glyphs; that remains Co1’s domain.

---

## 6. Training & Onboarding Notes

For new CoStewards:

- Read this page alongside:
  - CoSteward product/ops dashboards,
  - CoAgent README + productization manifest,
  - CoCacheGlobal docs/CoCivia/Home.md.

Practice at least **one full MegaWave**:

1. Download a megazip.
2. Run its CoBlock in PS7.
3. Inspect git status / git log for each target repo.
4. Confirm dashboards and CoPing/CoStatus outputs updated as expected.

Once this workflow feels natural, CoAgent-commercial can safely automate most of it.

---
