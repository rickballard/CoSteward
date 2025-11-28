# CoModules Seed List (v1)

Intent: capture an initial, informal list of **shared modules** that multiple
CoSuite products are likely to depend on, so we can converge on common rails
instead of re-inventing everything per-product.

This is not a strict spec; it is a shopping list plus naming sketch.

---

## 1. Orchestration / flows

- **CoFlowCore**
  - Simple orchestrator primitives for multi-step runs.
  - Used by: CoAgent, CoArena, CoCheck, CoPlan.
  - Responsibilities:
    - Step definitions, retries, logging hooks.
    - Standardized error envelopes that map into PTAG.

- **CoRunbook**
  - Library of higher-level “playbooks” for common scenarios.
  - Example: “two AIs argue, then ref + medal + PTAG write.”

## 2. PTAG + envelopes

- **CoPTAGCore**
  - Canonical PTAG envelope creation / validation.
  - Helpers for writing `*.jsonl` logs, rotating files, basic checks.

- **CoPTAGFacets**
  - Collection of reusable facet schemas (e.g. `arena_result`, `civar`,
    `ux_session`, `merit_snapshot`).
  - CoArena’s `arena_result` + `civar` should live here once they solidify.

## 3. Merit / ranking

- **CoMeritRank**
  - Basic structures for Scriptag / Reptag / canonicality / Humantouch.
  - Shared scoring helpers used by CoArena, CoEthicsGauge, CoCheck.

- **CoHalo**
  - Contributor / steward “halo” scores built on top of CoMeritRank.

## 4. Auth, identity, edge-control

- **CoEdgeAuth**
  - Modules for “edge-owned” auth decisions (what this user + AI may access).
  - Intended to feed into CoPolitic / CoSteward governance views.

- **CoIdentity**
  - Lightweight way to encode “who is acting” (human, AI, hybrid), mapped into
  PTAG envelopes.

## 5. Storage, cache, logs

- **CoCacheCore**
  - Shared abstraction for read/write into the CoCache (local and remote).

- **CoLogRail**
  - Simple logger (plain text + PTAG jsonl) used by all products.

## 6. UX and prompts

- **CoUXPrompts**
  - Library of prompt templates and style guides for CoSuite surfaces.

- **CoArenaUX**
  - Thin wrapper focusing on “two agents + ref + medal + PTAG write” flows.
  - Could later move into its own repo (`CoArena`) but still depend on core
    CoModules.

## 7. Observability and status

- **CoVitals**
  - Provides CoBloat metrics (CU/PU/HU/WT) and basic health dashboards.

- **CoStatusWire**
  - Narrow interface for sending/receiving status lines across sessions / UIs.

---

## Usage notes

- At this stage (v1), these names are **aspirational**, not hard constraints.
- CoPrime / CoSteward should gradually align real code and scripts to these
  names where it makes sense.
- When a product implements something that smells like a CoModule, it should be
  added here and/or renamed to match.
