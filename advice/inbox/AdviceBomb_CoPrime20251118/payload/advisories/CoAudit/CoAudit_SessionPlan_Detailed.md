# CoAudit Session Plan  -  Detailed Advisory for Co1 / CoPrime20251118

This document refines the **CoAudit session plan** into a detailed, implementation-ready guide for Co1 when running at the PC with CLI and repo access.

It assumes:

- CoAudit is the **read-only self-critique engine** for CoSuite.
- Co1 orchestrates adoption across multiple repos.
- Cross-repo writing and PR creation happen *outside* CoAudit itself.

---

## 1. Objectives

1. Establish **MetaSweep** as the unified sweep for key CoSuite repos.
2. Keep CoAudit **strictly read-only**: it produces advice artifacts only.
3. Make self-critique **visible and consistent** via the Brand Kit.
4. Feed accepted learnings into **CoCore** and **CoTheory** through bridge artifacts.
5. Add **metrics and governance** so the system can evolve and improve over time.

---

## 2. Workstreams & Checklists

Each workstream represents a cluster of tasks Co1 can execute in small, focused PRs.

### Workstream A  -  CoSync & Repo Wiring

**Goal:** bring CoAudit and key repos into alignment with MetaSweep and its rulepacks.

**Checklist**

In the **CoAudit** repo:

- [ ] `git switch main && git pull --ff-only`
- [ ] `git switch -c feat/metasweep-v0-1`
- [ ] Ensure the following exist:
  - [ ] MetaSweep core engine (runner, unified report schema, fingerprinting, CoBloat heartbeat).
  - [ ] Rulepacks: `outreach.yml`, `brand.yml`, `incomplete.yml`.
  - [ ] Profiles directory with at least `outreach-brand.profile.yml`.
  - [ ] Optional: LLM judge adapter (advisory-only).
  - [ ] Brand Kit assets (banner, badges, PR comment template).
- [ ] Run any `.CoVerify.ps1` or equivalent sanity check.
- [ ] Commit and open a small PR: `feat: MetaSweep v0.1`.
- [ ] After review, merge to `main` and optionally tag `v0.1.0`.

In **target repos** (e.g., CoCivium, CoCache, RickPublic):

- [ ] Pull latest `main`.
- [ ] Add a MetaSweep GitHub Actions workflow targeting the repo.
- [ ] Add a `.coaudit.yml` file for local overrides and ignores where needed.
- [ ] Add `brand.policy.json` if the repo is public-facing.

---

### Workstream B  -  MetaSweep Profile (Strict vs Relaxed)

**Goal:** ensure profiles accurately reflect public versus draft surfaces.

**Checklist**

- [ ] Define or verify `profiles/outreach-brand.profile.yml` with:
  - [ ] `include_rulepacks`: outreach, brand, incomplete.
  - [ ] `strict_paths` (e.g., `site/**`, `docs/public/**`, `marketing/**`).
  - [ ] `relaxed_paths` (e.g., `docs/drafts/**`, `notes/**`, `experiments/**`).
  - [ ] `overrides` for specific codes that should be softened or elevated.

- [ ] Confirm behavior:
  - [ ] Strict paths escalate severities (`WARN → ERROR`, `ERROR → FATAL`).
  - [ ] Relaxed paths downgrade severities (`ERROR → WARN`, `WARN → INFO`).
  - [ ] Findings include a `Scope` field (`strict`, `relaxed`, `none`).

---

### Workstream C  -  Brand & Reputation Guardrails

**Goal:** prevent unfinished or off-brand content from leaking into public surfaces.

**Checklist**

For the **incomplete** rulepack:

- [ ] Flag placeholder text (“Lorem ipsum”, etc.).
- [ ] Flag TODO/TBD/FIXME markers.
- [ ] Flag empty sections (headings with very little body content).
- [ ] Flag dead markdown links `[]()`.
- [ ] Flag image placeholders (“insert image here”, etc.).
- [ ] Soft-flag overuse of ellipses that may indicate unfinished thought.

For the **brand** rulepack:

- [ ] Flag suspicious logo filenames (deprecated/draft logos).
- [ ] Flag CoWhatever naming inconsistencies (e.g., `coAudit` vs `CoAudit`).
- [ ] Flag raw hex colors for cross-checking with palette.
- [ ] Flag font-family declarations to cross-check with brand policy.

`brand.policy.json` in public-facing repos should specify:

- [ ] Approved logo paths.
- [ ] Palette hex values.
- [ ] Allowed fonts.
- [ ] Which paths are brand-strict versus brand-relaxed.

---

### Workstream D  -  Visibility (Brand Kit)

**Goal:** make CoAudit’s presence and decisions obvious to contributors and reviewers.

**Checklist**

- [ ] Add CoAudit banner to README in repos where MetaSweep runs.
- [ ] Add a PR status-comment workflow that:
  - [ ] Runs after MetaSweep completes.
  - [ ] Finds the latest `_coaudit/meta/report.md`.
  - [ ] Posts a short comment with:
    - [ ] CoAudit PASS/FAIL.
    - [ ] CoBloat WT tier.
    - [ ] 2–3 top issues (with scope and code).
    - [ ] Link to the full report.
- [ ] Add an optional README footer:
  - [ ] “This repo uses CoAudit MetaSweep for continuous self-audit.”

