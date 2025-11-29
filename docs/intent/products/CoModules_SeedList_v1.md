# CoModules Seed List v1
Session: Products20251128
Owner session: Products20251128 (not CoPrime)

This file tracks shared modules (CoModules) for CoSuite products.
Products should be assembled from CoModules where possible, not one-off logic.

Each module entry:

- Code   - short handle.
- Purpose - what it does.
- Used by - initial products.
- Repos  - likely homes.
- Notes  - design intent and constraints.

---

## M01 - CoArena core

- Code: M01_CoArenaCore
- Purpose:
  Run structured debates between agents, track transcripts, decisions and medals.
- Used by:
  CoArena, CoAgent (as arena host), CoCheck (future), CoPlan (future scenario compare).
- Repos:
  CoAgent (runtime and tools), CoSteward (protocols), later CoArena.
- Notes:
  - Owns the arena_result PTAG facet shape.
  - Defines what a match is, how logs are written, and how sessions are identified.
  - HTTP APIs like POST /arena/match are thin shells over this module.

---

## M02 - Medals and referee

- Code: M02_MedalsRef
- Purpose:
  Decide winners and assign fun, memorable medals for each match or evaluation.
- Used by:
  CoArena, CoCheck (judging proposals), CoPlan (scenario compare), CoAudit (explaining audit calls).
- Repos:
  CoAgent (CoArena scripts, medals tables), CoSteward (policy and guardrails).
- Notes:
  - Encapsulates referee logic, including handicap, confidence and disagreement flags.
  - Medals should be:
    - memorable,
    - composable into ribbons and walls later,
    - safe and non-toxic by default.
  - Human overrides are recorded, not ignored.

---

## M03 - Civar valuation

- Code: M03_Civar
- Purpose:
  Attach a pseudo value to outputs so humans can feel the scale of the work.
- Used by:
  CoArena, CoCheck, CoPlan, CoAudit, MeritRank, CoCivium contributions.
- Repos:
  CoAgent (CoArena civar facet), CoSteward (PTAG facet spec and norms), later CoIndex and CoCore.
- Notes:
  - Human story:
    One civar is roughly one hour of an unassisted human trying to answer a hybrid society question.
  - Machine side:
    - civar.estimated from complexity, topic, disagreement and artifact density.
    - civar.user_override from user feedback.
    - civar.final after blending signals and later audit.
  - Future:
    MeritRank can use civars to compare civars produced and civars consumed across contributors.

---

## M04 - PTAG facets and logging

- Code: M04_PTAGLog
- Purpose:
  Provide a standard way to describe, log and replay product events and artifacts.
- Used by:
  All products that emit structured events or artifacts.
- Repos:
  CoAgent (facet stubs, arena_result facet), CoSteward (PTAG schema docs), CoIndex (mapping to index).
- Notes:
  - Product events are loggable to JSONL with PTAG facets.
  - PTAG is the shared language for:
    - arena results,
    - product ramps,
    - civars,
    - future MeritRank events.
  - Products should treat PTAG as shared, not custom JSON per app.

---

## M05 - Thin client shells

- Code: M05_ThinClient
- Purpose:
  Provide minimal, replaceable surfaces that call into shared backends.
- Used by:
  CoArena, CoAgent, CoCheck, RepoZipper, CoPlan and others.
- Repos:
  CoAgent (PS7 tools and CLI), CoArena (future web and app surfaces), product repos with front ends.
- Notes:
  - Pattern:
    - Thin client prompts the user and gathers small bits of input.
    - Sends PTAG-shaped payloads to backend.
    - Renders backend responses into CLI text, simple HTML or app widgets.
  - Clients do not hard code AI provider details. Providers live behind CoModules.

---

## M06 - Products ramp inventory

- Code: M06_ProductsRamp
- Purpose:
  Track each product journey from toy to trustworthy tool.
- Used by:
  CoSteward, CoPrime, all product owners.
- Repos:
  CoSteward (primary), mirrored views in other repos as needed.
- Notes:
  - Backed by Products_Ramp_Pattern_v1.md.
  - Each product row should link to:
    - its CoModules,
    - its current maturity (toy, beta, production),
    - its adoption targets.
  - CoPrime orchestrates across ramps, but the pattern is defined here.

---

## M07 - CoCache local layout

- Code: M07_CoCacheLocal
- Purpose:
  Define how local file structures (logs, zips, AdviceBombs) are saved and discovered.
- Used by:
  CoAgent, CoCache, CoSteward, CoTheories, CoIndex and others.
- Repos:
  CoSteward (layout docs), CoCache, CoAgent (tools that write logs and bundles).
- Notes:
  - Includes conventions for:
    - logs folders,
    - MW zips,
    - AdviceBombs,
    - .sha256 receipts.
  - Goal:
    Any product that writes files should be understandable by CoCache tooling without custom code.

---

## M08 - Contribution intent and handoffs

- Code: M08_HandoffNotes
- Purpose:
  Standardise how sessions send intent and context to CoPrime and future sessions.
- Used by:
  Every session that produces cross repo work, including Products20251128.
- Repos:
  CoSteward (notes under docs/intent/advice/notes/YYYYMMDD), CoPrime orchestration.
- Notes:
  - Handoff notes should:
    - name the owning session,
    - list created or updated artefacts,
    - include open questions,
    - be safe to read in isolation.
  - Products sessions like Products20251128 write the rails.
    CoPrime is the scheduler and integrator.

---

## M09 - CoGIBindex hooks for products

- Code: M09_GIB_Products
- Purpose:
  Give each product and CoModule a clean hook into GIBindex and Gibber.
- Used by:
  CoIndex, CoSteward, all major products.
- Repos:
  CoIndex (index logic), CoSteward (usage patterns), product repos (local tags).
- Notes:
  - Each CoModule should declare:
    - human readable tags,
    - machine oriented tags for GIBindex,
    - any special Gibber phrases when they exist.
  - This lets AIs search and route across products using shared concepts, not only repo paths.

---

## M10 - Guardrails and ethics overlays

- Code: M10_Guards
- Purpose:
  Provide reusable guardrail patterns for all products.
- Used by:
  CoArena, CoCheck, CoAudit, crypto rails, and any product that touches live users or funds.
- Repos:
  CoSteward (patterns), CoCore (best practices), CoAudit (enforcement and review).
- Notes:
  - Includes:
    - Do not override local law rails.
    - Do not silently remove safety checks rails.
    - Surface uncertainty clearly rails.
  - Implemented as plug in modules for prompts and configs, not hard coded pieces spread everywhere.

---

## How to use this file

1. When you add or evolve a product:
   - Update Products_Ramp_Pattern_v1.md.
   - Link that product to the CoModules it uses.

2. When you add a new CoModule:
   - Add a new Mxx entry here.
   - Create or update matching docs in the appropriate repos.

3. When in doubt:
   - Prefer upgrading a CoModule over inventing a one off local feature.
