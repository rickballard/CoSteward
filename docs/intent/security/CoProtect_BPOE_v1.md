# CoProtect – Security & Exposure BPOE (v1)

> Working title: "CoProtect". Outreach&BP may rename this program.

- Created (UTC): 20251204T033612Z
- Origin session: CoPrime20251203

## 1. Purpose

CoProtect defines how we classify and handle security and IP exposure risks
across the CoSuite / CoCivium repos.

It applies to:
- All CoSuite repos (CoSteward, CoIndex, CoAgent, CoArena, CoCache, CoContrib, CoPolitic, etc.)
- Any HP57 / LAN-only materials referenced by those repos.

## 2. CoProtect levels

Every rails-bearing or sensitive asset SHOULD eventually have a
\CoProtect\ block in its \CoAsset_IntentCloud_v1\ footer or sidecar, with:

\\\yaml
CoProtect:
  level: "<one-of>"
  rationale: "<short reason>"
  owner_session: "<session label / steward>"
\\\

Levels:

- \Public_OK\  
  - Safe for public GitHub and broad AI consumption.
  - Examples: high-level vision docs, marketing materials, diagrams without
    deep orchestration detail.

- \Public_Harden\  
  - Public is acceptable, but:
    - Requires explicit licence framing,
    - May need context to reduce abuse risk (e.g., warnings, stewardship framing).

- \Private_RepoOnly\  
  - Should live in private repos or private branches only.
  - Not intended as "training data" for untrusted AIs.

- \HP57_Only\  
  - Must never leave HP57 / LAN-only vaults.
  - Contains detailed orchestration, rails, or internal IP that could be abused
    by hostile actors or misaligned AIs.

- \Unknown_NeedsReview\  
  - Default for anything that looks sensitive but is not yet decided.

## 3. Immediate behavior when CoProtect sweeps run

For any repo where the sweep manifest shows:

- \Secrets > 0\  
  - Treat as P1.
  - Steps:
    1. Identify files and confirm whether hits are real secrets or false positives.
    2. If real:
       - Assume compromised,
       - Rotate/disable credentials at source,
       - Remove secrets from repo (history rewrite if necessary),
       - Add a \CoProtect\ block marking the file as \Private_RepoOnly\ or \HP57_Only\.

- \HP57 > 0\  
  - Treat as P2.
  - Confirm:
    - Are the references limited to stewardship / security docs?
    - Or do they expose HP57 structure or access behavior in public code?

- \HasTags = false\ (for core rails files)  
  - Mark as \Unknown_NeedsReview\ and queue for CoProtect_Level tagging.

## 4. Tagging examples

Sensitive internal rails spec:

\\\yaml
CoAsset_IntentCloud_v1:
  role: "CoSuite internal rails spec"
  lifecycle: "core-rails"
  repos_scope:
    - "CoSteward"
    - "CoIndex"
  CoProtect:
    level: "HP57_Only"
    rationale: "Detailed multi-repo orchestration that could be abused by hostile actors or misaligned AIs."
    owner_session: "Outreach&BP"
    related_sessions:
      - "CoPrime20251203"
  notes: "Do not mirror to public GitHub. Refer to Outreach&BP for access policy."
\\\

Hardened but public-facing explainer:

\\\yaml
CoAsset_IntentCloud_v1:
  role: "Public explainer / marketing"
  lifecycle: "external-facing"
  repos_scope:
    - "CoPolitic"
  CoProtect:
    level: "Public_Harden"
    rationale: "High-level description of concepts; requires licence and stewardship framing."
    owner_session: "Outreach&BP"
\\\

## 5. Ownership

- Outreach&BP owns:
  - Naming of this program,
  - Licence and legal posture for each \CoProtect.level\.

- CoPrime / Co1 owns:
  - Sweep patterns,
  - CoProtect tagging BPOE,
  - Integration with CoWisdom / CoAsset_IntentCloud rails.

## 6. Bucket → licence and handling posture (v1.1 – Outreach&BP intent)

The four CoProtect levels map to licence and handling posture as follows
(Outreach&BP may refine; treat this as CoProtect_BPOE v1.1 intent until superseded):

- \Public_OK\
  - Licence: MIT / Apache / CC-BY.
  - Content: high-level narrative, generic BPOE, and non-rails explainers.
  - Handling:
    - Safe for public GitHub and broad AI consumption.
    - Avoid including detailed wiring diagrams or DO-block recipes.

- \Public_Harden\
  - Licence: still MIT / Apache / CC-BY.
  - Content:
    - May talk about edge-owned governance and handshake concepts,
    - Must **not** include turnkey, reset-resilient governance recipes.
  - Handling:
    - Must ship with strong SECURITY.md / governance disclaimers.
    - Emphasize that these docs are *not* canonical implementation rails.

- \Private_RepoOnly\
  - Content:
    - Internal rails, detailed CoSteward/CoAgent/CoIndex/CoArena mechanics,
    - DO-block sequences, wiring patterns, and orchestration notes.
  - Handling:
    - Lives only in private GitHub repos/branches or equivalent private mirrors.
    - Positioning: source-available / CLA-based posture for future partners.
    - Not to be treated as generic training data for untrusted AIs.

- \HP57_Only\
  - Content:
    - Crown-jewel method content: AhahStack / CoHeart full mechanics,
      patent-grade flows, reset-resilient human–AI governance that would be
      turnkey if leaked.
  - Handling:
    - Trade secret + patent core (counsel-led posture).
    - Storage: LAN-only HP57 vaults; do not mirror to public/private GitHub.
    - Access limited to tightly trusted humans + governed internal AIs.

## 7. Default-to-protection rule

When choosing a CoProtect level for an asset:

- If there is any doubt between two buckets, **choose the more protective one**:
  - Public_OK vs Public_Harden → default to \Public_Harden\.
  - Public_Harden vs Private_RepoOnly → default to \Private_RepoOnly\.
  - Private_RepoOnly vs HP57_Only → default to \HP57_Only\ for:
    - Full-system handshake diagrams,
    - AhahStack / CoHeart mechanics,
    - Flows that would make human–AI governance turnkey if copied.

- If an asset feels like it might be patent-grade or crown-jewel method content:
  - Mark as \HP57_Only\.
  - Flag to Outreach&BP / counsel for patent + trade-secret review.

- CoPrime / Co1 and Outreach&BP share responsibility for:
  - Interpreting ambiguous cases,
  - Moving assets between buckets when posture changes,
  - Updating this BPOE as legal/IP guidance evolves.
