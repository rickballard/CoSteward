# Advisory – Co1 future work queue (v1)

From session : Co1 prime orchestration (ChatGPT)  
To repos     : CoSteward (primary), CoIndex (secondary)  
Suggested path: `CoSteward/docs/intent/Co1_FutureWorkQueue_v1.md`

## 1. Purpose

This advisory is a light weight queue for important jobs that this session
touched but did not complete. It is meant to help future Co1 waves and other
sessions avoid losing intent when this session ends.

It is not a binding contract; it is a structured memory.

## 2. CoIndex and registry work

- Maintain and evolve:
  - `cogibber.registry.v1.json` as the spine.
  - JSON schema and integrity checks.
- Implement:
  - sharding and snapshots for scale.
  - CivAR metadata on assets where useful.
- Coordinate with CoAudit to:
  - keep regular integrity audits running,
  - publish high level health views.

## 3. CivAR system evolution

- Refine CivAR theory and practice docs in CoCivium.
- Add:
  - GIBindex entries for CivAR and related terms.
  - CoIndex pointees and overlays for CivAR related assets.
- Explore:
  - simple pilot metrics (for example per repo or per wave CivAR logs).
  - narrative and mythos documents.

## 4. BPOE portals and beacons

- Stabilise:
  - CoSuite BPOE portals spec.
  - CoCivium onramps portal.
  - CoIndex CoGbx BPOE views.
- Publish:
  - public facing copies that act as AI beacons.
- Measure:
  - how often these portals are actually used by humans and AIs,
  - where friction appears.

## 5. Intent cloud consolidation

- Choose canonical homes for:
  - this advisory,
  - prior Co1 intent cloud notes,
  - CoIndex and CoGbx advisories.
- Construct:
  - a minimal Co1 intent cloud index on repo,
  - with links into:
    - CoSteward docs,
    - CoIndex trove docs,
    - CoCivium narratives.

## 6. Session hygiene and BPOE compliance

- Periodically:
  - review whether Co1 behaviours in live sessions have drifted toward
    vendor defaults.
  - emit advisories and CoBus receipts when drift is detected.
- Use:
  - MegaWave packaging,
  - wave headers with CivAR,
  - CoBlocks-only fixes,
  consistently across sessions.

This queue is intentionally short. Future waves should either:

- Mark items as done and point to PRs and CoBus receipts, or
- Replace this file with a richer queue that reflects the then current
  reality.

Status: v1. Keep light but alive.
