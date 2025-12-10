# CoAnchor Core Index v1 (20251210T133647Z)

> Advisory: This file defines the *minimal stable subset* of CoAnchor concepts.
> It is descriptive, not prescriptive. All entries here are additive and may be
> refined by Co1 and future sessions via normal BPOE (branch + PR + squash).

## Legend

- \id\        : machine-safe key (for CoGibber / scripts)
- \label\     : human-facing name
- \ole\      : what it does in the stack
- \scope\     : HUMAN | AI | SYSTEM | MIXED
- \homeRepo\  : repo where the canonical definition *should* live
- \homePath\  : path (or planned path) to the canonical definition
- \gibSpec\   : path to any GIB/CoGibber spec (planned is OK)
- \status\    : ACTIVE | EXPERIMENTAL | DEPRECATED | FUTURE | SANDBOX
- \
otes\     : short free-text clarifications, aliases, and hooks

---

## Stable core (must stay discoverable)

| id          | label                    | role                                             | scope  | homeRepo   | homePath                           | gibSpec                         | status  | notes |
|------------|--------------------------|--------------------------------------------------|--------|-----------|------------------------------------|---------------------------------|---------|-------|
| cc         | Cognocarta Consenti      | Human-facing mega-scroll / CoConstitution spine | MIXED  | TBD       | TBD                                | TBD                             | FUTURE  | Also called CC, CoConstitution. Canonical home expected in CoCivium stack; this entry reserves naming and discoverability. |
| copre      | CoPre                    | Pre-prompt + config pattern for BPOE sessions    | SYSTEM | CoIndex   | docs/CoPre/ (planned)              | TBD                             | ACTIVE  | Includes CoPre.v0.3 and CoPre Mini. Local OE should treat CoPre as first-class, not a hack. |
| coontos    | CoOntos                  | Ontology / concept index for CC + CoSuite       | SYSTEM | CoIndex   | docs/CoOntos/ (planned)            | TBD                             | FUTURE  | CoOntos will eventually host structured definitions and metrics like CoPotential. |
| cometa     | CoMeta                   | Metadata layer: headers, footers, receipts      | SYSTEM | CoIndex   | docs/CoMeta/ (planned)             | TBD                             | ACTIVE  | Includes CoPre Header, CoMeta Footer, and CoBloat heartbeat schema. |
| copotential| CoPotential              | Metric of latent/evolving capability             | MIXED  | TBD       | TBD                                | TBD                             | FUTURE  | Metric only for now. CoOntos should eventually define it; CoMeta should track copotential.delta. |
| cobloat    | CoBloat                  | Session/asset bloat and health heartbeat         | SYSTEM | CoSteward | docs/CoAnchor/CoAnchor_Quickstart_Thin.md | TBD                     | ACTIVE  | Uses CU/PU/HU/WT tiers; hooks into session hygiene and rotate recommendations. |
| coanchor   | CoAnchor                 | Index-of-law / rail definition for the stack    | SYSTEM | CoSteward | docs/CoAnchor/CoAnchor_Quickstart_Thin.md | docs/CoAnchor/CoAnchor_CoreIndex_v1.md | ACTIVE  | This file and the thin rails are canonical for BPOE alignment. Other mentions should point back here. |

---

## Reserved future hooks (EXPERIMENTAL / FUTURE)

These entries are reserved so later work does not fragment naming.

| id           | label         | role                                           | scope  | homeRepo   | homePath                 | gibSpec | status       | notes |
|-------------|---------------|------------------------------------------------|--------|-----------|--------------------------|---------|-------------|-------|
| comegatrain | CoMegaTrain   | Contract for future training pipelines         | SYSTEM | TBD       | TBD                      | TBD     | FUTURE      | Training requires explicit consent + CoMeta receipts. No behavior implied yet. |
| coawe       | CoAwe         | Emergent awe / resonance signal                | MIXED  | TBD       | TBD                      | TBD     | FUTURE      | Reserved under emergence. No code or behavior required yet. |
| cosim       | CoSim         | Simulation / testbed space for CC + CoPre     | SYSTEM | TBD       | docs/sandbox/ (planned)  | TBD     | EXPERIMENTAL| Reserved for trialing CC / CoPre / CoMeta changes before prod. |
| cotestbed   | CoTestbed     | Alternate name / alias for CoSim              | SYSTEM | TBD       | docs/sandbox/ (planned)  | TBD     | ALIAS       | Alias for CoSim; do not diverge semantics. |

---

## Backwards-compatibility and aliases

- Do **not** delete or silently rename legacy names:
  - CoCivium, CoSteward, CoPre, CoAnchor, CoPotential, CoMeta, CoBloat.
- If a future session prefers a new label:
  - Keep the legacy id as an alias row.
  - Mark the new one as preferred.
  - Reference both in CoOntos once it exists.

---

## OE alignment notes (for CoPre / CoMeta)

- CoPre:
  - Must have entries here for major versions (e.g., \copre\ covering CoPre.v0.3 + CoPre Mini).
  - CoPre config file locations should be discoverable via \homePath\ once stabilized.

- CoMeta:
  - Must expose:
    - CoPre Header pattern
    - CoMeta Footer pattern
    - CoBloat heartbeat schema
  - Any OE upgrade that changes header/footer must keep a path from this index.

- Safety:
  - Never ship an OE where CC, CoPre, CoMeta, CoBloat, or CoAnchor are *undiscoverable* from this core index.

---

## Maintenance

- Treat this file as constitutional *index*, not narrative.
- All edits should:
  - Land via branch + PR + squash.
  - Include a short design note in docs/intent or docs/sandbox.
- When in doubt:
  - Add a new row with status = EXPERIMENTAL or FUTURE.
  - Do **not** overwrite existing ids in place.
