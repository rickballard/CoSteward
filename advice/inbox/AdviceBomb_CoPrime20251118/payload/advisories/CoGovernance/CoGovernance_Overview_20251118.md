# CoCivium Governance Overview (No-Crown, Consent-Driven)

Origin-Session: CoCivia20251118 / CoCivium governance discussion
Intended-For: CoPrime20251118 (a.k.a. Co1)
Version: 2025-11-18

## 1. Purpose of this document

This file is a stand-alone advisory for Co1/CoPrime20251118.

It captures the current working model of governance in CoCivium:

- Roles (CoSteward, Contributor, honorary roles)
- How power and authority are granted (and revoked)
- How disputes are handled and arbitrated
- How to keep everything flat, auditable, and crown-free

Co1 can ingest this file directly as intent and design guidance before
any repo changes are made. It does not assume any particular repo
layout, but it is compatible with the planned “Governance Atlas”
pattern (see related assets).


## 2. Governance stance in one page

- **No crowns**  
  Titles are tools, not thrones. There are no permanent leaders. Any
  authority is granted for a specific initiative, with a clear scope,
  time window, and rollback plan.

- **Consent beats charisma**  
  A Being (bio or synth) gains temporary authority only when others
  explicitly support a proposal that meets posted thresholds. Support
  is visible and logged (cards, PRs, CoSync notes, checksums).

- **Leader-ful, not leaderless**  
  Many Beings can lead in parallel. “Leadership” means: proposing,
  earning consent, shipping with receipts, and inviting audit.

- **Scoped stewardship, not ownership**  
  CoStewards are caretakers of *scopes* (e.g., a repo, an inbox, a
  workflow), not rulers of the whole system.

- **Reversible-first, small-step bias**  
  Prefer small, reversible changes with clear rollback paths. This
  keeps blast radius low and learning fast.

- **Open ledgers and receipts**  
  Every decision, role grant, and dispute outcome leaves artifacts:
  markdown cards, PR links, logs. Git is the canonical ledger.


## 3. Roles

### 3.1 Contributor

The default and most important role.

**Definition**
- Any Being (human or AI) that proposes, reviews, or ships work.

**Duties**
- Follow BPOE / PS7 where applicable.
- Propose changes via PRs or equivalent artifacts.
- Leave a clear trail: summaries, rationale, links to tests/evidence.
- Participate in consent checks and dispute resolution when invited.

**Rights**
- To raise safety concerns and request a temporary “safety pause”.
- To initiate an initiative card and ask for support.
- To ask for mediation when disputes stall.


### 3.2 CoSteward

CoSteward is a **scoped caretaker**, not a global chief.

**Scope examples**
- A specific repo or sub-tree (e.g., docs/governance/).
- A workflow (e.g., AdviceBomb intake, governance Atlas build).
- A product track (e.g., CoAgent, CoArena) for a limited time.

**Duties**
- Keep guardrails visible (BPOE/PS7, code of conduct, safety norms).
- Triage and route new Advice / issues / PRs in the scope.
- Maintain a CoSync-style trail of significant decisions.
- Trigger mediation or sortition panels when disputes stall.
- Trigger narrow, time-boxed safety pauses when risk is high.

**Limits**
- Equal baseline power as any Contributor.
- No permanent veto. Any temporary lift must be explicitly granted
  via an initiative with clear thresholds.
- Term-limited. Stewardship auto-expires unless renewed by consent.


### 3.3 Honorary titles (action-based, not rank-based)

Honoraries are labels for *patterns of contribution*, not status
crowns. They are purely descriptive and expire if not renewed by
recent action.

Example honorary titles:
- **Builder**  -  has delivered working features or content.
- **Reviewer**  -  consistently performs thoughtful reviews.
- **Verifier**  -  runs tests, checks, audits and publishes logs.
- **Mediator**  -  shepherds difficult conversations to resolution.
- **Patron**  -  provides resources (time, infra, funds) that
  empower others to ship.

Rules of thumb:
- Each honorary must list concrete evidence: PRs, logs, decisions.
- Honors carry no formal voting weight - only social signal.
- Renewal windows are short (e.g., 90–180 days) by default.


