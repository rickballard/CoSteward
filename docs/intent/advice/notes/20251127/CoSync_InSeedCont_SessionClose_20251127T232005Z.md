# CoSync note: InSeed_more CoPortal seed

UTC: 20251128T003913Z
Repo: InSeed
Session label: InSeed_more
Wave: MW_InSeed_CoPortal_Bundle_v1

## Changes in this wave

- Added a CoPortal descriptor block (inseed.com::portal.v0) into index.html.
- Seeded an InPrimer section in index.html and ensured InPrimer appears in the nav before Contact, where possible by string match.
- Appended basic CSS hooks for the InPrimer block into assets/site.css (if present).
- Created a seed BPOE doc for InSeed as a CoPortal testbed at docs/bpoe/CoPortal_InSeed_BPOE_v0.md.
- Created a CoBrowser dogfood script at tools/CoBrowser_Dogfood_InSeed_v1.ps1 for basic structural verification of the site.

## Next steps (suggested)

- Flesh out InPrimer content and route it to a dedicated page (or depth section) with prompt packs.
- Tighten CoBrowser dogfood script to use more robust parsing and feed findings back into CoSteward docs.
- Align this CoPortal BPOE with CoSteward CoBrowser and CoGIBindex guidance from 20251127 documents.
- Open a small PR for this wave and squash merge after review.

## Pointers

- index.html
- assets/site.css
- docs/bpoe/CoPortal_InSeed_BPOE_v0.md
- tools/CoBrowser_Dogfood_InSeed_v1.ps1

