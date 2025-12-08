# CoStealth Sites Manifest (v1)

Generated: 20251205T223108Z

## Intent

Track which CoSuite-facing sites are in stealth mode, what that
means operationally, and how Co1 / CoSteward should interact with
them **repo-first**.

## Stealth mode definition (current)

- Front gate:
  - Passworded.
  - "Academic / sandbox" style explainer, intentionally rough.
- Navigation:
  - May be partially or fully disabled for visitors.
  - Reviews should be done via explicit page pointers from CoSteward.
- Access:
  - Human steward (Rick) enters passwords manually in browser.
  - Co1 operates from repo content, not direct browsing.

## Sites in scope (seed list)

- CoCivium.org
  - Repo: (fill in)
  - Review map doc: (to be created in that repo, e.g.
    docs/intent/meta/CoStealth_ReviewMap_CoCivium_v1.md)

- Godspawn.org
  - Repo: rickballard/Godspawn
  - Review map doc: docs/intent/meta/CoStealth_ReviewMap_Godspawn_v1.md (to be created)

- CoPolitic.org
  - Repo: (fill in)
  - Review map doc: (to be created)

- Others:
  - (add as needed)

## Review workflow (seed)

1. Co1 prepares or updates the per-site *ReviewMap* doc in the
   relevant repo, listing:
   - Source paths (Markdown / HTML / templates).
   - Expected URLs once deployed.
   - Any special notes (footers, CoMetaTrain hooks, CTAs).

2. Human steward:
   - Logs into the site (enters password).
   - Visits URLs listed in the ReviewMap.
   - Reports back issues or provides copied HTML / screenshots.

3. Co1:
   - Fixes / evolves assets in repo.
   - Updates ReviewMap status notes.

Future waves:
- Link this manifest from Co1 session plans.
- Add per-site review map templates.
