# BPOE – CoIndex Registry Governance v1

Role: Define best practice operating environment for the CoGibber / CoGbx registry spine hosted in \ickballard/CoIndex\.

## 1. Roles

- CoSteward (human)  
  - Defines intent and guardrails for the registry.  
  - Approves major schema changes.

- Co1 (co1-orchestrator)  
  - Plans and runs full-index waves.  
  - Maintains registry quality over time.

- CoIndex  
  - Hosts registry artefacts and local health tools.

- CoAudit  
  - Provides independent integrity checks and watchdog signals.

- Site builders (CoCivium.org, CoGbx.org, etc.)  
  - Consume registry, do not become registry.

## 2. Files that define the registry spine

In CoIndex:

- Registry JSON:
  - \xports/gibber/cogibber.registry.v1.json\
- Registry schema:
  - \schemas/cogibber.registry.v1.schema.json\
- Health invariants:
  - \docs/trove/CoIndex_RegistryHealthInvariants_v1.md\
- Human views:
  - \xports/views/*\
  - \xports/assets/CoGbx_RegistryViewer_v1.html\
- CoBus receipts:
  - \docs/intent/cobus/receipts/**\ with scopes related to registry, CoGibber, CoGbx.

## 3. Change rules

- Registry, schema, and invariants must be changed by **pull request only**.
- PRs changing these files should:
  - Be labelled with \egistry-change\ (or similar).
  - Include a short explanation of:
    - what changed,
    - why,
    - which waves or tools were involved.
- CI must pass:
  - schema validation workflow for registry JSON.

Manual emergency edits are allowed only when:

- There is a clear incident,
- PR text documents why,
- A follow up scripted wave is planned to restore clean rails.

## 4. CoBus usage

- All major waves touching registry or health must emit CoBus receipts.
- Scopes should distinguish:
  - \plan\
  - \index-wave\
  - \udit\
  - \health-report\
- CoIndex and CoAudit should both emit receipts into lanes where Co1 can see them.

## 5. Trust and attack surface

BPOE expectations:

- Registry files are treated as critical guardrail artefacts.
- Any consumer (sites, tools) should treat registry as source of truth and avoid copying core data into private, mutable silos.
- CoAudit acts as an always on second opinion:
  - If CoAudit signals \critical\, Co1 should treat this as a priority guardrail incident.

Future BPOE revisions will further define:

- Hash / Merkle usage.
- CoBloat metrics for registry size and complexity.
- Edge control expectations for third party consumers.
