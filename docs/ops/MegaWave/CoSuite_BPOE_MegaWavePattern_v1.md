# CoSuite BPOE — MegaWave pattern (v1)

> Canonical spec for how CoSuite-facing sessions (CoPrime, CoArena, CoAudit, etc.)
> must structure each *non-trivial* cycle.  
> Default: **MegaWave or nothing**, unless a safety or environment constraint is explicit.

## 1. When to use a MegaWave

Use a MegaWave cycle whenever:

- The mission is active and non-trivial (CoPrime mission, CoArena release, CoAudit pass, etc.).
- There is no explicit safety reason to keep the wave tiny.
- The human CoSteward has not requested a single micro-fix only.

If in doubt, treat the cycle as a **MegaWave** and say why in CoSync / CoStatus notes.

## 2. Required elements of a MegaWave

Every MegaWave cycle must provide:

1. **Commentary on last cycle**

   3–6 bullets that cover:
   - What changed on main branches since last cycle.
   - Which WIP branches / PRs matter to this mission.
   - Any failures, warnings, or TODOs carried forward.

2. **Intent for this cycle**

   A tight statement of scope, in the dialogue, e.g.:

   > “This MegaWave will (a) reconcile mission docs across repos,
   >  (b) produce a megazip (or script) for local execution, and
   >  (c) leave receipts (CoPing / CoPong) that future sessions can rely on.”

3. **Megazip (or script-first) manifest**

   - **Default**: a megazip

     - Filename pattern: `MW_<MissionName>_<UTS>.zip`
     - Staging folder:   `$HOME/Downloads/CoTemp/MW_<MissionName>_<UTS>`
     - Expected contents:
       - One or more `Run_*.ps1` runner scripts.
       - Helper scripts (cross-repo verifiers, housekeeping tools, etc.).
       - README / NOTES files describing:
         - Purpose of the megazip.
         - Where each file is intended to land in which repo.
         - Which PRs or branches are expected.

   - **Exception**: “single big script instead of zip”

     For *fixup-only* or very small cycles:
     - A single runner script may be shipped instead of a full megazip.
     - That script must still:
       - Be paste-safe into PS7.
       - Create / update all required files.
       - Print at least one CoPing line at the end.

4. **CoBlock for this cycle**

   The dialogue must include at least one **complete CoBlock** that:

   - Creates the staging folder and all files for this MegaWave (or script-first fix wave).
   - Builds the zip in `Downloads\CoTemp` **or** writes the main runner script.
   - Computes and prints the `SHA256` of the zip (if using a megazip).
   - Prints a **CoPing line** for the cycle.

   One CoBlock is usually enough. If the payload is genuinely huge, two CoBlocks
   are allowed (e.g. “write files” then “zip + CoPing”), but the default is
   **one entry-point CoBlock per wave**.

5. **Receipts and CoPing / CoPong**

   - The CoBlock must end with a CoPing line, for example:

     `████ CoPing: [MW_<Mission>_<Wave>] [CU:x PU:y HU:z WT:w] [Session:…] [Mission:…] ████`

   - CoPong responses (from CLI scripts, CI, future sessions) should echo
     the same `[Mission:…]` identifier so IntentCloud / CoStatus can
     track the lineage of the work.

## 3. BPOE limits per MegaWave

A MegaWave should **push limits safely**, but not exceed them:

- **CU (Compute usage)**

  - Prefer scripts that operate locally on repos / docs / diagrams.
  - Avoid unbounded loops or unguarded external calls.
  - Where heavy work is needed, add comments and explicit guard rails.

- **PU (Process usage)**

  - Bundle *coherent* tasks into a single wave:
    - Example: “IntentCloud v0 ops” vs “random mix of six unrelated missions”.
  - If a CoBlock exceeds ~200–300 lines, consider:
    - Splitting into two sequential waves, or
    - Extracting generic helpers into repos and only wiring them in the CoBlock.

- **HU (Human load)**

  - Human steps should be minimal and clear:
    - “Paste CoBlock, run it.”
    - “Extract megazip, run a single runner script.”
  - More complex sequences must be justified in the Intent section and in
    the README shipped inside the megazip.

- **WT (Waits)**

  - Avoid long, opaque waits with no feedback.
  - For long-running scripts, log progress or break them into smaller steps.

## 4. Dialogue vs artifact responsibilities

- **Dialogue** (this system, this session):

  - Provides: commentary, intent, megazip / script description, and CoBlock(s).
  - Stays concise; avoids repeating large documents inline when they are
    already written into files by the CoBlock.

- **Artifacts** (files generated / updated by CoBlocks):

  - Carry the heavy payload:
    - Detailed operator guides.
    - Long-form BPOE rules and examples.
    - Multi-hundred-line helper scripts.

This keeps conversations readable while letting artifacts grow to whatever
size is needed for real work.

## 5. Script-first payloads

- Long docs, long scripts, and heavy logic belong in files created
  by CoBlocks, not in the chat transcript.
- The chat’s job is to deliver:
  - Commentary
  - Intent
  - CoBlock(s)
  - Paths + SHA256 + CoPing line

## 6. Exception handling

A session may choose *not* to run a full MegaWave when:

- A safety constraint is triggered (e.g. destructive operations).
- The human explicitly requests a tiny fix.
- The environment is clearly not ready (missing repos, tools, or context).

In these cases, the session should:

- Say explicitly why a MegaWave is not used.
- Prefer a small, well-scoped CoBlock that still:
  - Leaves a clear CoPing line.
  - Points back to this BPOE doc for follow-up.
