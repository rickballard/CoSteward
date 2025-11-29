# CoStatus – Violet receipt pattern v1

Role:
- Give humans a single, ignorable-until-needed line per wave that carries:
  - session health metrics (CU, PU, HU, WT)
  - session + repo + branch context
  - blocks touched in the last wave
  - a short natural-language summary
- Keep PS7 execution history intact, but make it optional to read.

## 1. Shape of a violet receipt

Canonical example:

    [VIOLET][CU:OK][PU:SOFT][HU:SOFT][WT:OK][CoCivium] ◆ [CoPrime20251128][CoSteward][docs/products-ramp-w1-20251128T220541Z][S4,S5,S6] ◆ CoStart + CoStatus rails anchored; ready for PR; alarm=none.

Humans who are not technical can ignore the line unless:
- any CU/PU/HU/WT is HARD or FATAL, or
- the summary includes “alarm” or “warning”.

## 2. Relation to PS7 CoBlocks

- PS7 should still run full CoBlocks, with real output and errors.
- The violet receipt does NOT replace execution logs.
- At the end of the last CoPing block for a wave, the AI should:
  - call tools/CoStatus_CoPongHelper.ps1
  - emit exactly one violet receipt for that wave.

## 3. Sliding abstraction (for non-technical contributors)

For casual / non-technical humans:
- Chat focuses on:
  - why this wave matters,
  - what changed,
  - what’s next.
- CoStatus violet line:
  - acts like a badge / heartbeat,
  - is safe to ignore when all tags are OK/SOFT,
  - becomes “ask me to explain” when a tag is HARD/FATAL.

For stewards:
- They can ask “show recent CoStatus pulses” to see:
  - entries from docs/intent/CoStatus_Pulses_v1.md, and/or
  - recent CoPong receipts.

## 4. Helper script

Implementation lives at:

- tools/CoStatus_CoPongHelper.ps1

Example call from a CoPing block:

```powershell
& "$HOME\Documents\GitHub\CoSteward\tools\CoStatus_CoPongHelper.ps1" `
    -Session 'CoPrime20251128' `
    -Repo 'CoSteward' `
    -Branch 'docs/products-ramp-w1-20251128T220541Z' `
    -Blocks 'S4,S5,S6' `
    -LagFeel 'SOFT' `
    -Note 'CoStart + CoStatus rails anchored; ready for PR; alarm=none.'
5. Future evolution

Add optional CU/PU/HU/WT arguments to the helper when the metrics are plumbed.

Add simple ASCII “bar” hints if helpful, e.g.:

[CU:OK|==== ][PU:SOFT|=== ]

Align this pattern with:

docs/bpoe/CoStatus_SessionHealthSpec_v1.md

docs/intent/CoStatus_Pulses_v1.md

CoSessionRegistry and CoCron rails.