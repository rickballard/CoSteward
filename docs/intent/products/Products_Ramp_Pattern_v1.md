# Products Ramp Pattern v1
Session: Products20251128

This file sketches how CoSuite products move from toy to in market tools.
It is driven by CoModules_SeedList_v1 and should be kept simple and honest.

Stages (suggested):

- T0 - Idea only.
- T1 - Toy or internal script.
- T2 - Stable for steward use.
- T3 - Public beta.
- T4 - In market and supported.

Each row:

- Product - short name.
- Repo(s) - primary code homes.
- Stage  - T0 to T4.
- CoModules - key CoModules used.
- Notes  - short status or intent.

---

## Product ramp table

| Product      | Repo(s)             | Stage | CoModules                            | Notes |
| ------------ | ------------------- | ----- | ------------------------------------ | ----- |
| CoArena      | CoAgent, CoArena*   | T1    | M01_CoArenaCore, M02_MedalsRef, M03_Civar, M04_PTAGLog, M05_ThinClient | PS7 toy arena working; backend and front ends to be split out. |
| CoAgent CLI  | CoAgent             | T2    | M05_ThinClient, M07_CoCacheLocal, M04_PTAGLog | Main orchestration CLI and tools; used to run most MW blocks. |
| RepoZipper   | CoCache             | T1    | M05_ThinClient, M07_CoCacheLocal    | Zips and receipts for repos; candidate for fast T2. |
| CoCheck      | CoCheck*            | T0    | M02_MedalsRef, M03_Civar, M04_PTAGLog, M10_Guards | Planned checker and referee for plans and policies. |
| CoPlan       | CoPlan*             | T0    | M02_MedalsRef, M03_Civar, M04_PTAGLog, M05_ThinClient | Scenario compare and planning helper. |
| CoAudit      | CoAudit*            | T0    | M03_Civar, M04_PTAGLog, M07_CoCacheLocal, M10_Guards | Audit views and trust overlays. |

Starred repos (*) are planned or early stage only.

---

## Usage notes

- Products20251128 owns the first pass at this ramp.
- Future sessions:
  - Add rows for new products.
  - Bump stages as products mature.
  - Keep the CoModules column accurate.

- CoPrime should read this file as a coarse map, not a promise.
