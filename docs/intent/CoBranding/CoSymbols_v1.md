# CoBranding – Core Symbols And Status Logos (v1)

Status: CoStaged_v1  
LastUpdatedUTS: 20251206T183754Z  

---

## 1. Subset symbol for CoWaves and CoBlocks

Preferred header symbol: **⊂** (proper subset)

Reasoning:

- visually echoes a sideways “c” for CoCivium,  
- suggests inclusion and belonging (“member of”),  
- is simple to type and recognise.

Examples:

- ⊂ MW=2.3.0 ::: Wave=4 ::: TotalMWsEst=4 ::: Title  
- ⊂ CoBlock=3 ::: DO=5 ::: CoBranding symbols rail

Guideline:

- Use ⊂ at the start of any structured MegaWave header where we want
  quick visual scanning and easy CoPing / CoPong in voice mode.

---

## 2. CoCivium logo variants and usage

Canonical logo assets currently live at paths similar to:

- CoCivium/branding/CoCivium-logo-concentricc-3grey.svg  
- color variants (green, amber, red, gray) in:
  - CoCache/docs/assets/brand/cocivium_logo_*.svg  
  - CoArena/docs/assets/brand/cocivium_logo_*.svg

Intended semantics:

- **Green**: normal / healthy / CoGoodLand.  
- **Amber**: caution / degraded / needs steward attention.  
- **Red**: critical / hard failure / CoBadLand.  
- **Gray**: unknown / undefined / uncertain state.

Guidelines:

- Use the logo as a **state indicator** in dashboards, not only as a brand.  
- For accessibility:
  - combine color with text labels (OK, WARN, FAIL, UNKNOWN),  
  - avoid relying on color alone for meaning.

---

## 3. Text-only fallback

When we cannot embed images (console, plain markdown):

- Use short text tags:

  - [CoCivium ◯◯◯ GREEN]  
  - [CoCivium ◯◯◯ AMBER]  
  - [CoCivium ◯◯◯ RED]  
  - [CoCivium ◯◯◯ GRAY]

- Or minimal ASCII states:

  - [CoCivium OK]  
  - [CoCivium WARN]  
  - [CoCivium FAIL]  
  - [CoCivium UNKNOWN]

---

<!--
CoIntentCloud v1
CoRole: CoBrandingSymbols
CoSeed: CoBranding_CoSymbols_v1
CoAssetAmbitions:
  - "Make the subset symbol and logo states consistent across the CoSuite."
  - "Support accessibility and clear visual scanning."
CoCTA:
  - "Use ⊂ in structured MegaWave headers and apply logo color semantics consistently."
GIBindexKeys:
  - "CoBranding"
  - "CoCiviumLogo"
  - "SubsetSymbol"
Status: CoStaged_v1
LastUpdatedUTS: 20251206T183754Z
-->