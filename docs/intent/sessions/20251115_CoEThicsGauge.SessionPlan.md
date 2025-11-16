# Session Plan — "CoEThicsGauge" (2025-11-15)

- **Session label:** CoEThicsGauge
- **Date (local):** 2025-11-15
- **Primary repos:** 
  - `CoSteward` — ops, BPOE, session plans, CoSync notes
  - `CoCivium`  — CoEthicsGauge v0 kit, logs, dashboard, Academia Shock linkages
  - `CoCache`   — indices, cross-references, HP/Co1 orchestration hooks (later)

---

## 0. MegaWave definition (session-level)

**MegaWave (MW)** for this session:

- A finite sequence of **Waves** within this chat, all **repo-first**.
- Each Wave:
  - Lands as a branch/PR and/or durable asset (docs, tools, logs).
  - Has a clear mission and bounded scope.
  - Produces receipts (branches, PRs, zips, dashboards, CoSync notes).
- This session assumes:
  - CoEThicsGauge-related MW intent is pre-approved by Rick up to session end.
  - Extra scope is parked in a Co1/HP handoff section instead of blocking.

---

## 1. MegaWave Map (this session)

| Wave | Name                                              | Goal                                                           | Repos              | Status  |
|------|---------------------------------------------------|----------------------------------------------------------------|--------------------|---------|
| 1    | Session Plan + CoEThicsGauge CoSync               | Create/land this session plan + clarify MW/BPOE expectations   | CoSteward          | DONE    |
| 2    | CoEthicsGauge v0 — structure + toolchain review   | Align branches/PRs (waves 1–6) into a coherent CoEthicsGauge v0| CoCivium           | ACTIVE  |
| 3    | Academia Shock linkage + dashboard story          | Tie Academia Shock paper/dashboard to CoEthicsGauge logging    | CoCivium           | DONE(v0)|
| 4    | BPOE updates — MegaWave patterns + error habits   | Capture workflow/wisdom into CoSteward BPOE docs               | CoSteward, CoCache | PLANNED |
| 5    | Session drain + Co1/HP handoff                    | Drain wisdom → repo and outline HP/Co1 follow-ups              | CoSteward, CoCache | PLANNED |

> **MW countdown:** We expect ~5 Waves this session; table above is the live tracker.

---

## 2. Intent Checklist (this session)

> “Intent” = facts we want true on repo by end of session.

- [ ] This Session Plan merged (or PR open + referenced) in `CoSteward`.
- [ ] CoEthicsGauge v0 layout (kit, log, entries, dashboard, tools) described and linked here.
- [ ] Academia Shock hooks into CoEthicsGauge (metrics, governance) captured here.
- [ ] At least one BPOE-ish doc updated with new MegaWave/workflow patterns.
- [ ] At least one error/habit pattern captured (PowerShell, git, background jobs, etc.).
- [ ] End-of-session drain + CoSync note written (or explicitly deferred with pointer).

---

## 3. Co1 / HP Handoff (scope-creep parking lot)

Items here are **deliberately not** solved in this session; they’re for Co1/HP later.

- [ ] All-repo “MegaWave megascroller” that aggregates:
  - Session plans (like this one),
  - Advice bombs, idea cards,
  - Key PR tags (CoEthicsGauge, CoArena, CoAgent, etc.).
- [ ] Standard Co1 orchestration rules for:
  - Cross-repo indexes,
  - Bidirectional links between CoEthicsGauge, Academia Shock, CoCache, CoSteward.
- [ ] CoArena/CoAgent UX to visualize:
  - Per-session MegaWave countdown,
  - CoBloat heartbeat (CU/PU/HU/WT),
  - Links to receipts/PRs per Wave.

(We’ll add concrete bullets + repo paths as the session progresses.)

---

## 4. BPOE / Workflow Insights (to be filled during session)

Short bullets. Detailed write-ups can live in other docs.

### 4.1 PowerShell & Panels

- [ ] Pattern to avoid accidental background jobs when pasting `PS C:\Users\Chris>` transcripts.
- [ ] Standard launcher template for “one PS7 panel per session” with:
  - `UTS` function,
  - MegaWave label,
  - CoBloat heartbeat print at end of each Wave.

### 4.2 Git / Branching

- [ ] BPOE pattern for importing artifacts across Waves/branches using  
      `git checkout <branch> -- <paths>`.
- [ ] Stacked PR pattern for “paper + tools + logs + dashboards” (Academia Shock + CoEthicsGauge).

### 4.3 Tooling / Receipts

- [ ] Standard layout for `docs/CoEthicsGauge/CoEthicsLog/entries/**` including demo entries.
- [ ] Standard for JSON-schema validation via PowerShell (`Test-Json`) and schema design.
- [ ] Standard for “dashboard snapshot” exporters (e.g. `Export-CoEthicsDashboardSnapshot.ps1`).

---

## 5. End-of-Session Drain Checklist

Before ending this “CoEThicsGauge” session:

- [ ] MegaWave Map updated with final statuses per Wave.
- [ ] Intent Checklist updated with actual outcomes (checked/unchecked).
- [ ] Links recorded here for key branches/PRs/zips created during this session.
- [ ] (If appropriate) CoSync note created under:  
      `docs/intent/advice/notes/20251115/CoSync_<UTCSTAMP>.md` summarizing:
  - Waves completed,
  - Receipts (branches, PRs, zips, dashboards),
  - Pointers to this Session Plan and any BPOE docs touched.

---
## 6. Receipts so far (2025-11-16 snapshot)

- **MW1 (CoSteward):**
  - Session plan created: `docs/intent/sessions/20251115_CoEThicsGauge.SessionPlan.md`
  - Branch: `docs/session-plan-CoEThicsGauge-20251116T051220Z` (PR to be opened).

- **MW2 (CoCivium — CoEthicsGauge v0 layout):**
  - Current kit on `main`:
    - `docs/CoEthicsGauge/CoEthicsLog/ENTRY_AUTHORING_v0.md`
    - `docs/CoEthicsGauge/CoEthicsLog/ENTRY_FORMAT_v0.md`
    - `docs/CoEthicsGauge/CoEthicsLog/ENTRY_SCHEMA_v0.json`
    - `docs/CoEthicsGauge/CoEthicsLog/ENTRY_TEMPLATE_v0.json`
    - `docs/CoEthicsGauge/CoEthicsLog/entries/US-federal/demo-brand__CoEthicsLens.DemocracyFirst.US2025__20251115.json`
    - `docs/CoEthicsGauge/DASHBOARD_SNAPSHOT_v0.md`
    - `tools/CoEthicsGauge/*` (entry creation, validation, dashboard snapshot).

- **MW3 (CoCivium — Academia Shock linkage stub):**
  - Branch: `docs/academia-shock-CoEthicsGauge-link-20251116T064844Z`
  - Linkage doc: `docs/academia-shock/CoEthicsGauge_Linkage_v0.md`
    - Maps key branches (Academia Shock + CoEthicsGauge).
    - Explains how CoEthicsGauge entries can back Academia Shock dashboards.

