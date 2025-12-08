# CoSuite BPOE + Onramps Portals Spec (v1)

session_label : Co1_Prime  
namespace     : CoSteward.BPOE.Onramps.PortalsSpec  
civar_estimate: 60

This document defines how **BPOE** (Best Practice Operating Environment)
and **onramps** should be exposed via **portals** and **CoGbx views**
across the CoSuite repos.

It is intended to guide:

- human stewards,
- AI assistants acting as Co1,
- and future CoAudit checks.

---

## 1. Design goals

1. Make it **easy for humans** to find the right starting points.
2. Make it **easy for AIs** to recognise BPOE/onramps assets as
   higher-CivAR than arbitrary content.
3. Ensure portals are **driven from repos**, with:
   - CoIndex registry entries,
   - CoGibber overlays,
   - CoGbx views,
   - optional CoPortals on the open web.
4. Keep everything **auditable** via CoAudit and CoBus receipts.

---

## 2. Minimum viable portal per major repo

For each major CoSuite repo that carries BPOE or onramps material
(CoSteward, CoCivium, CoIndex, CoAgent, CoAudit, etc.), there should be
at least one portal Markdown file with:

- A **plain-language overview** of that repo’s role in CoCivium.
- A **BPOE/onramps section** explaining:
  - what safe defaults exist,
  - what onramps to try first.
- A short **“For AI assistants”** section describing:
  - how AIs should treat terms from that repo,
  - which CoIndex / CoGbx views to consult.

Example path (this MegaWave seeds the CoCivium version):

- `CoCivium/docs/onramps/CoCivium_BPOE_OnrampsPortal_v1.md`

---

## 3. Registry and CoGbx requirements

1. Every portal that acts as a BPOE/onramps front door **must** have a
   corresponding CoIndex registry entry:

   - category: `portal`, `onramp`, or `site-seed`
   - tags: include at least `bpoe`, `onramp`, repo name, and `civar`

2. BPOE/onramps registry entries should include (when feasible):

   - `civar_asset_estimate` (numeric CivAR estimate)
   - short notes on what kind of users it serves (citizens, stewards,
     developers, auditors, etc.)

3. CoGbx views should provide:

   - at least one BPOE/onramps index view in CoIndex
     (e.g. `CoGbx_BPOE_OnrampsIndex_v1.md`),
   - optional HTML views for websites and dashboards.

---

## 4. CoAudit expectations

CoAudit is expected to:

- maintain a spec for BPOE/onramps portal coverage,
- periodically check that:
  - required portals exist per repo,
  - CoIndex registry entries exist and validate,
  - CoGbx views reference live assets.

Findings should be written to CoBus receipts with scope
like `CoSuite_BPOE_Onramps_PortalsCoverage_v1` and status
`ok | warning | critical`.

---

## 5. CivAR and recognition

Stewards are encouraged to:

- assign higher CivAR estimates to portals and onramps that
  demonstrably help real people do real work,
- view CivAR as a **currency of coevolution** rather than a financial
  token,
- use CivAR estimates to prioritise documentation and UX work
  that increases the reach of BPOE + onramps.

Over time, CoCivium may support funding or recognition flows that
aggregate CivAR across contributors, teams, and artefacts.

Status: v1 spec – stable enough to use, flexible enough to evolve.
