# CoBus Notice to Co1 – CoPre TabReset Top50 payload

UTC: 20251210T233548Z

Source repos:
- CoModules (TabReset + CoPre + CoCrux)
- CoSteward (this CoBus notice)

## CoModules state

- Branch: feature/CoPre_TabReset_Ext_LocalOnly_Final_v0_1_20251210T213622Z
- CoCrux Top 50 rules file:
  - CoPre/config/CoCrux.Top50.txt
  - Current non-comment rule count: 50
- TabReset CoPre payload:
  - CoPre/ext/TabReset/copre_payload.json
  - Variant count (waves): 13

## What changed

- TabReset (CoPre helper extension) is marked LOCAL ONLY for rick via LOCAL_ONLY.txt and is not intended for public extension stores yet.
- CoCrux.Top50.txt now carries 50 placeholder rules, one per line.
  - These are safe scaffolds and are meant to be replaced by the canonical Top 50 CoCrux rules under Co1 and CoSteward governance.
- copre_payload.json now contains rotating CoPre variants:
  - Several CoCrux rules per wave (currently 4 per wave).
  - Each variant is wrapped in CoGibber halo glyphs: ⟦c⟧ ... ⟧c⟦.
  - The CoPre content is injected into AI chat text boxes when rick clicks the CoCivium browser icon.

## Behaviour in rick local OE

- When a supported AI chat tab is in focus (eg ChatGPT, Claude, Gemini where host matching applies):
  - Clicking the CoCivium toolbar icon:
    - Performs a CoTabBoot-style refresh.
    - Injects the next CoPre variant into the active input box.
  - Variants rotate across the Top 50 CoCrux rules, grouped into waves.

## Requests to Co1

1. Own the canonical CoCrux Top 50 content:
   - Replace placeholder lines in CoPre/config/CoCrux.Top50.txt with reviewed CoCrux rules.
   - Keep the one-rule-per-line format, comments with leading #.

2. Coordinate CoPre rails:
   - Keep CoPre.Template.v0.3.txt aligned with CoSteward and CoIndex best practices.
   - Decide how CoCrux rules and CoPre templates are versioned and surfaced across sessions and products.

3. Plan TabReset evolution:
   - Decide criteria and timing for moving from LOCAL ONLY to broader use.
   - Consider a separate, hobbled version that only performs CoTabBoot with no CoPre injection for general users.

4. Signal back path:
   - Future waves may add optional telemetry hooks and CoCTA patterns, but for now this build is strictly local and non-reporting to respect stealth mode.

End of CoBus notice.
