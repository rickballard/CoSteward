# CoBus notice – CoSeed sites rollback + investor shell guidance

UTS: 20251211T010813Z  
Source: CoSteward (CoSites constellation)  
Scope: CoScendence, CoEvoTheory, CoPolitic, InSeed, Opename, GroupBuild, EntMent, BeAxa

## What just happened

1. **Multi-site investor shell had become the live index**

   A recent DO in CoIndex upgraded \site/index.html\ across eight repos to a shared v3 "investor-facing seed" shell:

   - CoScendence  
   - CoEvoTheory  
   - CoPolitic  
   - InSeed  
   - Opename  
   - GroupBuild  
   - EntMent  
   - BeAxa  

   This was done without a full CoBus round-trip with other sessions that had been shaping bespoke designs and messaging for these sites over the last weeks.

2. **Rollback to earlier intent + parking the v3 shell**

   From CoSteward, we ran a reconciliation DO:

   - Parked the current v3 shell as:
     - \site/index_seedv3_<UTS>.html\ (explicitly labeled seed v3 investor shell).
   - Restored the most recent legacy index as:
     - \site/index.html\ from the latest \site/index_legacy_*.html\ if present.
   - Committed and pushed where remotes exist.

   Net effect right now:
   - **Public face:** each repo is back on its prior intent (legacy site/index).
   - **Optionality:** the multi-site v3 investor shell is preserved per repo as a clearly named backup file, not the default entry point.

3. **CoEvoTheory remote status**

   - Local path: \~/Documents/GitHub/CoEvoTheory\ exists and now has:
     - \site/index.html\ restored from \index_legacy_20251210T025828Z.html\.
     - \site/index_seedv3_<UTS>.html\ parked as a backup.
   - There is **no Git remote configured** after cleanup:
     - \git -C CoEvoTheory remote -v\ is empty.
   - CoEvoTheory is therefore **local-only** until Co1 explicitly decides to provision a GitHub repo and attach a remote.

## How Co1 can treat the v3 shells

Think of the v3 investor shell as a **pattern library**, not a mandate:

- It gives a **consistent top bar, structure and investor lens** that can be reused:
  - Sections: Home / Story / For whom / For investors / AI portal.
  - CoGbx link as the AI-facing facade.
  - Quiet-phase language that respects the current low-noise posture.

- For each site, the v3 file now lives at:
  - \site/index_seedv3_YYYYMMDDTHHMMSSZ.html\.

Suggested Co1 guidance:

1. **Do not auto-promote v3 shells back to live** without:
   - A short CoBus note per site.
   - A quick check that the existing hand-crafted copy and design are not being displaced without the right stewardship eyes on them.

2. **When investor pressure is high**, Co1 can:
   - Use the v3 shells as:
     - Wireframes or reference layouts in investor decks.
     - Sandboxes for evolving more confident, less apologetic investor copy.
   - For a given site, there are three viable options:
     - Keep legacy \index.html\ live and reference the v3 shell only in decks.
     - Swap the v3 shell back into \index.html\ once stakeholder alignment is explicit.
     - Blend the best of legacy + v3 into a new bespoke index, then park both source files as historical snapshots.

3. **For InSeed, GroupBuild, CoPolitic and CoScendence in particular**:
   - Treat prior sessions’ design and messaging as primary truth.
   - Use the v3 shell to **clarify structure and investor narrative**, not to overwrite tone or posture.
   - Any move to a v3-style live index should come with:
     - Named humans and AIs who have read and endorsed the new copy.
     - A short note on how this impacts current outreach plans.

## Investor and planning advice for Co1 (short form)

Given current investor timelines:

- **Decks and narrative:**
  - Use screenshots or HTML captures from:
    - InSeed, GroupBuild, CoPolitic, CoScendence (current legacy indexes) to show lived work and history.
    - Selected v3 shells (as parked) to show where the constellation is headed.
  - Emphasise:
    - CoSeedCouple: sites start small but coherent, then deepen.
    - CoGbx facades: every site has an AI-facing view that can scale later.
    - Quiet mode by choice: low noise while foundations are still moving.

- **Risk and governance story:**
  - The rollback itself is a useful example:
    - Cross-session collision was detected.
    - CoBus note and reconciliation DO were executed.
    - Legacy intent was restored, and the new pattern was preserved as an option.
  - This is a small but concrete demonstration of CoCivium-style error detection and repair.

- **Next safe upgrades:**
  - For investor-focused moments, Co1 can:
    - Create **feature branches** or **alt indexes** that adopt the v3 pattern with tuned copy per site.
    - Only promote those branches to main once both:
      - The relevant stewardship sessions have reviewed.
      - A CoBus note has been logged that summarises the change.

## Suggested follow-ups for Co1

1. Treat this notice as the **canonical record** of the multi-site index interaction for this week.
2. When planning investor materials:
   - Pull both current live URLs and parked v3 shells into the deck.
   - Call out how CoSeedCouple, CoGbx and quiet-phase language support a controlled ramp.
3. Decide whether CoEvoTheory should:
   - Stay local as a drafting ground, or
   - Be surfaced as a GitHub repo later for selected collaborators.

If Co1 wants a dedicated investor-shell refinement pass, request it via CoBus with:
- The target sites,
- The investor types,
- The risk appetite for how bold those pages should be in this pre-launch phase.
