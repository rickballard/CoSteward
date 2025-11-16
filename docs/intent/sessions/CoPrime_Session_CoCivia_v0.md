# CoPrime Session: CoCivia (MegaWave-Oriented Session Plan v0)

**Session Label:** CoCivia  
**Session Host:** CoPrime / CoAgent stack  
**Created:** 20251116T050900Z  
**Status:** Active  
**Doctrine:** MegaWave-first · Repo-first · CoStatus-first

---

## 1. Session Intent (High Level)

This session focuses on:
- Seeding, positioning, and operationalizing the **CoCivia** persona across CoSuite.
- Aligning with **IntentCloud 2025** and CoPrime's broader intent scaffolding.
- Evolving BPOEs so that:
  - MegaWave is the default unit of work.
  - Wisdom is captured to repo (not left in transient session memory).
  - Co1 can later aggregate this session’s outputs into the global master plan.

This file is the **single session-source of truth** for:
- The MegaWave backlog for this session.
- Countdown state (how many waves remain).
- Key receipts and links useful to Co1.

---

## 2. MegaWave Countdown (Session-Coarse)

| Field              | Value |
|--------------------|-------|
| WavesPlanned       | 6     |
| WavesCompleted     | 1     |
| WavesRemaining     | 5     |
| LastWaveId         | `MW_SessionPlan_MegaWaves_v0` |
| LastWaveCoStatus   | `CU=OK · PU=SOFT · HU=SOFT · WT=OK · drift≈0.20` |
| LastWaveBranch     | `docs(SessionPlan_MegaWaves)_MW_20251116T050217Z` |
| LastWavePR         | `https://github.com/rickballard/CoSteward/pull/179` |

When any new wave lands for this session:

1. Update this table:
   - Increment **WavesCompleted**.
   - Recompute **WavesRemaining**.
   - Update **LastWave*** fields.
2. Append an entry to the **Session MegaWave Backlog** below.
3. Ensure a corresponding CoStatus entry references the latest wave.

---

## 3. Session MegaWave Backlog (Coarse-Grained)

### ✅ Landed

1. `MW_SessionPlan_MegaWaves_v0`
   - **Repo:** `CoSteward`
   - **Branch:** `docs(SessionPlan_MegaWaves)_MW_20251116T050217Z`
   - **PR:** <https://github.com/rickballard/CoSteward/pull/179>
   - **Scope:**
     - Adds `docs/ops/MegaWave/CoPrime_SessionPlan_MegaWaves_v0.md` and `docs/ops/MegaWave/README.md`.
     - Defines generic MegaWave-oriented session-plan patterns (backlog + countdown + receipts).
     - Establishes CoStatus focus: "Install CoPrime session-plan MegaWave extension (backlog + countdown + receipts pattern)."

### 🔜 Planned (Candidate Waves)

These are **intent-level** and may each expand into one or more concrete MegaWaves / FixWaves.

2. `MW_CoCivia_PersonaSeed_v0`
   - Seed / refine CoCivia persona notes across:
     - `CoCacheGlobal/docs/CoCivia/*`
     - `CoAgent/docs/branding/*CoCivia*`
     - `CoSteward/docs/intent/personas/*CoCivia*`
   - Ensure at least one **Receipts** doc explains how CoCivia is used in CoSuite products.

3. `MW_CoCivia_CoStatusAdapters_v1`
   - Align CoStatus adapter patterns with CoCivia-specific workflows (e.g., branding, outreach, Dia session graphics).
   - Integrate with `CoSteward/tools/heartbeat` + any CoStatus guard rails.

4. `MW_CoCivia_IntentDrain_v0`
   - Harvest this session’s chat + PS7 rails (as feasible) into:
     - BPOE guidance under `docs/ops/MegaWave/` and/or `docs/advice/`.
     - IntentCloud 2025 scaffolding (e.g., `docs/intent/CoPrime/*`).

5. `MW_CoCivia_Closeout_v0`
   - Final CoSync + receipts sweep:
     - CoStatus summary.
     - Session summary (for Co1 + future AIs).
     - Pointer list of all CoCivia-related PRs and branches created in this session.

This backlog is deliberately **coarse**: fine-grain wave design happens in per-wave docs and receipts.

---

## 4. Wisdom-Drain Protocol for This Session

To prevent loss of learning due to token limits or attention drift:

1. **Per-wave receipts** MUST include:
   - Wave ID, branch, PR, CoStatus line, zip name, SHA256.
2. **At least one IntentDrain wave (`MW_CoCivia_IntentDrain_v0`)**
   SHOULD:
   - Summarize key patterns learned in this session.
   - Propose BPOE updates to:
     - MegaWave doctrine.
     - CoStatus adapters.
     - Session planning and CoSync habits.
3. Co1 is expected to:
   - Harvest this session file into any master "megascroller" intent checklist.
   - Use it as a seed when wiring cross-repo orchestration.

---

## 5. Cross-Repo Pointers (Seed)

- **CoSteward:**
  - `docs/ops/MegaWave/CoPrime_SessionPlan_MegaWaves_v0.md`
  - `docs/ops/MegaWave/README.md`
  - (this file) `docs/intent/sessions/CoPrime_Session_CoCivia_v0.md`

- **CoCacheGlobal (CoCivia namespace planned/seeded):**
  - `docs/CoCivia/*` (index / home / snippet / receipts)

- **CoAgent (branding + product surfaces):**
  - `docs/branding/*CoCivia*` (avatar, positioning, receipts)

Co1, when running its own waves, should treat this doc as a **session-level hub** and keep links updated as more CoCivia assets land.
