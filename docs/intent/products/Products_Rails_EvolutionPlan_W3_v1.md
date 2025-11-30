# Products Rails Evolution Plan – W2

Session: Products20251128
Owner: Products20251128 (not CoPrime)

## 1. Context

Wave 1 (W1) created:

- `CoModules_SeedList_v1.md` – M01–M10 shared modules.
- `Products_Ramp_Pattern_v1.md` – a first, honest ramp for key products.
- A CoStatus pulse and CoPrime handoff note pointing at PR 203 in `CoSteward`.

Wave 2 (W2) aims to:

- Deepen the rails around *how* products are built and operated.
- Add modules for sessions, telemetry, experiments, content packs and pricing signals.
- Give CoArena a clearer path from PS7 toy to in-market tool, without over-promising.

Think of W1 as “what exists and roughly how it matures”.
W2 is “how we wire products so they can be safely scaled and observed”.

## 2. New CoModules themes (M11–M15)

These are defined as an overlay in `CoModules_SeedList_W2_Overlay_v1.md`, but the intent is:

- M11 – Sessions and identity.
- M12 – Telemetry and health.
- M13 – Experiment flags.
- M14 – Content packs and bundles.
- M15 – Pricing and value signals.

Together they round out W1 so that every product can, in principle:

- Know *who* it is acting for (within safe, minimal boundaries).
- Report *how* it is behaving (health, usage, basic funnel).
- Run controlled changes (experiments) instead of ad-hoc tweaking.
- Package its artifacts in predictable bundles (zips, AdviceBombs, logs).
- Attach value-ish signals to work (extending civars without becoming a currency).

## 3. Suggested evolution pattern

For each major product (CoArena, CoAgent CLI, RepoZipper, CoCheck, CoPlan, CoAudit, …):

1. **Identify roles and surfaces**

   - Who is the first user? (Rick, future CoStewards, a specific partner.)
   - What are the first surfaces? (PS7 CLI, small web demo, docs-only.)

2. **Wire to core CoModules**

   - Always start with:
     - M01_CoArenaCore or equivalent “engine” module.
     - M04_PTAGLog for events and artifacts.
     - M05_ThinClient for the UI / entrypoint.
     - M07_CoCacheLocal for local files.
   - Then selectively add:
     - M10_Guards when a product touches real users, funds or reputation.
     - M11–M15 when we need sessions, telemetry, experiments, bundles or value.

3. **Update the Products ramp**

   - Keep stages honest (T0–T4).
   - Only bump a product when:
     - its core CoModules are present,
     - guardrails are not purely aspirational,
     - you can show at least 1–2 credible usage paths.

4. **Let CoPrime orchestrate, not own**

   - Products sessions like Products20251128 define rails and modules.
   - CoPrime reads and schedules:
     - which product ramps to push,
     - which modules to harden next,
     - which guardrails must ship *before* public exposure.

## 4. First focus lane – CoArena

To avoid hand-wavy “everything at once”, W2 suggests:

- CoArena as the main *experience* lane.
- CoAgent CLI + CoCache / RepoZipper as the main *infrastructure* lane.

For CoArena specifically, W2 rails (see `CoArena_Productization_Rails_W2_v1.md`) propose:

- Canonical PS7 entrypoints for “run a match”.
- Minimum logging expectations (JSONL + PTAG facets).
- A simple telemetry story:
  - how many matches,
  - basic outcomes,
  - basic error reasons.
- A staged plan to move from PS7-only to:
  - a tiny web shell,
  - then a lightweight desktop or mobile shell if needed.

## 5. What future waves might do

W3+ could:

- Move civars, MeritRank and contributor halos closer to “ready for public”.
- Generalize the CoArena rails into a “products bundle” CoModule.
- Integrate GIBindex hooks (M09) with more rigor so AIs can route across products.

For now, W2 keeps scope reasonable:

- Finish defining the new modules.
- Give CoArena a believable productization path.
- Make it easy for CoPrime and future Products sessions to extend these patterns.

