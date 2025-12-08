# CoSync – CoPolitic wave v1 (20251208T014303Z)

## Scope

CoPolitic.org human-face site and AI-face hints brought to a “near public-ready” v1:

- Restored and skinned \docs/site-v1/*.html\.
- Added join/pledge experiment on the landing page (free membership, value signal only).
- Wired Trust & identity page + nav.
- Added base CSS skin (\copolitic-v1.css\) and shared footer.
- Added CoMetaTrain valueSignals spec for membership pledges.
- Added CoGbx portal manifest + \meta name="ai-portal"\ tags.
- Wrote summary/site-pattern explainer:
  - \CoPolitic_Summary_And_SitePattern_v1.md\ in CoPolitic repo.

## Key files in CoPolitic

- \docs/site-v1/index.html\ (+ why-now, roles, labs, exemplars, transparency, trust)
- \docs/site-v1/copolitic-v1.css\
- \docs/CoMetaTrain/CoPolitic_ValueSignals_v1.yaml\
- \docs/CoGbx/CoPolitic_Portal_v1.yaml\
- \docs/intent/CoPolitic_Summary_And_SitePattern_v1.md\

Current active branch for this wave:
- \MW_CoBus_BrandTriad_CoPolitic_v1_20251204\

## Stealth lockdown note

- CoGbx portal manifest is **CoPolitic-local**.
- No explicit references to CoCivium, CoIndex, or other upstream repos while in stealth lockdown.
- Future \2\ portal manifest can add constellation links after de-stealth.

## Next actions (for Co1 / Outreaches)

1. **Merge CoPolitic wave branch into main**  
   - Review and merge \MW_CoBus_BrandTriad_CoPolitic_v1_20251204\ → \main\ in CoPolitic.

2. **GitHub Pages / copolitic.org**
   - Confirm Pages is serving from \main\ + \/docs\.
   - Decide whether to:
     - Add a small \docs/index.html\ that forwards to \site-v1/index.html\, or
     - Promote \docs/site-v1\ contents to \docs/\.

3. **Downstream pattern re-use**
   - Treat CoPolitic’s:
     - join/pledge pattern,
     - valueSignals YAML,
     - CoGbx portal manifest,
     - Trust & transparency framing
   as the default pattern for other CoSuite civic/commercial sites (GroupBuild, CoAgent/CoArena variants, etc.).

## Pointers

- CoPolitic repo:
  - Branch: \MW_CoBus_BrandTriad_CoPolitic_v1_20251204\
  - Summary note: \docs/intent/CoPolitic_Summary_And_SitePattern_v1.md\
  - Portal manifest: \docs/CoGbx/CoPolitic_Portal_v1.yaml\
