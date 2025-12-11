# CoBus notice – CoSites Thursday pack and slide seeds (for Co1)

UTS: 20251211T141608Z
Branch context: main
Thursday folder: O:\Thursday_Darren_Pack_20251211

## 1. Scope

This notice tells Co1 what was done around the CoSites constellation for:
- Investor lines and outline,
- Per-site polish deltas,
- Thursday Darren pack,
- Audience overlays (Darren and founders),
- Slide seeds and MegaOutline.

Repos touched:
- CoSteward
- CoScendence
- CoEvoTheory
- CoPolitic
- InSeed
- Opename
- GroupBuild
- EntMent
- BeAxa

## 2. CoSites investor lines and outline (CoSteward)

Already on repo and pushed:

- CoSites_InvestorLines_YYYYMMDDTHHMMSSZ.md  
- CoSites_InvestorDeckOutline_YYYYMMDDTHHMMSSZ.md  
- CoBus_CoSites_InvestorLines_Notice_YYYYMMDDTHHMMSSZ.md  

They live under:
- docs/intent/advice/notes/YYYYMMDD/ in CoSteward.

These files provide:
- One liners for each of the eight CoSites:
  - CoScendence, CoEvoTheory, CoPolitic, InSeed,
  - Opename, GroupBuild, EntMent, BeAxa.
- Per site:
  - Who it reassures,
  - Readiness snapshot (legacy live, seed v3 parked, local only, etc).
- High level guidance on how to use these lines in investor decks.

Current posture (as recorded earlier):
- Legacy site/index.html faces are live again for all eight repos.
- Seed v3 investor shells are parked as site/index_seedv3_*.html, one per repo.
- CoEvoTheory is still treated as local lab, with extra care on remotes.

## 3. CoPolish deltas across CoSites repos

A pass was run over all eight repos to write per site CoPolish delta files:
- docs/intent/sites/CoPolish_<SiteName>_Delta_YYYYMMDDTHHMMSSZ.md

Each delta file contains:
- Snapshot of detected <h1> and <h2> from site/index.html:
  - For comparison only, no HTML changed by these DOs.
- The relevant investor one liner for that site.
- A hook into the site specific CoPolish checklist, with items like:
  - Hero clearly says who this is for and why it exists.
  - Tagline matches current pitch.
  - Live home page has no placeholders.
  - Footer contact details are correct.

Purpose:
- Give Co1 and local stewards an anchored starting point for polish.
- Keep actual site changes as deliberate, logged moves, not hidden edits.

## 4. Thursday Darren pack for CoSites

A working folder was populated:
- O:\Thursday_Darren_Pack_20251211

Key CoSites related files now in that folder include:
- CoSites_InvestorLines_YYYYMMDDTHHMMSSZ_YYYYMMDDTHHMMSSZ.md
- CoSites_InvestorDeckOutline_YYYYMMDDTHHMMSSZ_YYYYMMDDTHHMMSSZ.md
- CoBus_CoSites_InvestorLines_Notice_YYYYMMDDTHHMMSSZ_YYYYMMDDTHHMMSSZ.md
- CoDeck_CoSites_NotesIndex_YYYYMMDDTHHMMSSZ.md

Plus Darren specific assets:
- CoCivium_Darren_CueCard_v0_1.md
- CoCivium_Darren_DeckOutline_v0_1.md
- CoCivium_Darren_Email_PreRead_v0_1.txt
- CoCivium_Darren_InstrumentExplainer_v0_1.md
- CoCivium_Darren_MeetingChecklist_v0_1.md
- CoCivium_Darren_MeetingScript_v0_1.md
- CoCivium_Darren_PrintStack_v0_1.md
- CoCivium_Darren_ReadOrder_v0_1.md
- CoCivium_Darren_RiskAndStress_Snapshot_v0_1.md
- CoCivium_Darren_ShortPack_v0_1.md
- Thursday_Darren_Pack_Index_v0_1.md
- README_ThursdayPack_v0_1.md

A CoSites only pack was built:
- Thursday_CoSites_Pack_20251211T140650Z.zip
- Thursday_CoSites_Pack_20251211T140650Z.zip.sha256

These zip and hash files live in the same Thursday folder and contain:
- All CoSites investor notes,
- Darren and founder overlays,
- Per site slide seeds (see next section).

## 5. Overlays for Darren and founders

Two overlay guides were written into the Thursday folder:

- CoDeck_CoSites_DarrenOverlay_YYYYMMDDTHHMMSSZ.md
  - Persona: Darren, public markets CIO.
  - For each CoSite it describes:
    - Angle for Darren,
    - Signals he may care about,
    - Deck notes about placement.

