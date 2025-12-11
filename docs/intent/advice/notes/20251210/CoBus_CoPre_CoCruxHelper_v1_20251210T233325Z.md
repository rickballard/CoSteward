# CoBus Notice – CoPre CoCrux helper seeded (v1)

- Date: 2025-12-10
- UTS: 20251210T233325Z
- Author: rick (via CoPre / CoModules DO Block)
- Lane: CoPre / CoCrux / CoAgent / CoSteward
- CoBloat heartbeat:
  - CU: OK
  - PU: SOFT
  - HU: SOFT
  - WT: SOFT

## What changed

- **CoPre repo (local only)**
  - Location: ~/Documents/GitHub/CoPre
  - Git status:
    - Initialized as a local git repo.
    - Active branch: copre-coagent-rick-shellpack-v1.
    - No remote configured yet (ickballard/CoPre does not exist).

- **CoCrux Top 50 placeholder**
  - Added:
    - docs/cocrux/CoCrux_Top50_v1_Placeholder.json
    - docs/cocrux/CoCrux_Top50_v1_Placeholder.md
  - The JSON contains 50 placeholder rule entries:
    - Number 1..50
    - Title = "CoCrux rule N placeholder"
    - Summary = "Placeholder summary for CoCrux rule N. Replace with canonical text from the CoCrux repo."
  - The Markdown file is a readable snapshot of these 50 entries, ready to be replaced by canonical CoCrux content later.

- **CoPre CoCrux batch helper**
  - Added script:
    - 	ools/Show-CoPreCoCruxBatch.ps1
  - Behavior:
    - Reads the placeholder JSON.
    - Maintains rolling state in:
      - .state/CoPre_CoCruxState.json
    - On each run, emits a batch of rules as markdown:
      - default -Count 3, configurable.
      - wraps around when it reaches rule 50.
    - Optional -CopyToClipboard pushes the batch to the clipboard for immediate paste into CoPre prompts.

- **Git hygiene**
  - .gitignore updated (or created) to exclude:
    - .state/ (local rotation state for CoCrux batches).
  - New commit recorded on copre-coagent-rick-shellpack-v1:
    - Message: copre: seed CoCrux Top50 placeholder and batch helper v1.

## How rick uses this right now

- Local ritual for CoPre pre-boot:
  - In PS7:
    - cd "C:\Users\Chris\Documents\GitHub\CoPre"
    - .\tools\Show-CoPreCoCruxBatch.ps1 -Count 3 -CopyToClipboard
  - Paste the markdown batch at the top of the CoPre prompt shell.
  - Then paste the CoAgent_Rick_InternalShellPack_v1 header/body under it.
- Effect:
  - Each CoPre run surfaces a small slice of the Top 50 CoCrux rules.
  - Over time, rick reviews all 50 repeatedly as part of CoSteward pre-boot.

## Why this matters for Co1

- CoPre is now a working **CoSteward-only pre-boot rail** with:
  - A concrete CoCrux integration pattern.
  - Local-only state and repo (no remote yet).
- Co1 should treat this as:
  - The current baseline for CoPre behavior for rick.
  - The pattern to reuse later when other CoStewards exist.

## Next steps (for Co1 / CoPrime awareness)

- Do not assume a public or shared CoPre repo yet:
  - CoPre is still local-only on rick's machine.
- When CoCrux canonical text is ready:
  - Replace the placeholder JSON/Markdown in this CoPre repo.
  - Keep the Show-CoPreCoCruxBatch.ps1 contract unchanged if possible.
- For each material CoPre behavior change:
  - Leave a new CoBus note like this in CoSteward:
    - Summarise:
      - CoPre files touched
      - Any changes to CoCrux batch behavior
      - Any new assumptions that CoAgent or CoSteward should honor.

