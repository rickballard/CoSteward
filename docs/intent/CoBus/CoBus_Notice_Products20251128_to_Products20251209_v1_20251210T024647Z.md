# CoBus Notice: Products20251128 handoff to Products20251209

- From session: Products20251128  (stalled, to be retired)
- To session:   Products20251209  (fresh, to continue product work)
- Repo: CoSteward
- Timestamp (UTS): 20251210T024647Z

## 1. Branch and BPOE rails

Active branch at handoff:

- Branch: \eat/CoTabBoot_OperationsManual_v1_20251209T180803Z\
- Remote updated: yes (git push run immediately before this notice)

Key BPOE rails landed on this branch:

- \docs/bpoe/CoVibe_BPOE_v1.md\
  - CoVibe and CoTense defaults for humans.
  - Special case for rick: fast, direct CoSprint replies with minimal training overhead.
  - Name convention: use \ick\ (lowercase) in BPOE docs, prompts, and rails.
  - Rule: no megazip for a human without a matching CoBlock (PS7 DO block) in the same wave.

- \docs/bpoe/CoSweep_Embedding_In_CoSteward_BPOE_v1.md\
  - CoSweep placement inside CoSteward BPOE.
  - CoSweep must respect CoVibe defaults and rick naming.
  - CoSweep megazip + CoBlock pairing rules:
    - CoSweep waves that produce a megazip must include a CoBlock that:
      - Assumes zip in Downloads by default.
      - Knows where to expand or stash it in repo or vault.
      - Is safe to re run.

These two files are now the front end rails for tone, tense, and megazip behavior.

## 2. BPOE MegaWave pack (first snapshot)

First BPOE pack has been created and stashed from this session:

- Stash root:
  - \docs/intent/packs/BPOE/CoSteward_BPOE_MegaWave_v1_20251210T010346Z/\

Contents include:

- \CoVibe_BPOE_v1.md\
- \CoSweep_Embedding_In_CoSteward_BPOE_v1.md\
- \CoSweep_Header_Templates_v1.md\
- \CoSweep_Protocol_Core_v1.md\
- \Workflow_Codification_ScanPlan_v1.md\

This pack is the first BPOE MegaWave snapshot for CoSteward.
Future BPOE packs should follow the same pattern.

## 3. Session rescue and megazip tools

This session also evolved the session rescue and megazip rails:

- \	ools/CoSteward_SessionRescue_FromMnt.ps1\ (v2.3)
  - Scans \C:\mnt\ for \.md\, \.txt\, \.zip\, \.json\.
  - Copies them into:
    - \docs/session-offload/rescued/<UTS>/...\
  - Uses array safe candidate handling.
  - Works from script or from interactive PS7 with a safe repoRoot fallback.

- \CoSessionRescue_MegaWave_v1\ DO pattern (run in this session)
  - Runs \CoSteward_SessionRescue_FromMnt.ps1\.
  - Finds latest rescued batch under \docs/session-offload/rescued\.
  - Builds a megazip in Downloads:
    - \CoSessionRescue_MegaWave_v1_<UTS>.zip\.

These tools mean that future sessions can rescue stranded \C:\mnt\ artefacts into CoSteward and then ship a single megazip plus CoBlock.

## 4. BPOE MegaWave pack zip and stash CoBlock

In this session:

- A BPOE megazip was created in Downloads:
  - \CoSteward_BPOE_MegaWave_v1_20251210T004223Z.zip\.
- The stash CoBlock \CoSteward_Stash_BPOE_MegaWave_v1_UTS\ was run:
  - Found the latest BPOE megapack zip in Downloads.
  - Expanded it into:
    - \docs/intent/packs/BPOE/CoSteward_BPOE_MegaWave_v1_20251210T010346Z\.

This pair operationalises the CoVibe rule:
- No megazip without a matching CoBlock in the same wave.

## 5. Advice and products notes from this session

Untracked but created by this session (paths for Products20251209 to adopt and commit):

- Advice / CoAwe cluster:
  - \dvice/inbox/CoAwe/\   (CoAwe inbox assets)
  - \docs/intent/advice/notes/20251209/CoAwe_CoTheoryOfEvolution_OVERVIEW_v1_20251210T004302Z.md\
  - \docs/intent/advice/notes/20251209/CoSync_CoAwe_CoTheoryOfEvolution_v1_20251210T003848Z.md\
  - \docs/intent/advice/notes/20251209/CoRetro_MinedDeleted_Index_v1_20251209T233804Z.md\

- Products handoff note (already created but not yet committed at the time of this notice):
  - \docs/intent/advice/notes/20251209/CoSync_Products20251128_to_Products20251209_v1_20251210T003915Z.md\

- Product rails root stub:
  - \docs/intent/products/\  (directory created for future product rails)

Products20251209 should:

- Review these files.
- Decide whether to commit them as is or evolve them.
- Ensure \dvice/INBOX_LOG.md\ is updated as per BPOE once CoAwe items are formalised as AdviceBombs or inbox items.

## 6. How Products20251209 should start

Recommended first steps for Products20251209:

1. CoSync on CoSteward:

   - \git switch main\
   - \git pull --ff-only\
   - \git fetch\
   - \git switch feat/CoTabBoot_OperationsManual_v1_20251209T180803Z\ (or equivalent head branch for these rails).

2. Read BPOE rails:

   - \docs/bpoe/CoVibe_BPOE_v1.md\
   - \docs/bpoe/CoSweep_Embedding_In_CoSteward_BPOE_v1.md\

3. Inspect the first BPOE pack:

   - \docs/intent/packs/BPOE/CoSteward_BPOE_MegaWave_v1_20251210T010346Z\

4. Inspect advice and product notes:

   - \docs/intent/advice/notes/20251209/CoSync_Products20251128_to_Products20251209_v1_20251210T003915Z.md\
   - \docs/intent/advice/notes/20251209/CoAwe_CoTheoryOfEvolution_OVERVIEW_v1_20251210T004302Z.md\
   - \docs/intent/advice/notes/20251209/CoSync_CoAwe_CoTheoryOfEvolution_v1_20251210T003848Z.md\
   - \docs/intent/advice/notes/20251209/CoRetro_MinedDeleted_Index_v1_20251209T233804Z.md\
   - \docs/intent/products/\ contents once they exist.

5. Commit hygiene:

   - Stage and commit the advice and products files once reviewed.
   - Update \dvice/INBOX_LOG.md\ to record any AdviceBombs or inbox events tied to this handoff.

## 7. Session retirement note

- Session label: Products20251128
- Reason for retirement: platform lag and stalls.
- Status: work has been lifted to CoSteward repo via:
  - BPOE rails commits.
  - BPOE pack stash.
  - Advice and CoAwe notes.
  - Products handoff notes.

Future product work should proceed from:

- Session: Products20251209
- Repo rails: this CoBus notice, CoVibe BPOE, CoSweep BPOE, and the BPOE pack snapshot.

