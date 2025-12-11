# CoBus Notice - CoPre snapshot dropped as AdviceBomb (v1)

- Date: 2025-12-10
- UTS: 20251210T235926Z
- Author: rick (via CoPre_DropSnapshotAndBusNote_v1)
- Lane: CoPre / CoCrux / CoAgent / CoSteward
- CoBloat heartbeat:
  - CU: OK
  - PU: SOFT
  - HU: SOFT
  - WT: SOFT

## What was dropped

- Latest CoPre snapshot zip was found in Downloads and copied into the CoSteward advice inbox:
  - Source: C:\Users\Chris\Downloads\CoPre_Snapshot_20251210T233516Z.zip
  - Dest: advice/inbox/AdviceBomb_CoPre_Snapshot_20251210T235926Z.zip
- A SHA256 sidecar was created beside the AdviceBomb:
  - Hash: F4DE70758AEEF3E47F7B84D0766579CCE585FEC8517B74D18643C6C4E4C4A3F7
- INBOX_LOG entry appended:
  - - 2025-12-10T18:59:30.8830262-05:00 UTS=20251210T235926Z Kind=AdviceBomb_CoPre_Snapshot Path=advice\inbox\AdviceBomb_CoPre_Snapshot_20251210T235926Z.zip SHA256=F4DE70758AEEF3E47F7B84D0766579CCE585FEC8517B74D18643C6C4E4C4A3F7

## How to use (for Co1 and other lanes)

- Treat this AdviceBomb as the current local baseline for:
  - CoPre local placeholder repo
  - CoCrux Top 50 placeholder JSON and Markdown
  - Show-CoPreCoCruxBatch.ps1 helper
- When inspecting:
  - Start with the CoPre README and tools/Show-CoPreCoCruxBatch.ps1
  - Respect that CoPre is CoSteward-only and local-first for now.

## Notes

- CoPre still has no GitHub remote.
- Any material changes to CoPre behavior or CoCrux rotation should:
  - update the Advice inbox and INBOX_LOG, and
  - add a fresh CoBus note like this one.
