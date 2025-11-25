# CoSuite BPOE — CoBadLand Fallback for MegaWave Artifacts (v1)

- **Status:** draft / v1
- **Owner:** CoSteward
- **Context:** When chat/sandbox environments cannot reliably host or serve
  downloadable artifacts (zips), but we still want to respect the MegaWave pattern.

## 1. Definition — "CoBadLand" (env state)

For the CoSuite, **CoBadLand** describes any environment where:

- Download links for wave artifacts (e.g. \MW_*.zip\) are **unreliable**:
  - links expire too quickly,
  - downloads intermittently 404,
  - or sandbox resets before the human can fetch the file.
- The environment otherwise still allows:
  - inline text,
  - paste-safe PS7 CoBlocks,
  - and normal repo-based workflows.

In CoBadLand, **repos + PS7 remain canonical**, and hosted zips are treated as
an *optional* convenience, not a hard requirement.

## 2. MegaWave expectations in normal land vs CoBadLand

### 2.1 Normal (healthy) environment

A non-trivial MegaWave should aim to ship:

1. **Wave artifact**  
   - A downloadable zip: \MW_<Mission>_<UTS>.zip\
   - Contains PS7 runner(s), helper scripts, docs, receipts.
   - SHA256 printed in the CoBlock.

2. **CoBlock**  
   - Paste-safe PS7 that:
     - creates a staging directory (usually under \~/Documents/GitHub\ or \~/Downloads/CoTemp\),
     - writes scripts/docs,
     - builds the megazip,
     - prints location + SHA256,
     - prints a CoPing line (CU/PU/HU/WT + [Mission]).

### 2.2 CoBadLand fallback

In CoBadLand, we **relax the zip requirement** but keep the spirit:

- **Required:**
  - At least one paste-safe **CoBlock** that:
    - creates the files that would have been inside the zip (scripts, docs, manifests),
    - leaves clear CoPing receipts (what this wave did; where).
  - A short inline **wave manifest** (in chat and/or docs) that plays the role of
    the zip README.

- **Optional / best-effort:**
  - A hosted zip or other downloadable artifact, **if** the environment happens
    to support it reliably.

MegaWave is still MegaWave if:

- The CoBlock + manifest are sufficient to **recreate** the intended payload,
- And at least one repo is ready to receive the resulting scripts/docs via branch + PR.

## 3. Behaviour for AI assistants in CoBadLand

When the assistant detects CoBadLand patterns (e.g. repeated expired links,
404s, or sandbox resets):

1. **Stop insisting on zips as the primary artifact.**
2. **Switch to runner-first**:
   - Provide a single, well-structured CoBlock that writes all needed files.
3. **Explicitly label the wave as a CoBadLand fallback**:
   - in the CoBlock comments,
   - and in any session BPOE or CoSync notes.
4. **Encourage the human to commit the resulting docs**:
   - e.g. BPOE addenda, session plans, linkage notes,
   - so that future sessions don’t rely on fragile sandboxes.

## 4. Recommended docs for CoBadLand references

When documenting a CoBadLand wave, refer to:

- \CoSteward/docs/ops/MegaWave/CoSuite_BPOE_MegaWavePattern_v1.md\
- \CoSteward/docs/ops/MegaWave/CoSuite_BPOE_AIEntry_v1.md\
- This note: \CoSteward/docs/ops/MegaWave/CoSuite_BPOE_CoBadLandFallback_v1.md\

and, if present, the **CoAnchor Quickstart** used to bootstrap the session.

## 5. Minimal checklist for a valid CoBadLand wave

A CoBadLand wave is considered **valid** if:

- [x] A paste-safe CoBlock is provided that can recreate all needed artifacts.
- [x] A short wave manifest is present (in chat and/or docs).
- [x] A branch name and intended target repo are clearly stated.
- [x] The human can run the CoBlock and open a PR without needing any zip.

If zips later become reliable again, the same pattern can be upgraded back to
full MegaWave (runner + zip) without changing the BPOE guarantees.

