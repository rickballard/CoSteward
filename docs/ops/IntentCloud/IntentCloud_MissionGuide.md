# CoPrime_IntentCloud2025 Mission Guide (seed-stage v0)

Status: EXPERIMENTAL / SEED
Mission id: CoPrime_IntentCloud2025_Mission
Session label (this run): CoPrime20251112
Line: Co1 (UNBOUNDED)

This guide explains how **Co1** and mission-local slave sessions can use the
IntentCloud stack built in MW1–MW4. It is intentionally light and should be
refined by later missions rather than bloated here.

## 1. Mission frame

- MW triple (MISSION-LOCAL ONLY): MWDone=5, MWPlan=5, MWBudget=7
- IntentCloud is a **mission-local map of intents** and where they live.
- Co1 stays unbounded; this mission just gives Co1 better eyes and handles.

## 2. IntentCloud doc stack

Core docs produced by CoPrime_IntentCloud2025_Mission:


Surfaces docs live alongside this guide as IntentCloud_Surface_*.md files.
Each surface doc lists files under a given root (per repo + label).

Reading order (suggested):

1. Inventory — to see which **intent domains** exist at all.
2. Surfaces index — to see where intents live across repos/surfaces.
3. Buckets manifest — to see which surfaces to mine for each bucket.
4. Bucket seeds — to see concrete file paths to start from.

## 3. Buckets overview (mission-local heuristics)

Buckets for this mission:
- CoTheory: CoCivium theory / deep frames / CoTheory-of-everything.
- CoEvo: evolution rails, CoEvo theory, auto-evolution helpers.
- CognoCarta: CognoCarta / Consenti / civic-contract frames.
- CoCore: schemas, best-practice domains, structured models.
- Orchestration: CoAgent / CoArena / CoSyncBus / megascrollers.
- Websites: narrative surfaces and public-facing assets.
- Archives: legacy material and CoCivium archive rehydration hints.
- MetaRails: CoAudit, CoStatus, BPOEs, IntentCloud itself.

Buckets are **not** exclusive or final; they are a seed classification for
this mission only. Future missions can split/merge/rename buckets as needed.

## 4. How Co1 should use this stack

For Co1 (and trusted slave sessions), suggested workflow:

a) Pick a bucket that matches the current mission (e.g., CoTheory or CoEvo).
b) Open IntentCloud_BucketSeeds.md and locate that bucket section.
c) Choose 3–10 **HIGH** or **MED** priority file seeds as starting points.
d) Spin up a **mission-local slave session** whose job is to:
   - Read those seeds.
   - Build its own checklists / megascrollers / BPOE notes.
   - Propose changes in the relevant repos via short branches + PRs.

Important guardrails:

- Treat IntentCloud docs as **coordination rails**, not the place to store
  every detail. Let downstream sessions maintain their own artifacts.
- When a slave session produces important new patterns, it should:
  - Update the relevant repo (CoSteward/CoCache/CoCivium/etc.) via PR.
  - Optionally add a short note to the Inventory or Buckets manifest in a
    future IntentCloud mission, rather than editing this v0 mapping ad hoc.
- CoStatus / CoBloat lines should treat IntentCloud docs as **lightweight**
  references; heavy content belongs in repos and megascrollers.

## 5. How slave sessions should report back

Each mission-local slave session seeded from IntentCloud should leave a trail:

- CoSync note under docs/intent/advice/notes/YYYYMMDD/CoSync_*.md.
- Short summary of:
  - Which **bucket** and **seeds** were used.
  - Which repos/paths were touched.
  - Links to PRs and megascrollers.

This keeps Co1 and future IntentCloud missions aware of which regions are
being actively evolved, without turning IntentCloud into a backlog dump.

## 6. Suggestions for a future IntentCloud mission (v1+)

These are *not* in scope for this mission; they are hints for a future one:

- Add **content-aware** scoring for seeds (not just filename heuristics).
- Add simple tags (e.g., @ready, @risky, @archive) to seeds.
- Add a micro-dashboard showing which buckets have active slave missions.
- Add light integration with CoAudit sweeps so IntentCloud can surface
  red flags or stale areas that need attention.

Until then, treat this v0 stack as a **map + compass** for Co1: enough to
point in useful directions, but not yet a full GPS.