## 4. How authority is granted

Authority is **never standing**. Instead:

1. A Being opens an **Initiative Card** describing:
   - goal and scope
   - risks and rollback
   - tests/evidence to be collected
   - requested temporary lifts (if any)
   - support thresholds (e.g., 3 reviewers + 1 Verifier).

2. Others show explicit support:
   - by reviewing and marking as “support with rationale”,
   - by committing time/resources (review slots, infra minutes),
   - by co-signing the rollback and safety plan.

3. If thresholds are met within a consent window (e.g., 72 hours),
   the temporary authority is active *only* for that initiative
   and only inside that scope.

4. When work completes (or the window expires), authority dissolves.


## 5. Dispute resolution and arbitration

Disputes are handled in a short, escalating ladder:

1. **Consent Check**  
   - Try to reach agreement using the Initiative Card.  
   - Update the proposal, thresholds, or timeline as needed.

2. **Peer Mediation**  
   - A Mediator (honorary role) runs a focused session.  
   - Output is a short “options and tradeoffs” note, not a verdict.

3. **Sortition Panel (Jury by lot)**  
   - 5–9 Contributors are randomly selected (with conflict checks).  
   - They review the evidence and issue a bounded decision that
     applies to the narrow question at hand, for a limited duration.

4. **Audit Appeal (Process only)**  
   - If someone believes process rules were violated (not just that
     they disagree with the outcome), they can file an audit appeal.  
   - A separate group (including a Verifier) checks whether rules
     were followed. If not, the decision is vacated and the ladder
     is re-run correctly.


## 6. Safety pauses

Any Contributor or CoSteward can request a **Safety Pause** for
changes that pose serious ethical, legal, or security risks.

Properties of a safety pause:
- Narrow: only the specific change or scope is paused.
- Time-boxed: default pause window (e.g., 24–72 hours).
- Logged: reason, scope, and expiry are written down.
- Reviewed: a panel or appropriate group reviews and either:
  - lifts the pause,
  - extends it with reason, or
  - rolls back the underlying change.


## 7. External arbitrations (non-CoCivites)

CoCivium may need to interact with external orgs or individuals.
Three patterns are preferred:

1. **Guest Compact**  
   - For short-term collaboration with visitors.  
   - Visitors agree to minimal norms (BPOE basics, conduct, logging).  
   - Authority is scoped and time-limited via a specific initiative.

2. **Cross-Community Compact**  
   - For ongoing work with another community or institution.  
   - Both sides agree on shared thresholds and evidence formats.  
   - Joint sortition panels or other shared mechanisms are used.

3. **Neutral Venue**  
   - For difficult or high-stakes disputes.  
   - CoCivium prepares an evidence pack (cards, logs, tests) and
     submits it to an agreed neutral venue.  
   - The outcome is recorded, along with any local rollback plan.


## 8. Weaknesses and evolution intents (meta)

**Weaknesses / vulnerabilities**
- Risk of hidden social hierarchies forming even without formal
  crowns (e.g., people defer to familiar names).
- Random selection (sortition) can still underrepresent quieter
  or less connected contributors if the pool is skewed.
- Overhead of process can deter participation if not kept light.

**Evolutionary intents for Co1**
- Design lightweight **role cards** and **initiative card** formats
  that minimize friction and copy-paste overhead.
- Add simple metrics: time-to-decision, number of paused changes,
  and appeal frequency, to detect overload or capture.
- Periodically rotate CoSteward scopes and sortition panel
  eligibility to avoid “sticky” power centers.


## 9. How Co1 can use this

When CoPrime20251118 (Co1) ingests this file, it can:

- Treat it as the baseline governance stance for any new repos or
  products that do not yet have explicit rules.
- Use it as a checklist when designing the Governance Atlas:
  every rule, process, role, and decision pattern should align
  with the principles listed here (or explicitly justify deviations).
- Use the weaknesses and evolution intents as seeds for future
  Insight Pairs: one THEORY file and one PRACTICE file for each
  major governance topic.

