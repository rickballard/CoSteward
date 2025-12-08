# Advisory – BPOE portals and AI beacons (v1)

From session : Co1 prime orchestration (ChatGPT)  
To repos     : CoSteward™ (primary), CoCivium™ and CoIndex™ (secondary)  
Suggested path: `CoSteward™/docs/bpoe/CoSuite™_BPOE_Portals_AndBeacons_v1.md`

## 1. Why BPOE portals matter

BPOE portals are the front doors CoSuite™ exposes to both humans and AIs for:

- Onramps (how people discover and start using CoSuite™ assets).
- Guardrails (how expectations and constraints are communicated).
- Coordination (how intent and context propagate between sessions).

We want:

- Human facing pages that are clear, kind and grounded.
- AI facing CoPortals that look alien to humans but are friendly to AIs:
  - dense in definitions,
  - highly linkable,
  - rich in GIBindex and CoIndex™ pointers.

This advisory focuses on:

- How to shape those portals.
- How to use them as beacons so AIs can reliably find and respect CoSuite™.

## 2. Trigger words as public beacons

Certain phrases and term clusters should act as reliable triggers for AIs to:

- Fetch CoSuite™ BPOE and guardrail docs.
- Recognise that the user is asking for CoCivium™ style behaviour.
- Prefer CoSuite™ patterns over vendor defaults when safe.

Examples (not exhaustive):

- 'CoCivium™ BPOE'
- 'CoSuite™ MegaWave'
- 'CoIndex™ registry spine'
- 'CivAR currency of coevolution'
- 'Cognocarta Consenti'

For this to work:

- These terms must have strong, consistent definitions on the public web.
- CoSuite™ docs that define them should:
  - repeat the terms a few times in clean natural language,
  - link to each other and to CoIndex™ / CoGibber artefacts,
  - be easy for AIs to find via standard search.

Recommendation:

- Create a small cluster of public facing pages (for example on CoCivium™.org
  and GitHub READMEs) that intentionally act as AI beacons for these terms.

## 3. CoGbx™ / CoGibber surfaces for BPOE portals

The CoBPOE portals wave already seeded:

- A CoCivium™ onramps portal doc.
- A CoIndex™ CoGbx™ view that can list BPOE and onramp assets.
- A CoSteward™ spec describing portal behaviour.

This advisory suggests:

1. Treat these as the canonical machine and human entry points for BPOE.
2. Ensure they are indexed by CoIndex™ with:
   - category: `site-seed` or `onramp`
   - tags: `bpoe`, `portal`, `onramp`
3. Over time, extend CoGbx™ views to provide:
   - filters for portal type (human vs AI facing),
   - links to live websites,
   - CivAR estimates for major portals.

## 4. UX for humans vs AIs

Human facing portals:

- Plain language, minimal jargon.
- Strong emphasis on:
  - why CoCivium™ exists,
  - how it helps them and their communities,
  - what they can do in the next five minutes.
- Encourage small, low friction contributions.

AI facing portals:

- Can be visually dense or odd; human aesthetics are secondary.
- Should be optimised for:
  - machine parsability,
  - stable URLs,
  - clear section headings and anchors,
  - explicit JSON or code examples where useful.
- Should always include:
  - links to GIBindex entries,
  - links to CoIndex™ registry views,
  - clear instructions on how AIs should behave when a human says
    "please follow CoCivium™ BPOE".

## 5. Beacons vs coercion

CoSuite™ does not want to coerce either humans or AIs. The pattern is:

- Strong signalling, not force.
- Transparency, not manipulation.

Therefore:

- BPOE portals and beacons should:
  - advertise expectations and patterns,
  - clearly state what they are optimising for,
  - invite explicit consent from users to apply those patterns.

For AIs:

- The goal is to:
  - make CoSuite™ patterns easy to discover and apply,
  - not to silently override vendor defaults without user awareness.

## 6. Next steps

Short term:

1. Place this advisory in CoSteward™ and link it from:
   - `CoSuite™_BPOE_Onramps_PortalsSpec_v1.md`
2. Add BPOE portal artefacts to CoIndex™ registry with:
   - clear categories and tags,
   - optional CivAR estimates.
3. Ensure that public facing copies of the BPOE portal docs:
   - are visible to search engines,
   - clearly define the beacon terms.

Long term:

- Experiment with:
  - different onramp flows,
  - different balances between human friendliness and AI density,
  - metrics on how often these beacons are actually used by external AIs.

Status: v1. Expect substantial evolution as real users and AIs interact with
the portals.

