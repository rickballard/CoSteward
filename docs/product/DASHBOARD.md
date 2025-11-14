# CoSteward Products Dashboard

_Last refresh: 20251114T005718Z (UTC seed)_

> NOTE  
> Seed dashboard doc. Safe to commit as-is. Automation can be layered later.

---

## A. Header / Pulse

- **CoPing / CoStatus line placeholder**  
  - Rendered by **canonical Co1 helpers/scripts** (not defined here).  
  - This doc only reserves a visual slot for whatever Co1 decides is canonical.

- **Current MegaWave (conceptual placeholder):**
  - MW id: _(filled by Co1 / CoPrime)_
  - Scope: BPOE + productization + CoCacheGlobal / CoCivia
  - Links: see sections below

---

## B. Portfolio Snapshot (Products)

| Product              | Track      | Health | Next Focus / MW Goal                | Key PRs / Links                     | Steward |
|----------------------|-----------:|:------:|-------------------------------------|-------------------------------------|---------|
| CoAgent (Commercial) | Enterprise |  🟢    | Pilot flows, CoPrime orchestration  | `CoAgent` repo, product manifest    | Rick    |
| CoArena              | Consumer   |  🟡    | v0.x playable, store-ready build    | `CoCache` CoArena MW PRs           | Rick    |
| CoCacheGlobal        | Infra/AI   |  ⚪    | Mythos + heartbeat + status ingest  | `CoCacheGlobal/docs/CoCivia/Home`  | Rick    |

---

## C. Module Hotlist

| Module          | Repo          | 7-day Attention | Trend | Status | Intent path                        |
|-----------------|---------------|----------------:|:-----:|--------|------------------------------------|
| co-sync-bus     | CoCache       |      _(TBD)_    |  ↗    | Beta   | `docs/intent/cosync/`              |
| co-agent-shell  | CoAgent       |      _(TBD)_    |  →    | Seed   | `docs/product/CoAgent_Manifest`    |
| cocivia-mythos  | CoCacheGlobal |      _(TBD)_    |  ↗    | Seed   | `docs/CoCivia/Home.md`             |

---

## D. Risks & Drift

- Interface drift: top-down CoAgent vs bottom-up CoModules.
- Repo sprawl risk: too many lightly-used repos; candidate consolidation list TBA.
- Human load: seed-stage CoSteward juggling many sessions; aim to automate CoPrime-led flows.

---

## E. Key Links

- BPOE workflow: `ops/CoSuite_BPOE_Megazip_CoPingPong.md`
- CoCacheGlobal home for CoCivia: `CoCacheGlobal/docs/CoCivia/Home.md`
- CoAgent branding: `CoAgent/docs/branding/CoAgent_Logo_Usage.md`

This page is meant to be glanced at before deciding where to send the next MegaWave.
