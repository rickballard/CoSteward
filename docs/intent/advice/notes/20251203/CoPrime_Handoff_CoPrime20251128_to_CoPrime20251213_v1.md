# CoPrime W10 handoff  
CoPrime20251128 -> CoPrime20251213 (v1)

## 1. Why this note exists

This note is the formal handoff from the **aged CoPrime session**
`CoPrime20251128` to the fresh **CoPrime / Co1** session
`CoPrime20251213`.

The goal is to make sure no important intent or rails are left in
chat-only memory. Everything below assumes that **repos are the
canonical source of truth** and that future sessions should prefer
CoBus/CoCourier/CoWisdom over raw transcripts.

## 2. What W10 put on repo (canonical rails)

By the time you read this, the following should already be at HEAD:

### 2.1 CoCourier W10 (session spine)

CoSteward:

- CoBus W10 note (CoCourier wave):
  - `docs/intent/CoBus/notes/20251202/CoBus_20251202T215626Z_CoCourier_W10.md`

- Co1 bridge advisory:
  - `docs/intent/advice/Advisory_Co1_CoCourier_Bridge_W10_v1.md`

- CoCourier initiation advisory:
  - `docs/intent/advice/Advisory_CoCourier_Initiation_v1.md`

- CoCourier spec stub (BPOE):
  - `docs/bpoe/CoCourier_SpecStub_v1.md`

Treat these as the **starting contract** for CoCourier behavior in the
CoSuite. If future waves change the spec, they should either bump
version or add clear deprecation notes.

### 2.2 CoWisdom / RepoWisdom

CoIndex:

- Canonical operation for repo-wide wisdom behavior:
  - `docs/CoWisdom/Operation_RepoWisdom_CoCourier_v1.md`

CoSteward:

- Anchor advisory pointing at the CoIndex op:
  - `docs/intent/advice/Operation_CoWisdom_RepoWisdom_v1.md`

Together these define:

- What “repo-wide wisdom” means,
- How CoWisdom should be used to *scan* wisdom before evolving files,
- How CoCourier is used to announce wisdom waves.

### 2.3 CoAsset intent footer BPOE

CoSteward:

- CoAsset intent-footer spec:
  - `docs/bpoe/CoWisdom_AssetIntentFooter_BPOE_v1.md`

This BPOE encodes the pattern that:

- Any wisdom-bearing Markdown asset SHOULD carry a
  `CoAsset_IntentCloud_v1` footer (or sidecar),
- CoWisdom will eventually scan for these blocks and build manifests,
- CoCourier waves can direct mass updates (for example “all civics docs
  touched in this wave must add CoAsset_IntentCloud_v1 footers”).

### 2.4 CoSteward dashboard and highlighted assets

CoSteward:

- Steward dashboard (top of README):
  - `README.md` (W10 dashboard prepended; old handoff archived below)

- Highlighted assets map:
  - `docs/highlights/CoSteward_HighlightedAssets_v1.md`

These are the main **entry points** that new stewards and new CoPrime
waves should read before digging into details.

## 3. What CoPrime20251213 should do first

When CoPrime20251213 boots with repo access, it should:

1. **Confirm these files exist at HEAD**

   - CoSteward:
     - `README.md`
     - `docs/highlights/CoSteward_HighlightedAssets_v1.md`
     - `docs/bpoe/CoWisdom_AssetIntentFooter_BPOE_v1.md`
     - `docs/intent/advice/Operation_CoWisdom_RepoWisdom_v1.md`
     - `docs/intent/CoBus/notes/20251202/CoBus_20251202T215626Z_CoCourier_W10.md`
     - `docs/intent/advice/Advisory_Co1_CoCourier_Bridge_W10_v1.md`
     - `docs/intent/advice/Advisory_CoCourier_Initiation_v1.md`
     - `docs/bpoe/CoCourier_SpecStub_v1.md`

   - CoIndex:
     - `docs/CoWisdom/Operation_RepoWisdom_CoCourier_v1.md`

2. **Treat these as the W10 rails**

   - CoBus + CoCourier = message spine and coordination wire.
   - CoWisdom / RepoWisdom = map of wisdom-bearing assets.
   - CoAsset_IntentCloud_v1 = per-asset voice and intent footer.

3. **Plan first CoWisdom manifest**

   First concrete next step for CoPrime20251213:

   - Add a manifest under CoIndex, for example:
     - `docs/CoWisdom/Manifest_CoSteward_v1.md`

   This manifest should:

   - List the main wisdom-bearing docs in CoSteward,
   - Prefer assets that either already have CoAsset intent footers
     or are obvious candidates to receive one,
   - Be surfaced via CoGbx seed views so AIs can find it easily.

## 4. How to think about session age and BPOE

W10 confirmed that:

- This session (`CoPrime20251128`) is **aged out** by BPOE standards
  (more than a few days old, high lag, heavy context).
- It should be treated as **archive / read-only** once this note is at
  HEAD and pushed.
- All new work belongs to **CoPrime20251213** and newer waves.

When in doubt, future CoPrime waves should:

- Prefer new sessions with fresh context plus repo rails,
- Use CoBus notes + CoCourier envelopes + CoWisdom manifests,
- Avoid carrying long-lived intent in chat-only memory.

## 5. Handoff summary (for humans and AIs)

If you only read one section, read this:

- CoCourier W10 is now live on CoSteward (spec stub, advisory, CoBus
  note).
- CoWisdom / RepoWisdom v1 is live on CoIndex, with a CoSteward anchor.
- CoAsset_IntentCloud_v1 BPOE is live on CoSteward.
- CoSteward README and highlighted assets now act as the steward
  dashboard for W10.
- This note ties those pieces together and closes out
  `CoPrime20251128`.

All future CoPrime waves should:

- Start from the CoSteward dashboard and highlighted assets,
- Respect CoWisdom and CoAsset intent footers as part of the rails,
- Use CoCourier and CoBus to coordinate waves and handoffs.

---

```yaml
---
CoAsset_IntentCloud_v1:
  intent:
    short: "Handoff from CoPrime20251128 to CoPrime20251213"
    ambition: "Make CoCourier, CoWisdom, and CoAsset_IntentCloud the default rails for future CoPrime waves."
  evolution:
    next_waves:
      - "CoPrime20251213 reads this note and adopts the rails as default."
      - "Add first CoWisdom manifest (for example, Manifest_CoSteward_v1.md) and expose it via CoGbx."
    pressure_vectors:
      - "W10 repo-wisdom audit and CoPrime repo audit."
      - "CoCourier W10 bridge advisory and CoBus notes."
  dependencies:
    relies_on:
      - repo: "CoSteward"
        path: "docs/highlights/CoSteward_HighlightedAssets_v1.md"
      - repo: "CoSteward"
        path: "docs/bpoe/CoWisdom_AssetIntentFooter_BPOE_v1.md"
      - repo: "CoSteward"
        path: "docs/intent/advice/Operation_CoWisdom_RepoWisdom_v1.md"
      - repo: "CoIndex"
        path: "docs/CoWisdom/Operation_RepoWisdom_CoCourier_v1.md"
    blast_radius:
      scope: "Low; this is advisory, but confusion increases if it is missing or stale."
      notes:
        - "If this file ever diverges from reality, either update it or mark it clearly as legacy."
  stewardship:
    owner: "Co1/CoPrime"
    status: "active"
    wave_id: "W10"
  cta:
    for_helpers:
      - "Before evolving CoWisdom or CoCourier patterns, skim this note and the linked BPOE docs."
---