- CoDeck_CoSites_FounderOverlay_YYYYMMDDTHHMMSSZ.md
  - Persona: founder / operator at inflection.
  - For each CoSite it describes:
    - Angle for founders,
    - Signals they care about,
    - Deck notes.

These overlays are local guidance and not yet promoted back into any repo.

## 6. Slide seeds per CoSite

A DO created slide seed templates in C:\Users\Chris, then a DO copied them into:
- O:\Thursday_Darren_Pack_20251211

Files:
- CoDeck_SlideSeed_CoScendence_YYYYMMDDTHHMMSSZ.md
- CoDeck_SlideSeed_CoEvoTheory_YYYYMMDDTHHMMSSZ.md
- CoDeck_SlideSeed_CoPolitic_YYYYMMDDTHHMMSSZ.md
- CoDeck_SlideSeed_InSeed_YYYYMMDDTHHMMSSZ.md
- CoDeck_SlideSeed_Opename_YYYYMMDDTHHMMSSZ.md
- CoDeck_SlideSeed_GroupBuild_YYYYMMDDTHHMMSSZ.md
- CoDeck_SlideSeed_EntMent_YYYYMMDDTHHMMSSZ.md
- CoDeck_SlideSeed_BeAxa_YYYYMMDDTHHMMSSZ.md

Each seed contains:
- Heading placeholder for a crisp 3–7 word promise.
- Slot to drag in one liner from investor lines.
- Optional founder and Darren angle slots.
- Placeholder visuals and notes to Co1 that this is deck seed only.

These seeds do not edit any repos. They are Thursday workbench assets.

## 7. MegaOutline

A CoSites MegaOutline scaffold was generated into the local profile folder:
- C:\Users\Chris\CoDeck_CoSites_MegaOutline_YYYYMMDDTHHMMSSZ.md

Contents:
- References to:
  - Latest CoSites_InvestorDeckOutline_*.md
  - Latest CoSites_InvestorLines_*.md
  - Latest Darren and founder overlays.
- For each of the eight CoSites:
  - Identifies the latest slide seed file.
  - Recommends build order:
    - Problem and who it is for,
    - One liner,
    - Darren or founder angle depending on audience,
    - One concrete example or story,
    - Visual hint.

This MegaOutline is not yet in a repo. It is a working scaffold for Thursday and can be promoted later via CoSteward if Co1 wants it treated as a canonical pattern.

## 8. CoSites status snapshot (what we know now)

Based on current passes:

- All eight CoSites have:
  - A repo under C:\Users\Chris\Documents\GitHub\<SiteName>.
  - A legacy site/index.html that is live facing for now.
  - At least one CoPolish delta file under docs/intent/sites.

- Seed v3 investor shells:
  - Live only as parked index_seedv3_* files in each site repo.
  - Not active live faces.

- CoEvoTheory:
  - Treated as a working notebook repo.
  - Extra caution on remotes; prior note flagged it as local-only lab at this stage.

If Co1 needs more precision per site (remotes, branches, current HEAD), a small follow-up DO can emit a CoSites repo status report into CoSteward.

## 9. Suggested next actions for Co1

If Co1 wants to pick this up:

1. Choose audience variants:
   - For Darren:
     - Use CoSites_InvestorDeckOutline + DarrenOverlay + slide seeds.
   - For founders:
     - Use same spine plus FounderOverlay + slide seeds.

2. Keep Thursday pack as workbench:
   - Do not treat its contents as source of truth.
   - When a specific deck spine stabilises:
     - Promote the outline and any reusable text back into CoSteward docs,
     - Add a small CoBus note describing what moved and why.

3. Optionally request:
   - DO to emit Darren-only markdown deck stack from the Thursday folder.
   - DO to emit Founder-only markdown deck stack.
   - DO to snapshot CoSites repo status for all eight sites into CoSteward.

## 10. CoRetro

What worked:
- Single Thursday workbench folder now contains:
  - All CoSites investor notes,
  - Per site slide seeds,
  - Darren and founder overlays,
  - A zip plus SHA256 for fast handoff.

Friction:
- Some assets (like MegaOutline) currently live in C:\Users\Chris rather than in a repo or the Thursday folder.
- CoPolish deltas rely on simple h1/h2 scraping and may miss more complex hero layouts.

Next improvements:
- Add a DO that copies the latest MegaOutline into the Thursday folder when needed.
- Add a DO that inspects CoSites repos for remotes and branches to give Co1 a more precise status view.
