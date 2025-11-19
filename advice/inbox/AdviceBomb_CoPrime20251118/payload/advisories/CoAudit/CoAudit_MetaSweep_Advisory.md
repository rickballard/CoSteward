# CoAudit MetaSweep  -  Advisory for Co1 / CoPrime20251118

## 1. Purpose

This advisory explains how to treat **CoAudit MetaSweep** as the *single, unified sweep* for CoSuite repos.

MetaSweep’s job is to:

- **Read** content in a repo (strictly read-only).
- Apply multiple **rulepacks** (outreach, brand, completeness, etc.).
- **Normalize and deduplicate** findings into a unified model.
- Emit clear, structured **advice artifacts** that humans and other tools can act on.

CoAudit itself MUST remain **read-only**:
- It does not edit files.
- It does not commit.
- It does not open or merge PRs.
- It only reads and reports.

All write-like behavior (patches, PRs, cross-repo updates) happens outside CoAudit, under the control of Co1 or other explicit tooling.

---

## 2. Core Concepts

### 2.1 Rulepacks

Rulepacks are small, focused YAML files. Each one enforces a narrow set of checks. Examples:

- `outreach.yml`
  - Clear primary CTA present.
  - Jargon and buzzword checks.
  - UTM link discipline.
  - Email footer / compliance cues.

- `brand.yml`
  - Use of approved logo files only.
  - CoWhatever naming consistency (e.g., `CoAudit`, not `coAudit`).
  - Palette hex hints (spotting raw colors to cross-check with brand policy).
  - Font-family hints.

- `incomplete.yml`
  - Placeholder copy (“Lorem ipsum”, “insert image here”).
  - TODO/TBD/FIXME markers.
  - Empty sections (headings with almost no body).
  - Dead markdown links (`[label]()`).
  - Overuse of ellipses suggesting unfinished thought.

Rulepacks should be:

- Versioned,
- Documented,
- Kept as small and composable as possible.

### 2.2 Profiles and Path Scopes

A **profile** chooses which rulepacks to apply, and how strict to be on different paths.

A typical MetaSweep profile for outreach and brand might:

- Include rulepacks:
  - `outreach.yml`
  - `brand.yml`
  - `incomplete.yml`

- Define scopes:

  - **Strict paths** (public surfaces)
    - `site/**`
    - `docs/public/**`
    - `marketing/**`
    - Severity escalation:
      - `WARN → ERROR`
      - `ERROR → FATAL`

  - **Relaxed paths** (draft or internal surfaces)
    - `docs/drafts/**`
    - `notes/**`
    - `experiments/**`
    - Severity downgrade:
      - `ERROR → WARN`
      - `WARN → INFO`

This lets CoSuite:

- Protect reputation on public surfaces.
- Keep experimentation fluid in drafts and notes.

### 2.3 Unified Findings Model

MetaSweep emits one unified report rather than separate reports per rulepack.

Each finding includes:

- `Pack`  -  which rulepack produced it (`outreach.yml`, `brand.yml`, etc.).
- `Code`  -  symbolic code such as `OUTREACH/CTA/MISSING`.
- `Severity`  -  `INFO`, `WARN`, `ERROR`, or `FATAL`.
- `Path`  -  relative file path in the repo.
- `Message`  -  human-facing explanation.
- `Suggestion`  -  short remediation hint.
- `Count`  -  how many matches were found.
- `Scope`  -  `strict`, `relaxed`, or `none`.

A stable **fingerprint** is derived from `(pack, code, path, message)` so that duplicates across overlapping rulepacks can be collapsed. When multiple rules flag the same underlying issue, MetaSweep keeps the highest severity.

### 2.4 CoBloat Heartbeat

The unified report also includes a **CoBloat heartbeat**, summarizing the overall health/load:

- CU  -  compute usage / technical bloat.
- PU  -  process usage / workflow friction.
- HU  -  human effort / cognitive load.
- WT  -  overall weight / seriousness of issues.

Each dimension is mapped to a tier:

- `OK`
- `SOFT`
- `HARD`
- `FATAL`

In the early wave, WT is the main driver (based on highest severity present). Over time, Co1 may refine how CU/PU/HU are computed.

---

## 3. Artifacts Co1 Should Expect

A typical MetaSweep run produces:

- `_coaudit/meta/report.json`
  - Unified findings + heartbeat in a machine-readable format.

- `_coaudit/meta/report.md`
  - Human-readable summary grouped by severity and scope, with suggested fixes.

- `_coaudit/meta/sha256.txt`
  - File checksums for integrity and reproducible references.

Optional or related artifacts:

- `_coaudit/outreach/...`
  - Outreach-specific reports, if a specialized sweep is also run.

- `_coaudit/bridge/...`
  - CoAudit → CoCore bridge artifacts (see separate advisory).

Co1 can treat these paths as a stable contract when wiring automation.

---

## 4. How Co1 Should Use MetaSweep

When Co1 is active at the PC with CLI + repos:

1. **Install or update MetaSweep** in the CoAudit repo.
   - Ensure core engine, rulepacks, and profiles are present.
   - Keep them versioned and documented.

2. **Wire target repos** (CoCivium, CoCache, RickPublic, etc.) to run MetaSweep:
   - Add a GitHub Actions workflow invoking MetaSweep on PRs (and optionally on main).
   - Configure a profile file (e.g., `profiles/outreach-brand.profile.yml`) either within CoAudit or consumed remotely.
   - Add a small `.coaudit.yml` for per-repo overrides and exclusions.

3. **Use MetaSweep results as gates and guides**:
   - Block merges on `ERROR`/`FATAL` in **strict** paths.
   - Surface issues as advisory-only in **relaxed** paths.
   - Keep CI messages readable; use PR comments and badges to highlight top issues.

4. **Feed higher-level systems**:
   - Pass unified reports into the CoAudit → CoCore bridge to propose new best practices and theory links.
   - Feed metrics (counts, severities, WT state) into CoCache or a metrics board to track trends over time.

Co1 should enforce that MetaSweep remains a **pure advisory engine**. Any future tooling that auto-applies patches must be clearly separated and transparent.

---

## 5. Relationship to Other CoAudit Advisories

This MetaSweep advisory should be read alongside:

- `CoAudit_SessionPlan_Detailed.md`
  - Implementation roadmap, workstreams, and checklists.

- `CoAudit_BrandKit_Advisory.md`
  - How to visually present MetaSweep results (banners, badges, PR comments).

- `CoAudit_CoCoreBridge_Advisory.md`
  - How to translate findings into CoCore best practices and CoTheory structures.

Together, these four documents define how CoAudit MetaSweep underpins a visible, self-critical, and auto-evolving CoSuite.

