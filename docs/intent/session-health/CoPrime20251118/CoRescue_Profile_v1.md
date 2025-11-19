# CoRescue Profile v1 – CoPrime20251118

CoRescue is what we do when a session is already in HARD or FATAL CoBloat.

## When to CoRescue

Indicators:

- Pages only load on fresh browsers with empty cache.
- Login flow or 2FA is triggered repeatedly in a short window.
- Conversation history only loads partially or fails frequently.
- The human explicitly mentions the session being 'killed from behind' or similar language.

Evidence for these conditions can be found in CoPrime-era advisories inside the AdviceBomb payload and in the session wrap reports listed in:

- \$triageRel\

## CoRescue actions

1. **Stop heavy usage**:
   - Do not attempt long or complex workflows in the failing session.
   - Use it only to extract a last summary or quick hints.

2. **Extract minimal wisdom**:
   - Summarize:
     - Key patterns discovered (e.g. CoBloat, CoRotate, CoPortal, CoPulse).
     - Critical risks and mitigations found in the last waves.
   - Put this into:
     - A new CoSteward intent note, and/or
     - A file in the AdviceBomb payload.

3. **Archive to repo**:
   - Move or copy all relevant locally-saved assets into:
     - advice/inbox/AdviceBomb_<Label>/
   - Zip and log in INBOX_LOG.md.

4. **Switch to a new orchestrator**:
   - Create or activate the successor session (e.g. CoPrime20251118).
   - Provide it with:
     - The AdviceBomb path.
     - The CoPrime handover note.
     - Any CoAnchor / CoPortal quickstart docs.

5. **Post-mortem**:
   - In the new session, write a short incident-style note:
     - What went wrong?
     - How long did it take to notice?
     - How did CoRescue perform?
   - Store it under docs/intent/session-health/<date>/.

## CoRescue goal

CoRescue is not to save the failing session, but to:

- Rescue the **wisdom**.
- Minimize human frustration and time waste.
- Tighten the CoBloat detectors and CoRotate triggers for next time.
