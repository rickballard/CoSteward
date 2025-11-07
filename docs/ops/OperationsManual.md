# Operations Manual

## MegaWave Status / BPOE Heartbeat

**Signals**
- **CU%** (Context Utilization): estimated total tokens / window. Lead indicator.
- **PU%** (Payload Utilization): current working set (fresh paste/code).
- **HU%** (History Utilization): residue from earlier turns.
- **WT**  (Wait Time): CI/API lag; not tokens but affects pace.

**Tiers & Actions**
- **OK** <30% → continue
- **SOFT** 30–55% → warn_and_continue (prefer lighter pastes / CoSync split)
- **HARD** 55–85% → auto_rotate (fresh session/label + CoSync note)
- **FATAL** ≥85% → force_rotate (block heavy CoBlocks until rotation finishes)

**Emitters**
- Console one-liner (violet), dialogue Markdown line, and JSONL to \docs/intent/status/cobloat_YYYYMMDD.jsonl\ (CoCache).

### Rotation Logic (CoAgent & Dialogue)
- **SOFT (30–55%)**: recommend rotate; prefer smaller pastes; parallelize.
- **HARD (55–85%)**: auto-rotate to fresh session/label; write CoSync note; resume.
- **FATAL (≥85%)**: force-rotate; block heavy CoBlocks until rotation finishes.

**Status Bar (CoAgent)**: Show Tier badge, CU/PU/HU/WT, Headroom, “Rotate now”.
**Telemetry**: Append JSONL at \docs/intent/status/cobloat_YYYYMMDD.jsonl\ (CoCache).
