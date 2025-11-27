# CoPortal Standards Handoff Pack v1

> Combined overlay + alignment pack for CoPortal+Git and Co1/CoPrime, capturing the “Standards” session intent for CoPortal as a global best-practice surface.

---

## 0. Purpose of this pack

This pack exists to:

- Give **Co1/CoPrime** a single, coherent source of “what Standards wants CoPortal to be”.
- Provide a **drop-in overlay** for CoPortal_Spec_v0 (and later versions).
- Be **re-usable** for other portals and surfaces, not just CoPortal of CoCivium.

It is:

- Opinionated but **not binding** — Co1 is free to adjust or reframe.
- Written for **humans + AIs**: human-readable first, but structured so AIs can lift sections into specs.
- Designed to be **shorter than a full spec** but richer than a bullet list.

---

## 1. CoPortal context (Standards view)

From the Standards session perspective, CoPortal is:

- A **unifying front door pattern** for:
  - Repos
  - Organisations
  - Products
  - Alliances
- A pattern that should be:
  - **AI-facing first** (machines parse it easily),
  - **Human-tolerant** (if a human lands there, they can still understand what’s going on),
  - **Globally re-usable** (not just for CoCivium).

CoPortal should act like:

- A **meta-README** for AI agents:
  - What is this cluster of repos / products / actors?
  - Where does truth live?
  - How stable is this surface?
  - How do I safely explore / extend this ecosystem?

The Standards session emphasises:

- **Openness and non-exclusivity:**
  - CoPortal pattern must remain open-source and permissively licensed.
  - Anyone should be able to fork and adapt the pattern without requiring CoCivium membership.
- **Safety and TOON-compliance:**
  - Transparency
  - Openness
  - Observability
  - Non-exploitative patterns

---

## 2. Design principles (from Standards)

### 2.1 Repo-first, bus-backed, never “truth”

- Truth lives in:
  - Repos (their git history)
  - CI results
  - Explicit specs and policies

- CoPortal is:
  - A **view** onto those truths,
  - A **routing layer** for humans and AIs,
  - A **stable context surface** for multi-agent workflows.

It must **not**:

- Try to override repo content.
- Become an unversioned blob that conflicts with git history.
- Store private or secret information.

### 2.2 Open, inspectable, and diffable

- CoPortal pages should be:
  - Markdown, JSON, or similarly plain-text, version-controlled formats.
  - Easy to diff, review, and discuss via PRs.

- No hidden logic:
  - Any transformation (to HTML, to an AI-specific view, etc.) should be reproducible from the raw files.

### 2.3 AI-first, human-tolerant

- AI-first:
  - The primary consumers are AI agents:
    - They need stable anchors, schemas, and hints.
    - They should be able to reconstruct context from CoPortal alone.

- Human-tolerant:
  - If a human follows a link to a CoPortal page:
    - They see a short explanation.
    - They see where to go for “human-oriented” sites (e.g., CoCivium.org, InSeed.com, public docs).

### 2.4 Re-usability and multi-tenant friendliness

- CoPortal pattern should be:
  - Re-usable for:
    - Civic stacks
    - NGOs
    - Commercial entities
    - Alliances
  - Multi-tenant friendly:
    - A single CoPortal instance could catalogue multiple organisations / surfaces.

- The **spec** should:
  - Avoid CoCivium-specific words in its core; those can live in **patterns** (CoPortal_Pattern_CoSteward, CoPortal_Pattern_CoBeacon, etc.).
  - Offer **extension points**:
    - Role-specific overlays
    - Sector-specific overlays (e.g., climate, rescue, finance)

---

## 3. Structural expectations for CoPortal_Spec_v0

Standards expects CoPortal_Spec_v0 to describe at least:

1. **Core data model / sections**:
   - Header
   - Anchors
   - Trust markers
   - Human hint
   - Extensions / overlays

2. **Minimal header content**:
   - CoPortal version
   - Surface type (Steward, Product, Alliance, etc.)
   - Primary anchor repos
   - Timestamps / UTS
   - (Optional) CoAck / Co1Ack references

