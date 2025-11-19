# CoRotate Playbook v1 – CoPrime20251118

CoRotate is the proactive pattern for rotating from a heavy session into a fresh orchestrator while keeping intent and wisdom.

## Triggers

Rotate when you see one or more of:

- Repeated login prompts or reload loops.
- Very slow message send / receive behavior.
- Context obviously being dropped or truncated.
- Human expresses desire to 'treat the old chat as disposable' and push wisdom into repo.

These are often visible in AdviceBomb payload files such as:

- Co1_Mobile_Session_Sweep_Advisory.md
- Co1_Handover_Intent_CoPrime20251118.md
- Co1_Handover_Risks_And_Mitigations.md

## Minimal CoRotate protocol

1. **Snapshot the intent**:
   - Summarize mission, key repos, and current waves into a single CoSync or CoPrime note.
   - Example: CoSteward/docs/intent/notes/CoPrime20251118_Handover_v1.md

2. **Ingest the loose files**:
   - Bundle desktop / local notes into a folder (e.g. Drop_For_Co1).
   - Create an AdviceBomb (zip + manifest + INBOX_LOG entry).
   - Current example:
     - \$adviceBombZipRel\

3. **Name the successor session**:
   - Give the new orchestrator a stable name (e.g. CoPrime20251118).
   - Treat that as the canonical label in repo notes and tools.

4. **Attach CoAnchor / CoPortal hints**:
   - Provide the new session with:
     - CoAnchor-style quickstart.
     - Pointers to CoSteward, CoCivium, CoCache, and key intent docs.

5. **Drop the old session**:
   - Stop feeding it new complex work.
   - Use it only for quick references until it is fully replaced.

## CoRotate checklists

For humans:

- [ ] Is there a CoSync note that describes current mission and repos?
- [ ] Has the recent intent been zipped and logged in INBOX_LOG.md?
- [ ] Does the new session have the CoAnchor / CoPortal quickstart?
- [ ] Is the old session explicitly marked as 'disposable' in notes?

For AIs:

- [ ] Do you know where the AdviceBomb and triage docs live in the repos?
- [ ] Can you see the CoPrime session-health docs?
- [ ] Can you propose new DO Blocks purely from repo context?

## Relationship to CoRescue

- CoRotate is proactive and planned.
- CoRescue is reactive and emergency-driven.
- Both use AdviceBombs and CoSync notes, but CoRescue assumes the source session is already in trouble.
