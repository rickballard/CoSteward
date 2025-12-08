# CoBus Notice – Co1 Session Rescue Tools Seed (v1)

Generated: 20251208T154345Z
Repo: C:\Users\Chris\Documents\GitHub\CoSteward

## Summary

Signal to Co1 that CoSteward now carries a v1 pattern for:

- session rescue
- attachments manifests
- CoReload runner
- Session purge preparation helper

This notice points at:

- Co1 advisory markdown
- CoSteward PR #214 (session rescue tools seed)
- CoSteward PR #213 (BPOE v2 delta pack host branch)

## Pointers

- Advisory file for Co1:
  - docs/intent/advice/notes/20251208/CoSync_Co1_SessionRescueTools_Advisory_v1_20251208T105834Z.md

- PR #214: BPOE: session rescue + reload tools seed  
  - https://github.com/rickballard/CoSteward/pull/214

- PR #213: BPOE v2 delta pack  
  - https://github.com/rickballard/CoSteward/pull/213

## Intended consumer

- Primary: Co1 / CoPrime orchestrator
- Secondary: any CoBus scanner that tracks session hygiene and reload rails

## Hints for Co1

- Treat PR #214 as v1 seed for:
  - tools/CoReload/CoReloadRunner_v1.ps1
  - docs/intent/attachments/CoAttachments_Manifest_20251208T063828Z.md
  - docs/intent/reload/CoReload_Attachments_Index_v1.md
  - tools/CoSteward_SessionPurgePrep_v1.ps1

- Use the advisory at:
  - docs/intent/advice/notes/20251208/CoSync_Co1_SessionRescueTools_Advisory_v1_20251208T105834Z.md
  as the human readable guide for:
  - snapshot schema
  - cross repo alignment via CoCache and CoIndex
  - CoBloat aware session rotation and rescue policy

## Routing

- Channel: CoBus notices in CoSteward
- Action for Co1:
  - On next CoSync, scan CoBus notices
  - Pick up this notice plus the advisory
  - Review and merge PR #214 or request follow up PRs
