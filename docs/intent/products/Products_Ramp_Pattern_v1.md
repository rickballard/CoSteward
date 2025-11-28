# Products Ramp Pattern (v1)

Intent: give every CoSuite product a **similar production ramp** so the ecosystem
feels coherent and reuse of modules ("CoModules") is easy.

This pattern is generic; individual products (CoArena, CoCheck, CoEthicsGauge,
RepoZipper, etc.) should each maintain their own `Product_Ramp_<ProductName>_vN.md`
based on this shape.

---

## 1. Product identity

- **Name**: e.g. `CoArena`, `CoCheck`, `CoPlan`.
- **One-liner**: short description aimed at humans.
- **Primary users**: examples of who uses it first (CoStewards, testers, public).
- **AI-facing role**: how AIs are expected to use/consume the product.

## 2. Surfaces (thin clients)

Goal: keep clients **very thin** and centralize most intelligence + orchestration
in shared backend rails.

Typical surfaces:

- PS7 toy / CLI harness (like the CoArena Medals+Ref MVP).
- Simple web surface (internal, non–app-store at first).
- Optional: integration surface (e.g. VS Code extension, Discord bot, etc.).

For each surface, define:

- UX goals (what you want the user to feel + learn).
- Constraints (what it explicitly does not do).
- Telemetry hooks (what gets logged in PTAG / metrics).

## 3. Backend rails

For each product, identify which rails it depends on:

- **Inference**: which AI provider(s) / accounts (initially likely one account in
  Rick’s name, later multiple / pluggable).
- **PTAG layer**: envelopes and key facets (e.g. `arena_result`, `civar`, etc.).
- **MeritRank / Scriptag / Reptag**: how episodes and contributions get rated.
- **Storage**: logs (jsonl), CoCache, long-lived assets (docs, diagrams, zips).
- **Orchestration**: where the runbooks live (CoAgent, CoSteward, CoCore).

Each product ramp should call out which rails are **required** vs **optional**.

## 4. Lifecycle stages

1. **Concept sketch**
   - A short note (1–2 pages) plus example interactions.
   - Lives in `docs/intent/` of an appropriate repo.

2. **Toy / MVP (non–app-store)**
   - Single-surface harness (PS7 or minimal web).
   - Very small tester set (friends, CoStewards).
   - Logs PTAG envelopes (even if only partially filled).

3. **Internal ramp**
   - Product is used regularly inside CoSuite.
   - CoModules dependencies are factored out where obvious.
   - CI check(s) exist for basic sanity.

4. **External pilot**
   - Invite-only cohort outside the core team.
   - Data + PTAG logs reviewed regularly.
   - Product docs exist in a public-facing repo (e.g. CoPolitic, InSeed).

5. **Public / app-store candidate**
   - Legal / risk review (CoEthicsGauge, CoSteward).
   - Edge-control story is clear (who owns what, how AI access works).
   - Telemetry + PTAG facets stable enough for long-term analytics.

## 5. Shared metrics / PTAG

Every product ramp should define:

- What PTAG facets matter most (e.g. `arena_result`, `civar`, `ux_session`).
- How session-level PTAG envelopes are created and stored.
- Minimal dashboards / readouts (even if just PS7 scripts).

See `CoArena_Civar_PTAG_Facet_v1.md` for an example of a product-specific facet
that still follows common PTAG idioms.

## 6. CoModules integration

For each product, maintain a small table:

| Area            | Uses CoModule? | Module name         | Notes                     |
|-----------------|----------------|---------------------|---------------------------|
| Auth / edge     | yes/no         | e.g. `CoEdgeAuth`   |                           |
| Logging / PTAG  | yes/no         | e.g. `CoPTAGCore`   |                           |
| UX templates    | yes/no         | e.g. `CoUXPrompts`  |                           |
| Storage / cache | yes/no         | e.g. `CoCacheCore`  |                           |
| Merit / ranking | yes/no         | e.g. `CoMeritRank`  |                           |

Products that don’t yet use CoModules should still fill this table with
“future candidate” notes.

## 7. Handoffs and ownership

- Each product ramp document should name:
  - Current **product steward** (human).
  - Current **product AI steward** (session label or Co-nickname).
- It should also link to:
  - The most recent CoSync note for that product.
  - Any MegaWave bundles associated with major evolutions.

---

This pattern is intentionally lightweight. CoPrime / CoSteward can harden it into
a formal standard once a few products have been run through it.
