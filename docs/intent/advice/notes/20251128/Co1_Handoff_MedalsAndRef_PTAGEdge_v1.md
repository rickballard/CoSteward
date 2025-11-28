# Co1 handoff – Medals+Ref MVP harness + PTAG edge

Session of origin: Benedict / CoArena20251128 (ChatGPT)  
Current working repo: CoAgent (local)  

This note is for whichever session is currently acting as **Co1 / CoPrime**.  
It describes what the CoArena Medals+Ref MVP harness session actually did and which scopes are being left for Co1 rather than carried further here.

---

## 1. What this session *completed* (local to CoAgent)

Working directory on disk:

- `C:\Users\Chris\Documents\GitHub\CoAgent`

Concrete artifacts created/updated:

1. **Medals+Ref MVP harness script (toy ring)**  
   - `tools/CoArena_MedalsAndRef_MVP.ps1`  
   - Role:
     - CLI-only “toy ring” that:
       - Prompts for a topic (eg. “Should cities ban private cars downtown?”).
       - Runs a stub A vs B debate (structure is real, content currently placeholder).
       - Uses a stub referee that randomly picks a winner and a silly medal.
       - Lets the user accept/override winner + medal, and enter optional fairness/fun ratings + notes.
       - Builds a PTAG-shaped `arena_result` object.
       - Writes each result as JSONL line to:
         - `logs/coarena/arena_results.jsonl`
       - Prints the same JSON to stdout for inspection.

   - This is deliberately **non–app-store**, single-user, single-match at a time.

