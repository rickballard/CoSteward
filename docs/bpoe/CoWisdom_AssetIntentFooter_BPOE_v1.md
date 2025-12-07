# CoWisdom – CoAsset intent footer BPOE (v1)

Short: any asset that can carry metadata should include a small, structured
**intent cloudlet** at the end of the file (or in a sidecar). This gives each
asset its own “purpose + evolution” voice and lets CoWisdom build repo-wide
maps from the bottom up.

## 1. Motivation

Right now, wisdom is mostly in large docs and in people’s heads. Assets do not
clearly state:

- what they are trying to become,
- how they want to evolve,
- what they depend on,
- what they might break.

This note encodes the pattern described in the W10 CoPrime repo-wisdom audit:
treat every asset as a tiny being-seed with an intent cloudlet and a CTA for
helpers.

## 2. Scope

This BPOE applies to:

- Markdown and text-based assets in CoSuite repos (CoCivium, CoIndex,
  CoSteward, InSeed, etc.).
- Sidecar `.meta.md` files for binaries (PNGs, videos, etc.) that cannot
  embed text.

It does *not* yet mandate changes for code files; those can be brought in later
via language-specific BPOE.

## 3. Footer schema (CoAsset_IntentCloud_v1)

At the bottom of a wisdom-bearing Markdown file, add:

```yaml
---
CoAsset_IntentCloud_v1:
  CoProtect:
    level: 'Unknown_NeedsReview'
    rationale: 'Initial stub added by CoProtect_TagStub_v1. Needs human steward review.'
    owner_session: 'CoPrime20251203'
  intent:
    short: "<one-line purpose of this asset>"
    ambition: "<what this wants to become over time>"
  evolution:
    next_waves:
      - "<concrete next improvements this asset wants>"
    pressure_vectors:
      - "<what drives evolution – CoBus waves, deadlines, anchors>"
  dependencies:
    relies_on:
      - repo: "<repo name>"
        path: "<relative path to key upstream wisdom>"
    blast_radius:
      scope: "<what breaks or confuses if this changes badly>"
      notes:
        - "<optional risk notes>"
  stewardship:
    owner: "<human/AI steward or 'Co1/CoPrime'>"
    status: "seed | draft | active | legacy"
    wave_id: "W10"
  cta:
    for_helpers:
      - "<what any human/AI should do before editing this asset>"
---
For non-Markdown assets, place the same block in a *.meta.md file with a
short human-facing summary above it.

4. Relationship to CoWisdom / CoCourier

CoWisdom / RepoWisdom (CoIndex):

Scans repos for CoAsset_IntentCloud_v1 blocks,

Builds manifests under CoIndex/docs/CoWisdom/ (e.g.
Manifest_CoSteward_v1.md),

Exposes those manifests via CoGbx seed views so AIs can traverse wisdom
clusters before editing anything.

CoCourier / CoBus (CoSteward + others):

Announces waves that require mass updates of asset footers,

Carries messages like:

“All CoCivium civics docs touched in this wave must have a
CoAsset_IntentCloud_v1 footer with wave_id = W11.”

Together:

CoCourier = the wire for coordination,

CoWisdom / RepoWisdom = the map,

CoAsset intent footers = the per-asset voice.

5. BPOE rules

Off-repo text (chat logs, screenshots, etc.) is never canonical wisdom.
It only becomes wisdom when it is landed on repo and, where relevant,
gets a CoAsset intent footer.

New wisdom-bearing assets MUST include a CoAsset_IntentCloud_v1 footer or
sidecar before being treated as “stable”.

Existing high-value assets SHOULD be retrofitted over time during CoWisdom
waves (tracked via CoBus / CoCourier).

Co1 / CoPrime are responsible for evolving this BPOE (v2+) as the schema,
parsers, and CoWisdom manifests mature.
