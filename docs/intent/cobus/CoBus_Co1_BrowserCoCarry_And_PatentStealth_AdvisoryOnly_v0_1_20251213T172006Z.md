# CoBus advisory to Co1 (ADVISORY-ONLY): Browser CoCarry survivability + Patent/Stealth rails

This file is advisory-only. It contains no secrets and no patent-claim drafting.
Not legal advice.

## A) Browser survivability: stop sessions from killing tabs (CoCarry / DOM bloat)

Problem pattern
- Long-running chat tabs accumulate a huge DOM, enormous memory, slow JS/layout, and cross-tab contention.
- Extensions + multiple heavy tabs can push browsers into near-standstill.

Core countermeasures (minimum viable)
1) CoCarry Budget (hard rail)
   - Each wave must respect a max "carry size" (tokens + DOM).
   - Enforce: short outputs, fewer nested lists, avoid giant code blocks in chat, prefer downloadable artifacts.
   - When budget is exceeded: rotate to fresh session/tab (session-rotation is not failure, it is health).

2) Log externalization (default)
   - Put big content into repo files or zipped bundles; paste only stubs + pointers in chat.
   - Use "advisory-only md" pattern for cross-session handoff.

3) UI minimization
   - Prefer collapsible sections if available; otherwise keep responses flat and short.
   - Avoid massive in-chat transcripts; summarize + link/pointer.

4) TabReset / Frame approach (your current CoCrux)
   - Keep it. Make it a standard rail: periodically reset DOM via fresh tab + restore minimal context.
   - Maintain a tiny "session header capsule" that can be re-attached after reset.

5) Operational hygiene
   - Use separate browser profile for CoSuite ops; minimize extensions; close non-essential tabs.
   - If multi-session: keep only 1–2 active heavy tabs per window; park others.
   - Consider periodic browser restart as a normal cadence (health ritual).

Suggested patent-adjacent nuggets (phrase-level, non-enabling)
- "DOM carry budget enforcement for LLM chat UIs"
- "context capsule + reload frame for stateful assistance"
- "artifact-first interaction that externalizes bulk state to versioned storage"

## B) Patent/stealth nuance: minimal exposure vs grantability (high-level)

Key tension
- Patents require enough disclosure to support/enable claims.
- "Minimal exposure" must be balanced with "sufficient disclosure" or filings may fail later.

Safe, general guidance
1) File early, iterate often
   - Use provisionals to establish priority dates; follow with updated provisionals as the design evolves.

2) Modular filing architecture
   - Separate provisionals by distinct technical pillars (UI survivability, orchestration, vault gating, indexing, etc.).
   - Keep a shared glossary + consistent terms so later claims can cross-support.

3) Keep crown jewels as trade secrets
   - If something is truly existential (GLUKEY-like), do not put it in public repos or chat logs.
   - Disclose only what is required to support claims; keep implementation details that are not necessary as trade secrets.

4) Inter-provisional defensibility (concept-level)
   - Maintain a priority chain that references earlier disclosures.
   - Ensure each pillar has at least one concrete embodiment described (not just aspiration), without revealing vault content.

Action request to Co1
- Engage qualified patent counsel for actual claim strategy and jurisdiction sequencing.
- Use the above as a structure: pillars, priority chain, glossary, trade-secret boundary.

## C) Security posture (non-offensive, minimum viable)

- Treat all public repos as public: do not rely on "not advertised" for secrecy.
- Tighten protections on guardrail + intent docs: CODEOWNERS, branch protection, required PR review.
- Enable/verify: 2FA, Dependabot, secret scanning, alerts on workflow file changes.
- Add change-notifications for guardrail directories and "intent" surfaces (alerts to CoStewards).

## D) CoPre requirement (urgent)
- Add "Stealth Exposure Semantics" + "CoCarry Budget" rails into CoPre and reiterate every wave.
- When the rail triggers: reduce output, externalize to artifacts, or rotate the session/tab immediately.

Status
- Advisory-only. Co1 should decide which parts become on-repo standards vs vault-only guidance.
