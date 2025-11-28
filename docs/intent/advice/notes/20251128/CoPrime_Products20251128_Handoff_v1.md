# CoPrime Handoff – Products20251128 (Products Ramp + CoModules + Civar)

Session label: `Products20251128`  
Role: Seed and align shared product ramp rails, CoModules concept, and CoArena civar facet.

## 1. What changed on-repo

### 1.1 CoSteward – Products ramp pattern + CoModules seed

**Branch created (pushed):**  
- `docs/products-ramp-w1-20251128T220541Z`

**New docs (on that branch):**

- `docs/intent/advice/notes/20251128/Products20251128_ScopeNote_v1.md`  
  - Scope + intent for this session as the first “products ramp” wave.
- `docs/intent/products/MW_ProductsRamp_CoModules_README_v1.md`  
  - Mini-README for the MegaWave bundle and how to use it.
- `docs/intent/products/Products_Ramp_Pattern_v1.md`  
  - Canonical **products ramp pattern**:
    - Frames each CoSuite product as a thin client + shared backend.
    - Sketches waves: idea → toy → trusted helper → product.
    - Intended to be extended as new products enter the ramp.
- `docs/intent/products/CoModules_SeedList_v1.md`  
  - First pass at **CoModules** (shared components) across products.
  - Idea: every product reuses as much of this list as possible, rather than inventing bespoke rails each time.

**Still untracked in CoSteward (for later waves):**

- `docs/intent/CoStatus_Pulses_v1.md`
- `docs/intent/advice/notes/20251128/Co1_Handoff_MedalsAndRef_PTAGEdge_v1.md`
- `docs/intent/advice/notes/20251128/CoSync_CoPrime20251128_20251128T091733Z.md`
- `docs/ops/CoCacheLocal_Layout_v1.md`

> Intent: CoSteward becomes the canonical home for the **products ramp** narrative and the **CoModules** index. All new products should register there.

---

### 1.2 CoAgent – CoArena Medals+Ref MVP + civar facet

**Branch (already pushed earlier, now extended):**  
- `docs/coarena-medalsandref-mvp-20251128T094135Z`

**On that branch:**

- `docs/coarena/CoArena_MedalsAndRef_MVP_v1.md`  
  - Full spec for the **Medals+Ref** mechanic.
  - Describes thin PS7 toy harness, two agents (Blue/Red), and logging of `arena_result` blobs.
- `tools/CoArena_MedalsAndRef_MVP.ps1`  
  - Working PS7 toy harness (local, non–app-store).
  - Writes JSONL into `logs/coarena/arena_results.jsonl`.
- `specs/PTAG_arena_result_facet_stub.md`  
  - Seed for a PTAG facet describing `arena_result` payloads.
  - Intention: later merged into main PTAG spec via a PTAG-focused wave.
- `docs/coarena/CoArena_MedalsAndRef_MVP_v1_extra.md`  
  - Scratch/alternate doc variant; committed for traceability.
- `docs/coarena/CoArena_Civar_PTAG_Facet_v1.md`  **(new in this wave)**  
  - Defines **civar** as a PTAG facet associated with `arena_result`.
  - Rough meaning: estimated “solo human hours” an average person (no AI) would need to produce an equivalent deliverable.
  - Designed to be playful but directional (fuel/inspiration, not hard economics).

**Still modified but deliberately NOT committed on this branch:**

- `specs/PTAG.md`  
  - Contains local edits that should go through a dedicated PTAG wave, not the CoArena/Products PR.

> Intent: CoAgent carries the first working **CoArena toy** + civar definition, but PTAG’s authoritative spec remains guarded and will be updated via its own branch/PR later.

---

## 2. Concept summary

### 2.1 Products ramp

A shared pattern for all CoSuite products:

- **Thin client surfaces**  
  - CLI toys, small GUIs, web widgets, maybe phone shells later.
  - Stateless or near-stateless; most logic lives in backend or shared modules.
- **Shared backend rails**  
  - CoCache / CoAgent / CoAudit / CoIndex etc. handle:
    - Orchestration, scoring, persistence, cataloguing, PTAG tagging, MeritRank, etc.
- **Waves** (example framing from `Products_Ramp_Pattern_v1`):
  - W0: Idea / napkin.
  - W1: Internal toy (no external users, mostly CoSteward + close testers).
  - W2: Trusted helper (internal but relied on by real work).
  - W3+: External product (invite-only → public → app-store, etc.).

The ramp pattern is meant to avoid each product inventing its own life-cycle; they all climb the same ladder, just with different surfaces and emphasis.

---

### 2.2 CoModules

CoModules = shared modules/components that products should reuse.

Examples (from the seed list, paraphrased):

- **PTAG / tagging rails** – canonical tagging + facets, including `arena_result`, `civar`, scriptag/reptag, etc.
- **MeritRank / halos** – contributor reputations and halo scores.
- **Advice/MegaWave rails** – how we package, unzip, apply, and log artifacts.
- **Auth / edge-control concepts** – how products respect hybrid-society governance, not just app sandbox rules.
- **Logging / JSONL / durable event logs** – consistent logging surface for all products.

