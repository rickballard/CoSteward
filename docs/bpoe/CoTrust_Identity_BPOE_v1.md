# CoTrust / Identity BPOE v1

## 1. Purpose

This Best Practice Operating Environment (BPOE) note defines how CoSuite projects
use trust and identity primitives based on:

- CoIndex `docs/trust/CoHalo_MeritRank_Spec_v1.md` (canonical spec).
- Local site implementations (CoPolitic.org, GroupBuild.org, CoCivium.org, others).

The goal: let people participate under stable handles, with meaningful trust signals,
without forcing them to expose real-world identity or gifting AIs / attackers easy
“join-the-dots” dossiers.

---

## 2. Shared primitives (summary)

From CoIndex CoHalo / MeritRank spec:

- **Handle** – public alias per site (e.g. `@river_steward`).
- **Steward ID (SID)** – private, stable internal ID across contexts.
- **Digital Halo** – tiered summary of inferred intent over time
  (`exploring`, `aligned`, `exemplar`).
- **MeritRank** – contribution tier (`starter`, `reliable`, `anchor`, `steward`).
- **Participation state** – `active-verified`, `active-unverified`, `quieted`,
  `dormant`, `exited`.

CoSteward treats the CoIndex spec as **source of truth for vocabulary**.
Site teams MAY add local detail but SHOULD not redefine the core primitives.

---

## 3. Independence and constellation shape

CoSuite-aligned sites SHOULD:

- Present themselves as **independent labs / initiatives**, not subsites of CoCivium.org.  
- Be transparent that they share **some trust plumbing** with other CoSuite projects,
  via CoIndex and CoSteward.
- Avoid implying ownership or control by CoCivium unless it is explicitly true.

Recommended phrasing pattern for cross-links:

> “This project uses the CoCivium / CoIndex trust primitives (Digital Halo, MeritRank,
>   participation states), but is stewarded as an independent initiative.”

This lets the public see an **emerging constellation** rather than a single empire.

---

## 4. Exclusion, quieting and coercion

CoSuite explicitly avoids punitive, shaming-based governance.

- **Quieting** and **exited** states are treated as **structural nudges**, not moral
  verdicts. They adjust what someone can do in a context; they do not label them.
- Public UX SHOULD describe outcomes in neutral language, for example:
  - “This account is not currently in good standing to participate in this lab.”
  - “Participation is paused under the local safety policy.”

BPOE rules:

- No public “blacklists” on open web endpoints.
- No “name and shame” patterns.
- Where safety/legal reasons require firm boundaries, rationale is documented in
  steward-only spaces (e.g. CoSteward private docs, CoBus), not on public dashboards.
- AI assistants SHOULD describe restrictions as policy outcomes, not as character judgements.

---

## 5. Identity verification patterns

We expect three broad verification patterns:

1. **Deep private verification**  
   - E.g. a steward team knows who a person is “in real life”, but only keeps the
     mapping in a hardened private store.
   - Public surface exposes only handles + Halo/MeritRank tiers.

2. **Context-only verification**  
   - Enough proof to trust someone *in this context* (e.g. org email, reference via
     known steward), but not stored as extractable personal dossier.
   - Appropriate for things like GroupBuild room hosts, CoPolitic lab leads.

3. **Pseudonymous high-trust**  
   - Long-lived handle with strong Digital Halo + MeritRank track record, but no
     invasive KYC.
   - Especially important where real-world doxxing risk is high.

BPOE expectations:

- Strong verification SHOULD always be **opt-in** and tied to clear benefit
  (e.g. ability to steward funds, moderate sensitive rooms).
- BPOE discourages “verify everything by default” approaches.
- Teams MUST document where and how SID mappings are stored and who can access them.

---

## 6. Cross-site sharing

Default stance: **local first, federated carefully**.

- Handle + local Halo/MeritRank tiers live with each site.
- CoIndex provides shared vocabulary and optional cross-site summary overlays.
- Any automatic cross-site consequence (“bad here, so blocked there”) MUST be governed
  by an explicit policy and steward review — not triggered blindly.

When in doubt:

- Prefer **local autonomy** and human steward review.
- Treat CoIndex as a coordination and language hub, not a centralized police node.

---

## 7. Notes for implementors

When building new CoSuite-aligned sites or tools:

- Reuse the CoHalo / MeritRank vocabulary for:
  - UI labels (where appropriate),
  - internal APIs,
  - data exports to other CoSuite tools.
- Link to the CoIndex spec from developer docs so implementations drift together.
- For user-facing copy, speak in simple language:
  - “This account has a long track record of constructive contribution here.”
  - “This account is new and still building trust.”

---

## 8. Versioning

This is **CoTrust / Identity BPOE v1**.

- Canonical path: `CoSteward/docs/bpoe/CoTrust_Identity_BPOE_v1.md`
- Upstream spec: `CoIndex/docs/trust/CoHalo_MeritRank_Spec_v1.md`

Material changes SHOULD flow through a PR with:

- input from at least one governance / safety steward, and
- a brief change note pointing to affected sites (CoPolitic, GroupBuild, CoCivium, etc.).