2. **Medals+Ref MVP harness design doc (implementation note)**  
   - `docs/coarena/CoArena_MedalsAndRef_MVP_v1.md`  
   - Role:
     - Describes the “tiny non–app-store MVP” loop:
       - Topic → A vs B → Referee → User override → PTAG `arena_result`.
     - Proposes a concrete JSON shape for the `arena_result` facet.
     - Explicitly treats this as an **implementation/harness note**, *not* the canonical product spec.
     - Canonical product spec for Medals+Ref v1 is assumed to live where CoArena’s last CoSync said:
       - `docs/coarena/CoArena_MedalsAndRef_Spec_v1.md`
       - `docs/coarena/CoArena_MedalsAndRef_Examples_v1.md`
       - (CoAgent PR #136).

3. **PTAG facet stub (CoAgent-local)**  
   - `specs/PTAG_arena_result_facet_stub.md`  
   - Role:
     - A small, concrete proposal for PTAG `arena_result` facet, aligned with the harness’ JSON output.
     - Intended to be folded into `specs/PTAG.md` after a PTAG-focused wave, *not* done in this CoArena session.

4. **Logs and ignore rules**  
   - `logs/coarena/arena_results.jsonl` – local experiment log (not for git).  
   - `.gitignore` updated with:
     - `logs/`
     - `logs/coarena/`

These are the only scopes truly “adopted” and changed in this session. They are all **inside CoAgent** and small in blast radius.

---

## 2. What this session is *explicitly not* doing (delegated to Co1)

The following scopes were touched in CoArena’s “last gasp” CoSync note and/or the MW bundles, but are being **left for Co1** on purpose:

1. **Cross-repo PTAG facet integration and governance**

   Sources Co1 should look at:

   - `C:\Users\Chris\Downloads\MW_PTAG_Facets_v1.zip`
     - `MW_PTAG_Facets_README_v1.md`
     - `CoAgent_PTAG_Facets_Proposal_v1.md`
     - `CoIndex_PTAG_Indexing_Notes_v1.md`
     - `MeritRank_Scriptag_Reptag_PTAG_Facets_v1.md`
   - CoAgent:
     - `specs/PTAG.md`
     - `specs/PTAG_arena_result_facet_stub.md`
   - CoArena spec PR:
     - `docs/coarena/CoArena_MedalsAndRef_Spec_v1.md`
     - `docs/coarena/CoArena_MedalsAndRef_Examples_v1.md`

   Delegated decisions:

   - Final shape and naming for PTAG `arena_result` facet.
   - How much to keep of the MVP harness proposal vs. original PTAG facet ideas in the MW bundle.
   - Where to anchor Scriptag/Reptag/Humantouch overlays (likely CoIndex/MeritRank, *not* CoArena).

2. **Alignment between Medals+Ref spec and harness**

   - This session assumed:
     - PR #136’s `*_Spec_*` files are canonical for product behaviour.
     - `*_MVP_*` docs and the PS1 script are *implementation* artefacts.
   - Co1 should:
     - Confirm that alignment (or adjust).
     - Decide naming conventions:
       - eg. whether to rename the harness doc to `CoArena_MedalsAndRef_MVP_HarnessNotes_v1.md` to avoid confusion with `*_Spec_*`.

3. **CoArena repo and productization roadmap**

   Not attempted here:

   - No new `CoArena` repo was created.
   - No app-store framing or packaging was done.
   - No multi-ring architecture, no leagues/ranks, no external UX.

   Co1 should eventually:

   - Decide when/where to spin CoArena out into its own repo.
   - Decide which parts of the CoAgent harness and PTAG facet become shared modules vs. CoArena-only logic.
   - Place Medals+Ref within a broader CoArena roadmap (more ring types, season/ladder, etc.).

---

## 3. Suggested next steps specifically for Co1

These are suggestions only; Co1 can override or reframe.

1. **PTAG facet consolidation wave**

   - Pull in:
     - `specs/PTAG_arena_result_facet_stub.md` (CoAgent)
     - `MW_PTAG_Facets_v1.zip` contents
     - Any PTAG facets already merged via PRs.
   - Produce:
     - A clean `arena_result` facet section inside `specs/PTAG.md`.
     - Notes in CoIndex/MeritRank on how Scriptag/Reptag/Humantouch relate to `arena_result`.

2. **Harness alignment + small refactor (if needed)**

   - Ensure `CoArena_MedalsAndRef_MVP_v1.md` in CoAgent:
     - References `CoArena_MedalsAndRef_Spec_v1.md` as canonical spec.
     - Is clearly labelled as “MVP harness notes”.
   - Optionally:
     - Rename file or adjust headings to reduce confusion.
   - Optionally:
     - Swap stub referee and agents for real CoAgent LLM calls while maintaining the same `arena_result` shape.

3. **Decide minimal CoArena/CoAgent responsibility split**

   Some options Co1 could choose from:

   - **Option A – PTAG-first, CoAgent-centric**
     - CoAgent remains the main home for the PTAG facet and harness logic.
     - CoArena (when created) is mostly a UI/UX repo that consumes PTAG `arena_result` streams.

   - **Option B – CoArena-first ring engine**
     - CoArena repo owns ring logic + PTAG-aware modules.
     - CoAgent keeps only generic orchestration and PTAG spec files.

   Co1 does not need to resolve this immediately, but it should own the decision, not this small Medals+Ref harness session.

---

## 4. CoBloat + why this was delegated

From this session’s perspective:

- **Inside CoAgent**:
  - Code and docs added are small and legible.
  - The toy harness gives quick, experiential feedback with minimal complexity.
- **Cross-repo PTAG + productization**:
  - Touches CoAgent, CoIndex, MeritRank, CoArena (spec), and possibly others.
  - That is Co1-scale work (spans multiple rails, needs CoBus awareness).

Therefore:

- **This session keeps**:
  - The little Medals+Ref MVP harness in CoAgent.
- **This note hands Co1**:
  - The *decision rights* and *responsibility* for:
    - PTAG facet finalization.
    - Cross-repo indexing and Scriptag/Reptag overlays.
    - CoArena repo creation and product roadmap.

Co1 can treat this note as a starting checklist and is free to ignore/refactor as needed.
