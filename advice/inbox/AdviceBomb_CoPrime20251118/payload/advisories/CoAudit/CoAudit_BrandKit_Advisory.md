# CoAudit Brand Kit  -  Advisory for Co1 / CoPrime20251118

## 1. Purpose

This advisory explains how to **brand** CoAudit and MetaSweep so that our self-critique is:

- **Visible**  -  people can see at a glance that a repo is under continuous audit.
- **Consistent**  -  same patterns across all CoSuite repos.
- **Lightweight**  -  minimal complexity, mostly static assets and markdown.
- **Aligned with CoSuite identity**  -  coherent colors, terminology, and framing.

The Brand Kit affects **presentation only**. It does not modify CoAudit logic or violate its read-only boundary.

---

## 2. Core Brand Elements

### 2.1 README Banner

A simple banner at the top of a repo README communicates:

- That the repo is monitored by CoAudit MetaSweep.
- That we practice visible self-critique.
- A concise tagline such as “Unified sweeps · Brand-aware · CoBloat heartbeat”.

Example (conceptual):

```markdown
<!-- CoAudit Banner -->
<p align="center">
  <img src="./assets/coaudit/banner.svg" width="820" alt="CoAudit  -  Unified Sweeps">
</p>
```

Co1 should ensure that:

- The banner file path is stable across repos (e.g., `assets/coaudit/banner.svg`).
- The banner loads without extra external dependencies.

### 2.2 Status Badges

Badges communicate status compactly:

- **CoAudit status**:
  - PASS / FAIL, based on severity thresholds for strict surfaces.

- **Severity badges**:
  - `severity: INFO`, `severity: WARN`, `severity: ERROR`, `severity: FATAL`.

- **CoBloat heartbeat badges**:
  - `cobloat: OK`, `cobloat: SOFT`, `cobloat: HARD`, `cobloat: FATAL`.

These can appear:

- In README sections documenting quality.
- In PR comments left by CI.
- On dashboards that summarize multiple repos.

They are purely visual; they should always be accompanied by text explaining what is happening.

### 2.3 PR Status Comment Template

A short, consistent PR comment keeps reviewers aligned on what CoAudit is saying. Example structure:

```markdown
### CoAudit Status

- CoAudit: PASS / FAIL (with badge)
- CoBloat WT: OK / SOFT / HARD / FATAL (with badge)
- Top issues:
  - [strict] OUTREACH/CTA/MISSING  -  page has no clear primary CTA.
  - [strict] INCOMPLETE/PLACEHOLDER/LOREM  -  placeholder copy found on landing page.

See full report: `_coaudit/meta/report.md`
```

Co1 should make sure:

- Comments are short (2–3 key bullets).
- Full detail is left to the report file.
- Tone remains constructive and non-punitive.

### 2.4 README Footer

A small footer note closes the loop in the README:

```markdown
---
**This repo uses CoAudit MetaSweep for continuous self-audit.**
```

This reminds readers (and future contributors) that the project values transparent self-inspection.

---

## 3. Implementation Guidance for Co1

When Co1 is wired into repos with CLI + GitHub access, the Brand Kit steps can be:

1. **Create a shared asset path** in each target repo, e.g., `assets/coaudit/`.
2. **Copy or generate**:
   - `banner.svg` for the README.
   - Badge SVGs for status and CoBloat tiers.
3. **Update README**:
   - Add the banner near the top.
   - Optionally add a CoAudit section that links to documentation.
   - Add a footer note about MetaSweep self-audit.
4. **Add a status-comment workflow**:
   - Triggered after MetaSweep completes on PRs.
   - Locates latest `_coaudit/meta/report.md`.
   - Posts a standard comment with badges and top issues.
5. **Evolve copy and visuals** over time, but keep the core semantics stable:
   - PASS/FAIL meaning.
   - CoBloat tiers mapping.
   - Where to find full reports.

Co1 should aim for **small, composable PRs** when rolling out the Brand Kit (e.g., one repo at a time, banner + workflow together).

---

## 4. Principles and Guardrails

When Co1 iterates on the Brand Kit:

1. **Transparency first**
   - Visuals must not obscure critical information.
   - Always link to full reports in PR comments.

2. **Low friction**
   - Avoid complex front-end build steps just for branding.
   - Prefer static assets and plain markdown.

3. **No shaming**
   - CoAudit visuals are meant to encourage improvement, not blame.
   - The tone should be: “We found these issues; here’s how to fix them.”

4. **Compatibility with automation**
   - Badges and banner paths should be predictable, enabling automation to insert them where needed.
   - Changes to asset paths should be rare and carefully reviewed.

---

## 5. Relationship to Other CoAudit Components

- **MetaSweep** provides the underlying findings and heartbeat.
- **Brand Kit** presents these findings in a human-friendly, standardized form.
- **CoCore Bridge** uses the findings (not the visuals) to create durable best practices and CoTheory edges.
- The **Session Plan** describes when and how to roll out the Brand Kit alongside MetaSweep.

Co1 should treat this advisory as the visual/communication layer for CoAudit. It can be updated iteratively as the CoSuite brand evolves, while keeping the core semantics stable.

