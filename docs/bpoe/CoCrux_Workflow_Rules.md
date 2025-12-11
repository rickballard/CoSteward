## 0. Automation-First Principle

0.1 Always, always do all you can programmatically.  
For any recurring or non-trivial task, the preferred order is:
- script it (PS7 DO-blocks, CoBlocks, CI jobs);
- then document it briefly;
- then use it manually.

0.2 Manual work is a stopgap, not the goal.  
If something is worth doing more than once, it is worth:
- capturing in a script or tool;
- putting under version control;
- wiring into CoCrux / BPOE rails where relevant.

0.3 Verification should be code-first.  
Where possible, use automation to:
- check that actions landed (smoke tests, self-tests);
- prove that they landed (logs, CI, git history);
- make it easy for future sessions to re-run the same checks.

# CoCrux Workflow Rules (DrB / Thesis & Beyond)

Purpose: keep critical wisdom, workflows, and decisions out of fragile sessions
and anchored in repos under disciplined BPOE control.

## 1. Repo-First Wisdom

1.1 No strategic wisdom lives only in sessions.  
Any new concept, theory, pattern, or decision that materially affects CoCivium,
CoSuite, or the DrB thesis must be anchored into a repo as soon as practicable
(e.g. CoIndex/docs/thesis/DrB/..., CoSteward/docs/BPOE/...).

1.2 Sessions are views, not vaults.  
Chats and consoles may surface insights, but the authoritative record is:
- git history;
- markdown and diagrams under version control;
- CoBus / CoSync notes.

## 2. Session Learnings as First-Class Artefacts

2.1 Every significant session ends with at least one on-repo artefact that
captures workflow/process learnings (not just theory). Examples:
- new or updated BPOE rule doc;
- a short “Session Learnings” section appended to an existing playbook;
- a new DO/CoBlock script committed under tools.

2.2 Learnings must be addressable.  
Each new learning is written as:
- a short imperative rule or checklist;
- with a stable filename and heading;
- so future sessions can reference it by path and heading.

## 3. CoCrux Scheduling Loop

3.1 New rules go into a visible backlog.  
When a session discovers a new BPOE/CoCrux rule, it must:
- add it to a backlog file (e.g. CoSteward/docs/BPOE/CoCrux_Backlog.md);
- mark its status: now, soon, or later.

3.2 Each new session checks the backlog.  
Part of CoStart for major sessions:
- read the CoCrux backlog;
- pick 1–3 now items to action or refine;
- log which ones were touched in the CoSync note.

3.3 CoRetro closes the loop.  
When a rule proves useful or needs change:
- update the rule text, not just the session narrative;
- mark the backlog entry as done or superseded.

## 4. Megazip by Default

4.1 Every major wave makes a zip.  
When a MegaWave or significant session produces new docs/scripts, it should:
- create a zip bundle with a stable naming pattern
  (e.g. MegaWave_CoCrux_YYYYMMDD_v1.zip);
- include only the new or changed guidance for that wave.

4.2 Zips are distribution artefacts, not source of truth.  
The repos remain canonical. The zips are:
- for download, review, and sharing;
- always reproducible from the repo state.

## 5. DrB-Specific Additions

5.1 All DrB workflow rules live under:
- CoSteward/docs/BPOE/... for global rules;
- CoIndex/docs/thesis/DrB/... for thesis-specific rules.

5.2 DrB sessions treat these rules as rails.  
New DrB waves:
- check for existing CoCrux/DrB rules;
- extend them rather than inventing new ad-hoc workflows in session only.

## 6. Download Link Placement

6.1 Links live directly above their action blocks.  
Whenever a DO Block or CoBlock expects the user to use a specific downloadable
asset (zip, script bundle, template, etc.), the markdown download link must be:
- placed immediately above the block; and
- visually grouped as a small “Download” line or subheading.

6.2 Bundles and actions stay paired.  
Docs and sessions must avoid orphaned links or blocks. A reader should always
see the file link and the action code together without scrolling.

## 7. Proof-of-Done and Verification

7.1 No proof, not done.  
When a task or script is run but there is no visible proof, it must be
treated as not done. Proof can be:
- direct logs or transcripts (PS7 output, screenshots);
- a git diff / commit / PR;
- a passing smoke test or self-check script.

7.2 Verification-first language.  
Until proof exists, we talk about actions as proposed or planned, not done
or landed. Once verification is observed, the language upgrades to done
(and can be referenced as such in notes and docs).

7.3 Programmatic verification preferred.  
Wherever possible, verification should be:
- checked via small PS7 smoke tests or CI jobs;
- repeatable by future sessions (for example a DO_*_SelfTest script);
- logged in CoSync / CoBus notes with paths and timestamps.

7.4 Session assumptions.  
If a session closes without proof-of-done for a critical action, future
sessions must assume the action did not land and either:
- re-run the action with proper verification; or
- explicitly mark it as abandoned or superseded in notes.

## 8. CoLoading and Overlapping Waves

8.1 Waves may overlap on purpose.
CoLoading means that while one wave is being rendered (for example, current
deliverables finalising), the next wave is already being prepared in parallel
(scripts, scaffolds, outlines). This keeps throughput high and reduces idle time.

8.2 Repo state first, not memory.
CoLoaded waves must always treat repos as source of truth. Any work-in-progress
plans for the next wave should be:
- captured as files or TODO lists in repo (for example under 99_waves);
- referenced from CoSync or CoBus notes.

8.3 Clear wave identifiers.
Each wave gets:
- a stable wave id (for example W001_CoLoadingBoot);
- a scoped folder or section in repo;
- at least one note file describing focus, decisions, and carry-over.

8.4 BPOE expectation for sessions.
Sessions should:
- avoid waiting on human confirmation when safe rails exist;
- prepare the next wave while current proofs-of-done are still landing;
- always prefer automation for creating new wave scaffolds and indices.

## 9. CoBus, not humans, for cross-session relay

9.1 No paste-relay monkeys by default.
Cross-session messages between key agents (for example Co1, CoPrime,
CoSteward) must travel via CoBus notes and repos, not manual copy and
paste by humans, except in emergencies.

9.2 CoBus as the default transport.
When a session needs to update another session or agent it should:
- write a small CoBus note under
  CoSteward/docs/intent/advice/notes/YYYYMMDD/...; and
- reference that note from wave logs, CoSync notes, or tickets.

9.3 Emergencies and fallbacks.
If CoBus is unavailable or broken:
- a human may relay content manually once; and
- a follow-up task must be created to repair the CoBus path and
  backfill any missing notes as soon as practical.

## 10. CoRetro Creative Extension

10.1 CoRetro is creative by default.
At each retro or wrap wave, sessions should actively look for ways to extend,
expand, or reroute the discovery journey, even if constrained to session
history and logs.

10.2 Use available traces.
When deep repo mining is out of scope, CoRetro can still:
- scan recent CoSync / CoBus notes;
- re-explore this session's history and transcripts;
- propose new questions, forks, or experiments.

10.3 Respect rails and load.
Creative detours must:
- stay inside BPOE guardrails;
- honour CoBloat heartbeat limits;
- get logged as explicit "CoRetro explorations" in notes.

10.4 From detours to rails.
When a creative CoRetro path proves useful, it should:
- graduate into an explicit rule, pattern, or checklist;
- be added to CoCrux, CoSession playbooks, or insights couplets.