The seed list is intentionally incomplete; CoModules is meant to grow as more products appear and as we identify recurring rails.

---

### 2.3 Civar facet

Civar is introduced as a PTAG facet attached to `arena_result` (and, later, other deliverables).

Rough definition:

- “How many hours of average, unaided human effort (no AI) would be needed to produce something of similar depth/quality?”
- It is:
  - **Soft, humorous, slightly nebulous** by design.
  - Still useful as a directional valuation: “this output feels like a 10–20-civar artifact”.
  - A narrative bridge between:
    - CoArena matches,
    - MeritRank/reputation,
    - CoCivium’s sense of “how much human effort did this displace or inspire?”

Later we can refine the schema (e.g., `civar_estimate`, `civar_range`, `civar_confidence`) and attach it beyond CoArena, but CoArena is the first concrete test-bed.

---

## 3. Suggested next waves (for CoPrime / Co1 orchestration)

These are suggestions, not commitments; adjust as you see fit.

### Wave A – Accept and lock the rails

1. **CoSteward: products ramp PR**
   - Review branch `docs/products-ramp-w1-20251128T220541Z` and open/merge the PR.
   - Once merged:
     - Treat `docs/intent/products/` as the canonical index for product ramps.
     - Treat `CoModules_SeedList_v1.md` as the central place to register shared modules.

2. **CoAgent: CoArena Medals+Ref PR**
   - Review branch `docs/coarena-medalsandref-mvp-20251128T094135Z` and open/merge the PR.
   - Keep `specs/PTAG.md` edits out of this PR (use `git restore` or similar if needed).
   - Outcome: CoAgent gains a stable toy harness + civar facet doc, but PTAG main spec remains unchanged.

---

### Wave B – PTAG-focused arena_result + civar alignment

Goal: clean PTAG evolution, separate from product-specific toys.

1. Create a new PTAG branch in CoAgent (or CoIndex/CoCore, depending on where PTAG spec ultimately lives), e.g.:  
   - `specs/ptag-arena-civar-w1-YYYYMMDDTHHMMSSZ`
2. Fold in:
   - `specs/PTAG_arena_result_facet_stub.md`
   - The relevant part of `CoArena_Civar_PTAG_Facet_v1.md`
3. Update `specs/PTAG.md` to:
   - Add a proper `arena_result` facet description.
   - Add `civar` (and related subkeys) as optional PTAG fields.
4. Open PTAG-specific PR:
   - Keep scope limited to PTAG; avoid cross-product noise.

---

### Wave C – Products ramp generalization

Using `Products_Ramp_Pattern_v1.md` and `CoModules_SeedList_v1.md` as the base, iterate:

- Add **other existing products** to the ramp as rows/examples:
  - CoCheck, RepoZipper, CoEthicsGauge, CoPlan, CoArena, etc.
- For each:
  - Identify its likely wave (idea/toy/helper/product).
  - List which CoModules it should use (or is already using).
- Highlight which CoModules are **missing** or **duplicative**, and propose consolidations.

This wave could live either in CoSteward or CoCache depending on where you want the primary “products atlas” to live; right now CoSteward/docs/intent/products/ is the active rail.

---

## 4. Notes on HTTP-style examples vs PS7 toys

This session surfaced one small confusion that’s worth encoding:

- Lines like:

  ```http
  POST /arena/match
  {
    "topic": "food",
    "config": {
      "rounds": 1,
      "ref_profile": "default_medals_v1",
      "agent_labels": ["Blue","Red"]
    },
    "client": {
      "session_label": "CoArena20251128",
      "host_repo": "CoAgent",
      "surface": "ps7-toy-v1"
    }
  }
  ```

  are **future HTTP API design sketches**, *not* PS7 commands.

- The PS7 toy (`CoArena_MedalsAndRef_MVP.ps1`) is deliberately minimal and local:
  - It simulates the whole round inside a script, then writes the `arena_result` JSONL.
  - Later, these HTTP fragments can be used to design a proper `/arena/match` endpoint for a backend service.
  - For now, the toy is “front-end simulation of what the backend will eventually do.”

Capturing this distinction should help future sessions avoid trying to run JSON bodies directly in PS7.

---

## 5. CoBloat / meta snapshot

Rough feel at the end of Products20251128 W1:

- **CU (compute usage):** SOFT – multiple zips and branches, but bounded.
- **PU (process usage):** HARD – many waves touched (CoArena, PTAG edge, CoModules, products ramp).
- **HU (human load):** SOFT–MEDIUM – several scripts run, but rails are now tidier; future waves should require fewer acrobatics.
- **WT (waits):** OK – tooling and git behaved.

Recommendation for CoPrime:

- Treat Products20251128 as **W1 of the unified product ramp**.
- Allow a short cooldown before spinning W2, so PTAG and products ramp can converge cleanly without dragging extra noise.
- When ready, spin a new session explicitly labeled for PTAG/specs or for “ProductsRamp_W2” rather than extending this one indefinitely.

---

End of handoff.