# CoPrime Session Plan  -  MegaWave-First Extension (v0)

> Single source of truth for this session’s **MegaWaves**, intents, and receipts.  
> Lives in `CoSteward` and is updated at the **start and end of every MegaWave cycle**.

## 1. Session Identity

- **Session label:** `CoCivia` (example  -  replace per session)
- **Session class:** CoPrime / CoArena / CoAudit / Other
- **Primary steward:** Rick Ballard
- **Start UTC:** <!-- fill -->
- **Repo focus:** CoSteward + multi-repo orchestration
- **BPOE baseline:** CoSuite MegaWave BPOE, CoStatus BPOE, IntentCloud BPOE

## 2. MegaWave Backlog (Live List)

Treat this as the *authoritative queue* of waves for this session.

For each row, use one line:

- **MW ID:** short, stable label (e.g., `MW_ScriptWavePatterns_v0`)
- **Tier:** Core / FixWave / Outreach / Refactor / Infra
- **Scope summary:** 1‑line description
- **Target repos:** list of slugs (e.g., `CoSteward, CoCacheGlobal`)
- **Status:** Planned / In‑flight / Landed / Deferred / Dropped
- **Deps:** Optional dependency hints

Example table:

| MW ID                          | Tier    | Scope summary                                      | Target repos                       | Status    | Deps |
|--------------------------------|---------|----------------------------------------------------|------------------------------------|----------|------|
| MW_SessionPlan_MegaWaves_v0    | Core    | Add session-plan MegaWave extension + docs         | CoSteward                          | Landed   |  -     |
| MW_CoStatusAdapters_v1         | Core    | CoStatus adapter rollout across core repos         | CoSteward, CoAgent, CoCache, CCG   | Stub     |  -     |
| MW_ScriptWavePatterns_v0       | Core    | ScriptWave/FixWave patterns + receipts             | CoSteward                          | Landed   |  -     |
| MW_AllSessions_DrainWisdom_v0  | FixWave | Ensure all prior sessions drained fully to repos   | CoSteward (+ others via Co1)       | Planned  |  -     |

Keep this table tightly groomed; obsolete items should either be **Dropped** with a note or moved into a historical section.

## 3. Active MegaWave (This Cycle)

Each cycle must declare exactly **one** primary MegaWave focus.

- **Cycle index:** <!-- e.g., 7 -->
- **Active MW ID:** <!-- e.g., MW_SessionPlan_MegaWaves_v0 -->
- **Intent snapshot (short):** <!-- 1–2 lines -->
- **Expected repos touched:** <!-- list -->
- **Expected artifacts:** <!-- bullets -->

### 3.1 MegaWave Countdown

Use this as the **single countdown field** for the session:

- **Estimated waves remaining in this session:** <!-- integer -->
- **Updated at cycle:** <!-- which cycle last updated -->
- **Rationale:** <!-- short explanation of estimate -->

This value should be updated **every cycle**.  
If we add scope, we increase the number; if we close scope, we reduce it.

## 4. Per‑Wave Receipts (Ground Truth)

For each MegaWave, record all receipts in a consistent block.

### Template (copy for each MW)

```text
MW ID: <MW_Identifier_here>
Tier: Core / FixWave / Outreach / Refactor / Infra

Wave Zip Name:
  - <zip-file-name>.zip

SHA256:
  - <sha256-hash>

Short Branch Name:
  - <repo>: <branch-name>

PR(s):
  - <repo>: <PR # / URL>
  - ...

CoPing Line (PS7 panel):
  - CoPing: <MW_ID> <status/summary>

CoStatus Snapshot:
  - CU: <OK/SOFT/HARD/FATAL>
  - PU: <OK/SOFT/HARD/FATAL>
  - HU: <OK/SOFT/HARD/FATAL>
  - WT: <OK/SOFT/HARD/FATAL>
  - Drift: ~<0.xx>
  - Focus: <short text>

CoSync Note:
  - File: docs/intent/advice/notes/YYYYMMDD/CoSync_<UTCSTAMP>.md
  - Summary: 1–2 lines of what this MW landed.

FixWave:
  - If FixWave happened, list the FixWave MW ID and receipts here.
```

### Example: MW_SessionPlan_MegaWaves_v0 (this wave)

```text
MW ID: MW_SessionPlan_MegaWaves_v0
Tier: Core

Wave Zip Name:
  - CoSuite_MW_SessionPlan_MegaWaves_v0_<UTCSTAMP>.zip

SHA256:
  - <fill from wave receipts>

Short Branch Name:
  - CoSteward: docs(SessionPlan_MegaWaves)_MW_<UTCSTAMP>

PR(s):
  - CoSteward: <PR URL>

CoPing Line (PS7 panel):
  - CoPing: MW_SessionPlan_MegaWaves_v0 install complete.

CoStatus Snapshot:
  - CU: OK
  - PU: SOFT
  - HU: SOFT
  - WT: OK
  - Drift: ~0.18
  - Focus: Add MegaWave-aware session plan doc into CoSteward.

CoSync Note:
  - File: docs/intent/advice/notes/YYYYMMDD/CoSync_<UTCSTAMP>.md
  - Summary: Session plan extended for MegaWave queue + receipts.

FixWave:
  - (none yet)
```

## 5. Session‑Level Intent Checklist (For Co1 / CoPrime)

This section is the **bridge** into the CoPrime / IntentCloud / Co1 megascroller world.

### 5.1 Core Mandates

- [ ] Maintain this document as the session’s single source of truth for:
  - MegaWave backlog
  - Current countdown
  - Receipts cross‑repo
- [ ] Never leave a MegaWave “done” without receipts recorded here.
- [ ] Ensure every MegaWave either:
  - lands fully, or
  - has a **named FixWave** in the backlog with clear scope.
- [ ] Drain any new wisdom from this session into:
  - CoSteward BPOE docs
  - CoSuite‑wide MegaWave BPOE docs
  - IntentCloud / CoPrime checklisting docs

### 5.2 Draining Session Wisdom (End‑Game Checklist)

At (or near) session end, ensure:

- [ ] All “in‑flight” MegaWaves are either landed or:
  - explicitly handed off as FixWaves / future waves in the backlog.
- [ ] All useful learnings about:
  - user habits
  - error patterns
  - tool glitches / PS7 patterns
  - CI and guardrail behaviours  
  have been turned into:
  - checklists
  - BPOE doc updates
  - or explicit advice files under `docs/intent/advice/...`
- [ ] There is a **CoSync note** summarizing:
  - Which MegaWaves landed
  - Which PRs are still open
  - What Co1 should pick up next

## 6. Handover Notes for Co1 / Future Sessions

When handing off:

- Point to this file as the **entry point** for understanding:
  - which MegaWaves exist,
  - which ones landed,
  - and where to find the receipts.
- Include in the CoSync note:
  - the current countdown estimate
  - the top 3 most important upcoming MegaWaves.

If this doc diverges from reality, **reality must win**:
- fix this file *before* trusting any session‑level summary.

