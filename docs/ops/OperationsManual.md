# Operations Manual

## MegaWave Status / BPOE Heartbeat

**Signals**
- **CU%** (Context Utilization): estimated total tokens / window. Lead indicator.
- **PU%** (Payload Utilization): current set’s working set (your fresh paste/code).
- **HU%** (History Utilization): accumulated prior dialogue/tool traces.
- **WT** (Wait Time): external settle (CI indexing, API lag); not tokens but affects pace.

**Tiers & Actions**
- **OK** <30% → continue  
- **SOFT** 30–55% → warn_and_continue (prefer lighter pastes / CoSync split)  
- **HARD** 55–85% → auto_rotate (new session/label + CoSync note)  
- **FATAL** ≥85% → force_rotate (block heavy CoBlocks until rotation finishes)

**Emitters**
- Console one-liner (violet), dialogue Markdown line, and JSONL to docs/intent/status/cobloat_YYYYMMDD.jsonl.

## Bloat Types (definitions)

- **Context bloat (CU%)**—combined prompt+history vs model window; primary truncation risk.  
- **Payload bloat (PU%)**—size of the *current* working set you just introduced.  
- **History bloat (HU%)**—residue from earlier turns; grows invisibly without rotation.  
- **Wait/External (WT)**—CI/API/indexing delays; not tokens, but lowers throughput.  
- *(Optional)* **Throughput bloat**—sustained low output tokens/sec; indicates throttling.

## CoAgent Status Panel (bottom bar)

- Show: **Tier badge** + **CU/PU/HU/WT** + **Headroom** + “Rotate” control.  
- **Auto-handoff rules**: SOFT→recommend; HARD→auto-rotate; FATAL→force-rotate.  
- On rotate: write CoSync note under docs/intent/advice/notes/YYYYMMDD/CoSync_<UTC>.md with pointers and resume.

## Operator Playbooks

- Keep payloads modular (zip/AdviceBomb; link not paste).  
- Use PaceGuard during CI/index windows.  
- Prefer early rotation at SOFT when parallelizing across many sessions.
