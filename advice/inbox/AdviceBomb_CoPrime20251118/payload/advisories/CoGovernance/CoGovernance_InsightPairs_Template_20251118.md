# Governance Insight Pairs  -  Template (Theory & Practice)

Origin-Session: CoCivia20251118 / CoCivium governance discussion
Intended-For: CoPrime20251118 (a.k.a. Co1)
Version: 2025-11-18

## 1. Purpose

This document defines a reusable pattern for **Insight Pairs**:

- One THEORY file  -  framing, principles, assumptions, weaknesses,
  and high-level evolution intents.
- One PRACTICE file  -  concrete procedures, thresholds, metrics,
  and experiments.

Every significant governance topic in CoCivium (roles, arbitration,
safety pauses, exec advisory, etc.) can be represented as a pair.


## 2. File layout recommendation

In a given source repo (often CoCivium):

```text
insights/governance/<topic-id>/
  THEORY.md
  PRACTICE.md
  evidence/          # optional: logs, diagrams, transcripts
```

Examples of `<topic-id>`:
- `power-caps`
- `consent-checks`
- `sortition-panel`
- `safety-pause`
- `role-costeward`
- `exec-advisory-pack`


## 3. THEORY.md template

Suggested minimal skeleton:

```markdown
---
id: INS_<topic-id>_THEORY
kind: guide
level: principle
title: "<Short name>  -  Theory"
status: draft
version: 0.1
scope: "CoCivium-wide"
source:
  repo: CoCivium
  path: "insights/governance/<topic-id>/THEORY.md"
  ref: "main"
receipts: []
tags: [governance, theory]
---

# <Short name>  -  Theory

## 1) Problem & Intent
- What this governs and why it matters.
- Desired observable outcomes.

## 2) Principles & Rationale
- Link to BPOE / no-crowns / consent patterns.
- Tradeoffs and non-goals.

## 3) Assumptions (to be tested)
- A1
- A2

## 4) Weaknesses / Inadequacies / Vulnerabilities
- W1 (impact • likelihood) – evidence
- W2 – evidence

## 5) Evolutionary Intents (Mitigations)
- E1: <intent> → metric, owner pattern, horizon
- E2: ...

## 6) Open Questions
- Q1
- Q2
```


## 4. PRACTICE.md template

Suggested minimal skeleton:

```markdown
---
id: INS_<topic-id>_PRACTICE
kind: process
level: process
title: "<Short name>  -  Practice"
status: draft
version: 0.1
scope: "CoCivium-wide"
source:
  repo: CoCivium
  path: "insights/governance/<topic-id>/PRACTICE.md"
  ref: "main"
receipts: []
tags: [governance, practice]
---

# <Short name>  -  Practice

## 1) Procedure (stepwise)
1. ...
2. ...

## 2) Thresholds & Roles (no crowns)
- Support thresholds, time windows.
- Scoped roles involved (CoSteward, Verifier, Mediator, etc.).

## 3) Comms & Evidence
- Required artifacts: cards, PRs, logs, hashes.
- Where to publish (paths, TOC anchors).

## 4) Risks & Controls
- R1 → control / safety-pause condition.
- R2 → control.

## 5) Metrics & Feedback Loops
- Leading indicators.
- Lagging indicators.
- Review cadence (CoSync link).

## 6) Evolutionary Intents (Experiments)
- X1: <small reversible experiment> → success criteria, stop rule.
- X2: ...

## Appendix: References
- Diagrams, tests, external papers, etc.
```


## 5. Registry linkage (Atlas side)

For each topic, two Atlas registry entries can be created:

- `INS_<topic-id>_THEORY`
- `INS_<topic-id>_PRACTICE`

Each entry points to the corresponding markdown file in the source
repo and records:

- status, scope, tags,
- a content hash,
- receipts (PRs, CoSync notes),
- related evidence.


## 6. Weaknesses and evolution intents

**Weaknesses**
- Insight Pairs can become stale if nobody owns their upkeep.
- Too many pairs may overwhelm contributors; prioritization will
  matter.

**Evolutionary intents**
- Assign a scoped CoSteward (or honorary caretaker) for sets of
  related Insight Pairs (e.g., “governance core”).
- Periodically run CoSync sweeps that check for obviously outdated
  assumptions or missing metrics.


## 7. How Co1 can use this

Co1 can:

- Instantiate initial Insight Pairs for critical topics (power caps,
  consent checks, sortition, safety pauses, CoSteward role, exec
  advisory) based on existing content in CoCivium/CoSteward/etc.
- Use the templates as acceptance criteria when future sessions or
  contributors propose new governance mechanisms.
- Tie Insight Pairs into the Governance Atlas as first-class items
  with stable IDs and hashes.

