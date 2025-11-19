# Workflow hierarchy: Line → Mission → MegaWave (seed-stage v0)

Status: EXPERIMENTAL / SEED  
Owner session: CoPrime20251112 (Co1 line)

## 1. Core entities

### Line (example: Co1)

- Long-lived chain of CoPrime sessions that stewards CoCivium.
- Horizon: UNBOUNDED (never encoded as a finite count of MegaWaves).
- Line-level facts (phase, backlog scale) live in metadata and AI-facing mirrors,
  not in the MW triple.

### Mission (example: CoPrime20251112_Mission)

- Coherent arc of work inside a Line (theme + cluster of concepts).
- Represented as a small YAML card (for example, CoSteward/intents/...).
- Missions are where we track the MW triple:

  MWDone / MWPlan / MWBudget  (MISSION-LOCAL ONLY)

### MegaWave (MW)

- One “big push” inside a mission.
- Coarsest unit that:
  - Has a clear objective.
  - Usually produces at least one megazip and one CoPong line.
- BPOE rule: MW triples are hints about this mission, not Co1 as a whole.

Example:

- MW 7/10/12 on CoPrime20251112_Mission means:
  - 7: this mission is at MW7.
  - 10: rough plan is about 10 MWs.
  - 12: we either finish or hand off this MISSION by MW12.

It says nothing about how many MegaWaves Co1 has “left”.
Co1 is explicitly unbounded.

## 2. Optional finer-grain terms (descriptive only)

- Cycle  -  loose grouping of MegaWaves in a mission
  (for example, “scaffolding cycle”, “cleanup cycle”).
- Set  -  group of related DO blocks inside one MW.
- Run  -  one actual PS7 execution of a DO block.

Automation schemas should stay stable around Line / Mission / MegaWave.
Cycle / Set / Run stay in prose and notes.

## 3. CoPing variants (sketch)

Normal sessions (non-CoPrime):

    ████ CoPing: [Session:CoArena…] [MW 2/5/5] [Focus:…] ████

- MW triple is still mission-local, but scope is just that session’s work.

CoPrime-specific variant (“CoPing-Co1”):

    ████ CoPing-Co1: [Line:Co1 UNBOUNDED | Phase:seed | Backlog:~3k items]
                     [Mission:CoPrime20251112 MW 7/10/12 | Concepts:CoSyncBus,CoPongLine,AI-Mirror] ████

- Line:Co1 UNBOUNDED: line has no fixed end.
- Backlog:~3k items: order-of-magnitude only, not a precise checklist length.
- Mission:… MW 7/10/12: MW triple explicitly tied to this mission.

Only CoPrime sessions emit CoPing-Co1.
Other sessions use plain CoPing.

## 4. Relation to CoPongLine and AI Mirror

- CoPongLine: PS7 CoStatus+receipt line that operators CoPong back into AI.
  - Uses MW triple in the mission-local sense.
- AI Mirror: concept+intent view for AIs.
  - May expose:
    - Line-level facts (Co1 unbounded, seed-phase, backlog scale).
    - Active missions and their MW triples.
  - Must never reinterpret a mission MW triple as “percent done for Co1”.