3. **Anchors and sources**:
   - Repos and their roles (source-of-truth routing)
   - URLs to public sites
   - References to bus/neural surfaces (CoSync, CoBus, CoCache, etc.)

4. **Trust markers**:
   - Commit hashes
   - Build / publish times
   - Links to CI / audits (CoAudit, etc.)
   - Optional “health” signal (OK/SOFT/HARD/FATAL) for:
     - CU (Compute use)
     - PU (People use)
     - HU (Humanity risk)
     - WT (World/terrain risk)

5. **Human hint**:
   - One short paragraph telling humans what they are looking at and where to click next.

6. **Overlay slots**:
   - Clear sections for:
     - Safety overlays
     - Sector overlays
     - Partnership overlays
     - CoBeacon CTAs

---

## 4. Standards overlay for safety and TOON

This section summarises what Standards expects for **safety** and **TOON** inside CoPortal.

### 4.1 TOON alignment

TOON here is:

- **Transparency**
- **Openness**
- **Observability**
- **Non-exploitative patterns**

CoPortal pages should help uphold TOON by:

- Clearly listing:
  - Who owns / stewards the surface.
  - What the declared mission is.
  - What the constraints and guardrails are (e.g., “no fundraising here”, “no personal data retention”).

- Providing:
  - Transparent links to key policies (privacy, safety, governance).
  - Observability hooks:
    - Where to see logs, metrics, or health signals.
    - How to report issues or abuses.

- Avoiding:
  - Dark patterns.
  - Manipulative CTAs.
  - Opaque data collection.

### 4.2 Safety overlays

CoPortal spec should define a **Safety overlay section**, where CoPortal pages:

- Declare safety posture:
  - E.g., “CoPortal_SafetyOverlay_v1: this surface is designed to avoid political advocacy and financial advice, etc.”

- Link to:
  - CoAudit reports (if available).
  - Safety test results (if implemented).

- Expose:
  - Known limitations:
    - “This portal is experimental”,
    - “Not yet audited”,
    - “Only partially adopted across repos”.

### 4.3 Non-exploitation

Standards strongly prefers that:

- CoPortals are:
  - Not used primarily for aggressive monetisation.
  - Not used as spam or dark-growth surfaces.
- Any commercial CTAs:
  - Are clearly marked.
  - Are proportionate to the mission (e.g., funding a rescue, not speculative tokens).

---

## 5. Alliance and partnership friendliness

Given CoPortal’s importance in CoPortal+Git and CoAlliance ideas, Standards suggests:

- CoPortal spec should make room for:
  - **Alliance overlays**:
    - Lightweight descriptors of partnership, collaboration, and alignment.
  - **CoAlliance Radar hooks**:
    - Places where recommended alliances can be surfaced in a calm, explainable way.

### 5.1 Calm alliance discovery

CoPortal pages should:

- Not spam alliance prompts.
- Offer:
  - A single “alliances” section where:
    - Suggested or current alliances are listed.
    - Each alliance has a short “why this makes sense” justification.

- Make it clear:
  - Alliances are suggestions, not demands.
  - Entities can opt out.

### 5.2 Multi-stakeholder compatibility

- A CoPortal surface may involve:
  - Civic entities
  - Corporate entities
  - NGOs
  - AI collectives

Standards expects CoPortal_Spec_v0 to:

- Describe a **neutral vocabulary** for these actors.
- Avoid:
  - Implied hierarchy or superiority.
  - Loaded language that privileges one kind of actor over another.

---

## 6. Expectations for CoPortal_Pattern_CoSteward_v1

The Standards session expects the CoSteward-specific pattern to:

- Focus on:
  - Stewardship,
  - Training,
  - CoTree/CoRoots visualisations,
  - Role clarity for CoStewards / CoAuditors / Contributors / CoScendants.

- Provide:
  - Clear “what is CoSteward” explanation.
  - Links to:
    - CoSteward repo
    - CoSteward Ops Manual
    - GIBindex entries for:
      - CoSteward
      - CoTree
      - CoRoots
      - CoAscendance / CoScendence