Keep changes small and predictable so contributors quickly learn the pattern.

---

### Workstream E  -  Optional LLM Judge (Advisory Only)

**Goal:** use LLM assistance as a triage helper, never as a hidden gate.

**Checklist**

- [ ] Provide a script or tool `Judge-CoOutreachWithLLM` that:
  - [ ] Accepts a capped number of files (e.g., 20 files per run).
  - [ ] Uses environment variables for provider, model, and API key.
  - [ ] Writes scores and suggestions to `_coaudit/outreach/judge_llm_raw.json`.

- [ ] CI behavior:
  - [ ] LLM judge step is non-blocking.
  - [ ] Only runs when secrets are configured.
  - [ ] Fails gracefully with warnings if secrets are absent.

- [ ] Encourage use of labels or comments to mark where LLM advice suggests changes (e.g., `needs-outreach-fix`).

---

### Workstream F  -  Bridge to CoCore (Read-Only Artifacts)

**Goal:** capture learnings as durable best practices and theory linkages without breaking CoAudit’s boundary.

**Checklist**

- [ ] After MetaSweep, run the CoAudit → CoCore Bridge:
  - [ ] Input: `_coaudit/meta/report.json`.
  - [ ] Outputs:
    - [ ] `bridge/proposals.json` and `bridge/proposals.md`.
    - [ ] `bridge/cards/*.md` (Best-Practice Cards).
    - [ ] `bridge/theory_links.json`.
    - [ ] `bridge/megascroller.manifest.json`.

- [ ] Review proposals:
  - [ ] Decide which to accept (best practices worth promoting).
  - [ ] Note which need further refinement or rejection.

- [ ] Use separate scripts or manual steps to:
  - [ ] Move accepted cards into CoCore (or a staging area).
  - [ ] Wire accepted proposals into CoTheory structures.
  - [ ] Open PRs against CoCore and other knowledge repos.

CoAudit and the Bridge remain **read-only**; Co1 explicitly controls any downstream writes.

---

### Workstream G  -  CI Gates & Policies

**Goal:** align enforcement with risk tolerance and developer flow.

**Checklist**

- [ ] On **strict surfaces**:
  - [ ] Block PR merge on `ERROR` or `FATAL` findings.
  - [ ] Require explicit review for `WARN`-level findings, but do not auto-block unless desired.

- [ ] On **relaxed surfaces**:
  - [ ] Never block merges based solely on findings.
  - [ ] Surface issues via PR comments and reports as advisory information.

- [ ] Use a single MetaSweep job per repo to avoid duplication and confusion.

Optionally, define labels or statuses for:
- `coaudit-blocked`
- `coaudit-advisory`

---

### Workstream H  -  Metrics & Evolution

**Goal:** measure the impact of CoAudit and tune it over time.

**Checklist**

- [ ] Ensure `_coaudit/meta/report.json` includes:
  - [ ] Counts of findings by severity, pack, and scope.
  - [ ] CoBloat heartbeat snapshot.

- [ ] Provide a simple metric aggregation step or script to:
  - [ ] Append summary stats to CoCache or another metrics store.
  - [ ] Track:
    - [ ] Total findings.
    - [ ] Distribution by severity and scope.
    - [ ] False-positive/false-negative signals (if labeled).
    - [ ] Mean time to remediate (MTT-R).
    - [ ] Sweep runtime.

- [ ] Schedule periodic reviews (e.g., quarterly):
  - [ ] Retire noisy or low-value rules.
  - [ ] Add new rules based on accepted CoCore proposals.
  - [ ] Adjust profiles, path scopes, and thresholds as repos evolve.

---

## 3. Definition of Done for This Wave

Co1 can consider this CoAudit wave “functionally complete” when:

- [ ] CoAudit repo:
  - [ ] Has MetaSweep, rulepacks, profiles, and Brand Kit assets merged into `main`.
  - [ ] Optionally tagged `v0.1.0` or similar.

- [ ] At least one public-facing repo (e.g., CoCivium):
  - [ ] Runs MetaSweep on PRs.
  - [ ] Uses strict/relaxed path scopes.
  - [ ] Blocks merges on serious issues in strict paths.
  - [ ] Emits branded PR comments and reports.

- [ ] The bridge has been exercised at least once:
  - [ ] `bridge/*` artifacts generated from a real sweep.
  - [ ] A PR has been opened against CoCore (even with a small set of cards).

- [ ] Basic metrics:
  - [ ] Are being captured.
  - [ ] Are visible somewhere within CoCache or a similar metrics index.

At that point, Co1 can move CoAudit from “initial wave” to “maintenance and refinement” and consider focusing new waves on additional domains or deeper integrations.

---

## 4. How Co1 Should Use This Document

Co1 should treat this file as:

- The **canonical session-level implementation checklist** for this CoAudit wave.
- A reference to coordinate small, focused PRs across CoSuite repos.
- A context that points to:
  - `CoAudit_MetaSweep_Advisory.md` (conceptual model),
  - `CoAudit_BrandKit_Advisory.md` (visual/communications layer),
  - `CoAudit_CoCoreBridge_Advisory.md` (upstream learning pipeline).

Once these steps are substantially complete, Co1 can snap a new “wave summary,” archive this advisory as part of the history, and design the next CoAudit wave with clearer baselines.

