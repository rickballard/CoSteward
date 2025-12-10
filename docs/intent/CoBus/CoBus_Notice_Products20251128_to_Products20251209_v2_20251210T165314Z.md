# CoBus Notice v2: Products20251128 → Products20251209

- From session: Products20251128 (retiring; laggy)
- To session:   Products20251209 (active products lane)
- Repo: CoSteward
- Timestamp (UTS): 20251210T165314Z

This v2 notice supplements the earlier v1 CoBus handoff by locking the
Products MegaWave + CoStart rails and instance-level CoAwe notes onto repo.

## 1. Additional products + MegaWave assets

New files/directories created during late Products20251128 waves and now
handed to Products20251209:

- Inbox packs:
  - \dvice/inbox/BPOE_MegaWave/\
    - Inbox anchor for BPOE megawave-related AdviceBombs / packs.
  - \dvice/inbox/Products20251209_MegaWave_v2/\
    - Inbox anchor for Products20251209 MegaWave v2 (builder + packs).

- CoAwe instance notes:
  - \docs/intent/advice/notes/20251209/CoAwe_InstanceIndex_v1_20251210T023226Z.md\
    - Seed index of CoAwe instances (where CoAwe shows up by context).
  - \docs/intent/advice/notes/20251209/CoAwe_InstanceTodo_v1_20251210T023722Z.md\
    - TODO-style follow ups for CoAwe instance mining and linking.

- Retro mining notes:
  - \docs/intent/advice/notes/20251209/CoRetro_MinedDeleted_Index_v1_20251210T023045Z.md\
  - \docs/intent/advice/notes/20251210/CoRetro_MinedDeleted_Index_v1_20251210T160011Z.md\
    - Index + continuation for mined / deleted content (session retro).
    - Pointers for future CoRetro sweeps and safety checks.

- Products MegaWave builder + cleanup:
  - \docs/intent/advice/notes/20251209/CoSync_Products_MegaWaveBuilder_W6_v1_20251210T035109Z.md\
    - Notes + rails for Products MegaWave Builder W6.
  - \docs/intent/advice/notes/20251210/CoStart_SingleEntry_Cleanup_v1_20251210T134408Z.md\
    - Single-entry cleanup instructions for CoStart + Products flows.

- Scripts:
  - \scripts/CoStart_Launch.ps1\
    - Helper script to launch a standard CoStart / 4-panel OE for products.
  - \	ools/Products_MegaWave_W6.ps1\
    - Products MegaWave W6 builder tool (PS7 DO/CoBlock compatible).

Products20251209 should treat these as the starting rails for:

- Products MegaWave v2 (packs, inbox, and builder).
- CoStart single-entry cleanup and launch flows.
- CoAwe instance mining across products and GIBindex.
- Retro mining / safety sweeps for deleted / moved content.

## 2. Relationship to earlier handoff rails

Earlier v1 CoBus + BPOE rails include:

- \docs/bpoe/CoVibe_BPOE_v1.md\
- \docs/bpoe/CoSweep_Embedding_In_CoSteward_BPOE_v1.md\
- \docs/intent/advice/notes/20251209/CoSync_Products20251128_to_Products20251209_v1_20251210T003915Z.md\
- BPOE pack snapshot:
  - \docs/intent/packs/BPOE/CoSteward_BPOE_MegaWave_v1_20251210T010346Z/\

Together, v1 + v2 give Products20251209 enough rails to:

- Honour CoVibe + CoSweep BPOE defaults.
- Use CoStart_Launch + Products_MegaWave_W6 as the standard entry tools.
- Attach BPOE and Products megawaves to inbox anchors for later AdviceBombs.

## 3. How Products20251209 can proceed

Recommended first steps for Products20251209:

1. CoSync:
   - \git switch main\
   - \git pull --ff-only\
   - \git switch feat/CoAnchor_OE_Core\ (or the branch holding these rails).

2. Read:
   - \docs/intent/CoBus/CoBus_Notice_Products20251128_to_Products20251209_v1_*.md\
   - \docs/intent/CoBus/CoBus_Notice_Products20251128_to_Products20251209_v2_*.md\
   - \docs/bpoe/CoVibe_BPOE_v1.md\
   - \docs/bpoe/CoSweep_Embedding_In_CoSteward_BPOE_v1.md\

3. Inspect:
   - \dvice/inbox/BPOE_MegaWave/\
   - \dvice/inbox/Products20251209_MegaWave_v2/\
   - \docs/intent/advice/notes/2025120*/CoAwe_*.md\
   - \scripts/CoStart_Launch.ps1\
   - \	ools/Products_MegaWave_W6.ps1\

From there, Products20251209 can start building Products MegaWave W6/W7 packs,
attach AdviceBombs, and continue CoAwe / CoRetro work without depending on
any fragile session memory from Products20251128.
