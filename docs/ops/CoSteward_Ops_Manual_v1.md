# CoSteward Operations Manual v1

Role: Canonical “how CoSteward works” guide for humans and sessions.
Everything else (CoSessionRegistry, CoCron, CoBus, CoStatus, CoIndex helpers, CoPlan registries)
should stay consistent with this Manual.

## 1\. Scope \& invariants

* Repo-first: CoSteward documents how CoSuite operates; repos are the source of truth.
* CoPrime / Co1: Current CoPrime session owns cross-repo orchestration but must leave a trail here.
* Non-truth: CoIndex and GIBindex map *sources and positions*, not “truth verdicts”.

## 2\. Core rails (MUST stay synced with this Manual)

* Session registry:

  * File: docs/intent/CoSessionRegistry\_v1.md
  * Purpose: Append-only list of long-running sessions and their handoffs.

* CoCron:

  * File: docs/intent/CoCron\_v1.md
  * Purpose: Recurring jobs (human-run now, CI-ready later).

* CoStatus:

  * File: docs/bpoe/CoStatus\_SessionHealthSpec\_v1.md
  * Purpose: How we think about session health (CU/PU/HU/WT, OK/SOFT/HARD/FATAL).

* CoBus:

  * Example file (CoCivium): CoCivium/docs/intent/bus/CoBus\_Events.md
  * Spec file (CoCivium):   CoCivium/docs/intent/bus/CoBus\_Events\_Spec\_v1.md
  * Purpose: Append-only event log across repos.

* CoPlan registries:

  * CoPlan/docs/registry/CoProducts\_v1.md
  * CoPlan/docs/registry/CoInitiatives\_v1.md

* CoIndex helpers:

  * CoIndex/docs/helpers/ProtoCoIndexHelper\_v1.md
  * CoIndex/docs/intent/CoIndex\_SeedAssets\_v1.md

## 3\. How to use this Manual (for CoPrime / Co1)

When a major rail changes (for example):

* New session types or naming conventions,
* New CoCron jobs,
* New CoBus event kinds,
* New Product/Initiative IDs in CoPlan,
* New ProtoCoIndexHelper schema or examples,

Then:

1. Update the relevant files in their home repos.
2. Add or tweak references here in the Manual so future CoStewards know where to look.
3. Mention the change in:

   * A CoSync note for the relevant session, and
   * CoSessionRegistry (if it alters how sessions behave).

## 4\. Open questions / TODOs

* TODO: Add a diagram of how CoSteward, CoPlan, CoIndex, CoBus, CoCron, and CoSessionRegistry relate.
* TODO: Clarify how CoPrime sessions should periodically review CoStatus \& CoSessionRegistry.
* TODO: Add links to key BPOE documents (naming, DO-block conventions, AdviceBomb handling).

## 5\. Changelog

* v1 (seeded by CoPrime20251128):

  * Created initial skeleton and linked core rails.
