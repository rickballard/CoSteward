# CoBus Advisory - InSeed.com, CoPolitic.org, and the steward-site constellation (v1)

## Intent

Clarify the roles of:

- InSeed.com as the founder and steward facing site, anchored in the new Steward worldview, and
- CoPolitic.org as the civic and government facing site, which may selectively reuse older legacy mode assets such as the whitepaper and dino deck.

The goal is to avoid confusion between legacy InSeed messaging and the newer Steward framing, while keeping older assets available where they are still the best fit for conservative or bureaucratic audiences.

---

## Roles and audiences

### InSeed.com

Primary audience:

- Founders, executives, boards, and stewards who want help with:
  - Strategy pivots into AI and hybrid society
  - Steward minded governance and risk balancing
  - Productization of trust and guardrails

Expectations for the new InSeed.com:

- Clearly Steward framed:
  - CoSteward / CoCivium narrative
  - Edge owned guardrails, hybrid society, and CoEvo language
- CoGbx ready:
  - A portal pattern that can later plug into a CoGbx style interface
  - Clean sections for:
    - Services and offers
    - Case snippets
    - Signals of trust (bios, testimonials, selected metrics)
- Minimal legacy clutter:
  - Old materials appear only when explicitly framed as legacy InSeed or pre Steward era.

For now, the live InSeed.com domain still points at the old site. The new content lives on repo, so review happens locally or via preview until DNS or hosting is cut over.

### CoPolitic.org

Primary audience:

- Civic offices, ministries, agencies, NGOs, and policy actors
- People who respond better to:
  - Whitepapers
  - Slide decks
  - Conservative and compliance flavored narratives

Here the older TOS AI era assets can still be useful:

- The whitepaper and dino deck can be:
  - Reworked as legacy friendly primers, and
  - Linked as background material rather than current canon.
- CoPolitic.org should:
  - Fix or replace all broken links to these assets
  - Host stable PDFs in its own repo or a clearly named shared location
  - Frame them as stepping stones toward the Steward and CoCivium view, not the final destination.

---

## Practical guidance

### 1. Keep ownership of narratives clean

- InSeed.com:
  - Forward looking Steward framing.
  - Founder and steward problems and offers.
  - CoGbx friendly layout.
- CoPolitic.org:
  - Civic and institutional use cases.
  - Higher tolerance for legacy worldview language.
  - Clear on ramps from old mental models to Steward concepts.

### 2. Handle legacy assets deliberately

Treat old TOS AI assets as:

- Legacy primers for cautious or bureaucratic audiences.
- Not the live specification of what CoCivium or CoSteward is now.

For each such asset:

- Decide whether it belongs on InSeed.com, CoPolitic.org, both, or neither.
- Fix the hosting and links once, then stop cloning versions everywhere.

### 3. Deployment reality check

While InSeed.com still shows the old site:

- Use the repo version as the source of truth.
- Do reviews via:
  - Local preview, or
  - Any static hosting or preview wired up from the repo.

When ready:

- Cut over DNS or hosting so InSeed.com points at the new site.
- Keep a small legacy InSeed archive if needed, but do not leave it as the default front page.

---

## Pointers for other sessions

Suggested cross session pointers:

- CoSteward:
  - Strategy seed: docs/intent/strategy/CoStrategy_CoEvoAuto_CoSong_ChildrenOnramp_v1.md
  - Legal seed: docs/intent/legal/CoLegal_NDA_Library_And_DarrenPlan_v1.md
  - This advisory: docs/intent/cobus/CoBus_InSeed_StewardSites_Advisory_v1_*.md

- InSeed_more:
  - Use this advisory as the current steering note for:
    - InSeed.com site evolution
    - CoGbx style portal layout
    - Which legacy assets are allowed onto the new site

- CoPolitic and Sites sessions:
  - Use this advisory as justification for:
    - Hosting stable copies of whitepaper and dino deck
    - Cleaning all broken links
    - Framing those assets as legacy primers for cautious institutions