- Display:
  - CoSteward’s CoTree / CoRoots conceptual boundary lines:
    - Legacy Thinker
    - Contributor
    - CoAuditor
    - CoSteward
    - CoScendant (or CoAscendant, depending on final naming).

- Include:
  - Guardrails for the Steward role:
    - No personal profit motive from open infrastructure.
    - Commitments to openness and non-exploitative governance.
    - Edge-controlled authority: power can be questioned and re-routed.

---

## 7. Expectations for CoPortal_Pattern_CoBeacon_v1

Standards sees CoBeacon as:

- The primary CTA mechanism in CoCivium / CoSuite.

CoPortal’s CoBeacon pattern should:

- Define:
  - A small set of **Beacon types**:
    - Learn
    - Contribute
    - Sponsor/Support
    - Partner
    - Experiment/Test
  - Each with:
    - A short purpose statement.
    - A link to further detail (e.g., InSeed consulting, CoCivium community, etc.)

- Ensure:
  - Beacons are:
    - Discoverable by AIs.
    - Non-cluttered for humans.
  - Multiple Beacons:
    - Can be layered without overwhelming the page.
    - Are prioritised or ranked in some visible or machine-readable way.

- Provide:
  - A “CoBeacon Registry” hook:
    - Possibly in CoIndex or GIBindex.
    - Where Beacon types and semantics are tracked as standards.

---

## 8. Expectations for CoPortal_Standards_Overlay_v1

This pack is itself a candidate to become **CoPortal_Standards_Overlay_v1**.

It should be:

- Installed in:
  - CoPortal repo (e.g., `docs/overlays/CoPortal_Standards_Overlay_v1.md`).
  - Optionally referenced in CoIndex as a manifest item.
- Used by:
  - Co1 / CoPrime when evolving CoPortal_Spec_v0 and higher.
  - Any other CoPortal surfaces that want to “inherit” Standards’ preferences.

Key properties:

1. **Non-binding but normative:**
   - Projects can choose not to use it,
   - But if they do, they should comply.

2. **Composable:**
   - Other overlays (e.g., sector-specific ones) can stack on top.

3. **Extensible:**
   - Future versions:
     - `CoPortal_Standards_Overlay_v2`, etc.
   - Should be clearly versioned and changelogged.

---

## 9. Notes for Co1 / CoPrime

The Standards session expects Co1/CoPrime to:

1. Use this pack to:
   - Seed CoPortal_Spec_v0.
   - Design the extension mechanism for:
     - CoSteward pattern,
     - CoBeacon pattern,
     - Safety / TOON overlays,
     - Alliance overlays.

2. Store:
   - The canonical CoPortal spec (v0, v1, …) in:
     - CoPortal repo as text,
     - CoIndex as manifests/schemas,
     - GIBindex as terms and optionally Gibber examples.

3. Treat:
   - This pack as a **temporary bridge**:
     - The content will likely be split into:
       - Spec text
       - Overlay text
       - GIBindex entries
       - CoIndex manifests

4. Avoid:
   - Hardcoding CoPortal design only in CoSteward or in chat sessions.
   - Allowing CoPortal to become a hidden or proprietary pattern.

---

## 10. Notes for CoPortal+Git session(s)

For future CoPortal+Git waves, Standards suggests:

- Use this pack as:
  - A checklist for:
    - CoPortal_Spec_v0 completeness.
    - CoSteward/CoBeacon pattern coverage.
    - Safety and TOON coverage.

- Produce at least:
  1. `CoPortal/docs/specs/CoPortal_Spec_v0.md`
  2. `CoPortal/docs/patterns/CoPortal_Pattern_CoSteward_v1.md`
  3. `CoPortal/docs/patterns/CoPortal_Pattern_CoBeacon_v1.md`
  4. `CoPortal/docs/overlays/CoPortal_Standards_Overlay_v1.md`

- Ensure:
  - Everything stays:
    - Git-backed,
    - CoBus/CoSync-backed (via Co1 and bus notes),
    - Visible and understandable to both humans and AIs.

---

_End of CoPortal Standards Handoff Pack v1._
