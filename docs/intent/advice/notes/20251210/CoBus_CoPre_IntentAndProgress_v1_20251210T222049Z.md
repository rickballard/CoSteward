# CoBus Notice – CoPre intent and progress (v1)

- Date: 2025-12-10
- UTS: 20251210T222049Z
- Author: rick (via CoPre + CoBus DO Block)
- Lane: CoPre / CoAgent / CoSteward
- CoBloat heartbeat:
  - CU: OK
  - PU: SOFT
  - HU: SOFT
  - WT: SOFT

## Intent

- Establish **CoPre** as a CoSteward-only pre-boot rail for rick:
  - CoPre runs before CoAgent sessions for rick to:
    - refresh CoCrux rails,
    - apply BPOE and CoAnchor assumptions,
    - cut startup time to seconds.
- Keep **CoTabBoot / TabReset** as the hobbled default for all other users:
  - no CoPre logic,
  - no CoCrux cycling,
  - public-safe, minimal rails only.
- Align this session and the dedicated CoPre session so they converge on:
  - a single CoPre prompt shell pack for rick,
  - a clean split between CoSteward-only and public paths,
  - a reusable pattern for future CoStewards.

## Progress (completed so far)

- CoPre local repo:
  - I initialized a local **CoPre** git repo at:
    - ~/Documents/GitHub/CoPre
  - The repo is local-only placeholder v0.3.
  - No GitHub remote exists yet for ickballard/CoPre; pushes correctly failed.
- Shell pack for CoAgent:
  - I added docs/prompts/coagent/CoAgent_Rick_InternalShellPack_v1.md.
  - The shell pack:
    - targets rick as CoSteward,
    - assumes CoAnchor Quickstart Thin v6, BPOE, repo-first,
    - provides two shells:
      - internal CoAgent harness / OE work,
      - Products W6 packaging lane for CoAgent-related MVP.
- CoCrux integration (design level, partial implementation):
  - I defined a pattern where CoPre:
    - cycles through **Top 50 CoCrux rules**,
    - presents a small subset per CoPre invocation,
    - is used only for rick / CoSteward mode.
  - I sketched PS7 helpers to:
    - maintain a local CoCrux_Top50_v1_Placeholder.md inside CoPre,
    - rotate through rules in small batches,
    - copy the current batch to clipboard for easy paste into CoPre prompts.

## Parallel CoPre session

- There is a separate ChatGPT session explicitly focused on **CoPre**.
- That session is converging on similar goals:
  - CoPre as a CoSteward-only pre-boot experience.
  - Clean separation between CoPre and CoTabBoot/TabReset.
- Risk:
  - Some duplication of thinking between sessions.
- Benefit:
  - Both sessions are feeding into the same design direction:
    - CoPre = pre-boot rails for rick.
    - CoTabBoot/TabReset = public-safe default.

## Next steps (proposed)

1. **CoCrux rails**
   - Replace placeholder CoCrux summaries in the CoPre local file with the canonical Top 50 CoCrux rules from the relevant repo.
   - Finalize the PS7 helper that rotates through CoCrux rules and injects them into CoPre prompts for rick.
2. **CoPre / CoTabBoot split**
   - Update CoSteward and CoBox docs to:
     - state explicitly that CoPre is CoSteward-only,
     - keep CoTabBoot/TabReset as the user-facing default with no CoPre hooks.
3. **Repo strategy**
   - Decide whether CoPre remains:
     - local-only for CoStewards, or
     - promoted to a private GitHub repo later with appropriate redactions.
4. **Session alignment**
   - Use this CoBus note as the anchor for Co1 and other sessions:
     - treat this as the current CoPre design baseline,
     - avoid divergent CoPre definitions in parallel sessions.

## Notes for Co1 / CoPrime

- Treat CoPre as:
  - a reusable pattern for CoSteward pre-boot rails,
  - not yet ready for public templates.
- Any future CoPre evolution should:
  - keep GLUKEY / HP57 content out of all public lanes,
  - sync with CoCrux and BPOE on repo,
  - leave a CoBus trail like this note whenever behavior changes.

