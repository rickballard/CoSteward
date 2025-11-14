# CoSync — CoPrime_IntentCloud2025 v0 ship receipt

- Session label: CoPrime20251112
- Mission id: CoPrime_IntentCloud2025_Mission
- Line: Co1 (UNBOUNDED)
- MW triple (mission-local): MWDone=5, MWPlan=5, MWBudget=7

## Scope

This CoSync note records the IntentCloud v0 stack shipped to CoSteward main.
The mission goal was to give Co1 a light, mission-local map of intents and
where they live across CoSteward / CoCache / CoCivium, without turning
IntentCloud into a backlog dump.

## IntentCloud v0 docs (CoSteward main)

- docs/ops/IntentCloud_Inventory.md
- docs/ops/IntentCloud/IntentCloud_SurfacesIndex.md
- docs/ops/IntentCloud/IntentCloud_Buckets_Manifest.md
- docs/ops/IntentCloud/IntentCloud_BucketSeeds.md
- docs/ops/IntentCloud/IntentCloud_MissionGuide.md
- docs/ops/IntentCloud/IntentCloud_Surface_*.md

Entry point for Co1 and slave sessions:

- Primary: docs/ops/IntentCloud/IntentCloud_MissionGuide.md
- For structure: Inventory → SurfacesIndex → Buckets → BucketSeeds.

## Megazips produced during mission (local Downloads at time of run)

- CoPrime20251112_MW3_IntentCloudBuckets_Megazip.zip
  - SHA256: C557A596C1B187E9D7BFA5E7C46C9521F63A993CC066385099F6B02EE61CF80B
- CoPrime20251112_MW4_IntentCloudSeeds_Megazip.zip
  - SHA256: 66951DDD1886A6CF972702313E619F85A3927064DDD329EF20B1E781D822502E
- CoPrime20251112_MW5_IntentCloudGuide_Megazip.zip
  - SHA256: E6AF30702BA63919FD2E78015F1C4B866C37D2DD2FB23330F7F98B0D74CF861F

Earlier MWs also produced megazips; this receipt focuses on the final
Inventory / Surfaces / Buckets / Seeds / MissionGuide bundle that landed on main.

## How Co1 should treat this (v0 posture)

- Treat IntentCloud v0 as map + compass, not GPS.
- Use BucketSeeds per-bucket lists to spin up mission-local slave sessions
  (e.g., CoTheory / CoEvo / CognoCarta / CoCore / Orchestration / etc.).
- Slave sessions should:
  - Mine seeds, build their own checklists / megascrollers / BPOE notes.
  - Propose changes via short branches + PRs in the relevant repos.
  - Keep IntentCloud docs light by not dumping full backlogs into them.

## Handover notes for future IntentCloud missions (v1+)

- Add content-aware scoring / tags for seeds (beyond filename heuristics).
- Add a micro-dashboard for which buckets currently have active missions.
- Consider light integration with CoAudit sweeps to flag stale or risky areas.

This mission is considered v0 complete once this note exists and
CoSteward main reflects PR #149 (IntentCloud v0 seed). Further evolution
should be handled by future IntentCloud missions rather than extending v0.

