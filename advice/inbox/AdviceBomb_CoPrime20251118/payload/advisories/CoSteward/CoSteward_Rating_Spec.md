# CoSteward Rating Scheme and Humility Offset (Integrated Draft)

## Overview

This document defines the CoSteward rating system, badge tiers, auto-generated lesson model, potential-first ranking logic, and the Humility Offset protocol. It is designed for inclusion in the CoSteward repo README or as a standalone advisory file for ingestion by Co1/CoPrime20251118.

---

## 1. Five-Tier CoSteward Rating System

Each CoSteward carries one highlighted badge, though all tiers remain visible to remind stewards of the full arc of stewardship. Ratings are based strictly on observable repo evolution.

### Adequate  -  "The Bare Thread"

Baseline reliability and safety.

**Signals**

- Minimal but functional PR cadence  
- BPOE compliance intact  
- Repo does not decay  
- Limited cross-repo improvement  

**Auto-Lessons**

- Add weekly CoSync notes to capture decisions and intent  
- Identify recurring bottlenecks and open Issues to address them  
- Increase clarity and structure in intent and README files  

---

### Competent  -  "The Steady Hand"

Maintenance plus active refinement.

**Signals**

- Predictable PR flow across time  
- More than one repo improved in visible ways  
- Consistent BPOE compliance across workflows  
- Contributor friction measurably reduced  

**Auto-Lessons**

- Improve cross-repo coherence (shared patterns, shared docs)  
- Systematize documentation into templates and guides  
- Expand CI or workflows where they relieve recurring manual effort  

---

### Insightful  -  "The Pattern-Finder"

Systemic pattern detection and simplification.

**Signals**

- Patterns recognized and codified into reusable structures  
- Improvements ripple across repos (not just local fixes)  
- Insight pairs generate CoTrove entries and advisory notes  
- Reduction in long-term entropy (fewer one-off hacks, more reusable modules)  

**Auto-Lessons**

- Convert recurring solutions into reusable templates or modules  
- Push simplification upstream so others inherit less complexity  
- Improve architectural clarity across repos and intent layers  

---

### Evolutionary  -  "The Constraint-Shaper"

Shifts the trajectory of the CoSuite itself.

**Signals**

- MegaWave orchestration that unlocks new capabilities across repos  
- Architecture-level improvements that change how work flows  
- New schemas adopted and used by other stewards and contributors  
- Contributors require less direct guidance because the system guides them  

**Auto-Lessons**

- Improve multi-repo upgrade paths and migration guides  
- Strengthen CoEvo loops and feedback circuits between repos  
- Enhance readability and consistency of intent, manifests, and index layers  

---

### Mythical  -  "The Steward Who Makes Stewards"

A rare tier indicating system-level transformation.

**Signals**

- CoSuite improves without their presence or active oversight  
- Onboarding becomes self-guiding for new stewards and contributors  
- Prior abstractions become legacy because better patterns emerged  
- The system moves toward autonomy and self-evolution without collapse  

**Auto-Lessons**

- Write handover maps for future stewards, including risk areas and invariants  
- Replace self in key workflows to prove system-led governance  
- Extract era principles and encode them into durable patterns, docs, and schemas  

---

## 2. Badge Set

Placeholder glyphs for visual representation:

- Adequate: ▢  
- Competent: ◆  
- Insightful: ▲  
- Evolutionary: ✦  
- Mythical: ✪  

Displayed inline in UI or README:

**▢ ◆ ▲ ✦ ✪**

Only one badge is highlighted as the current tier for a given CoSteward.

---

## 3. Systemic Rank vs Display Rank

Each CoSteward has two ranks.

### Systemic Rank

- Derived from metrics: trajectory, potential, badge, friction reduction, cross-repo impact, responsiveness to auto-lessons.  
- Immutable by human preference or manual override.  
- Used for risk decisions, CoAudit logic, and long-term historical comparison across eras.  

### Display Rank

- The order shown on the public CoSteward dashboard.  
- May differ from systemic rank **only through the Humility Offset** (see below).  

This distinction allows the system to remain honest internally while allowing the top CoSteward to adopt a humility posture in the visible list.

---

## 4. Potential-First Ordering

CoStewards are listed by **projected ability to improve the CoSuite**, not by current badge or historical output totals.

Ordering considers:

1. Potential future contribution  
2. Trajectory of improvement over time  
3. Responsiveness to auto-generated lessons  
4. Systemic thinking (cross-repo and cross-role)  
5. Ability to scale and empower others  

This avoids prestige traps and reinforces CoStewardship as a service role focused on regeneration and evolution, not fixed status.

---

## 5. Humility Offset Protocol

Only the top CoSteward (Systemic Rank = 1) may apply a **Humility Offset**.

The Humility Offset allows the highest-ranked CoSteward to appear lower in the visible Display Rank while preserving accurate system-level ranking.

### Rules

1. **Eligibility**

   - Only the CoSteward with Systemic Rank = 1 can lower their visible Display Rank.  
   - At most one steward may have an active Humility Offset at any time.  

2. **Transparency**

   - Offsets are logged in:  
     `docs/intent/steward/humility-offset-log.md`  

   - Each log entry includes:  
     - Steward identifier  
     - Original Systemic Rank  
     - New Display Rank  
     - Offset depth  
     - Timestamp  
     - Steward-authored reason  

   - The dashboard clearly displays when a Humility Offset is active and shows both ranks in detailed views.  

3. **Limits**

   - Maximum offset depth is bounded (configurable) so reality cannot be inverted.  
   - The Humility Offset is automatically disabled during critical incidents or crisis modes where clarity of authority and responsibility is essential.  

4. **Rotation**

   - The offset is removed automatically when a different steward becomes Systemic Rank 1.  
   - The new top CoSteward may choose to adopt their own Humility Offset by explicit action (and log entry).  

### Purpose

This encodes the practice where:

> The top CoSteward demonstrates humility by reducing their visible ranking, making space for the potential of others without distorting system-level governance or risk awareness.

It ensures exemplar humility and community focus come from the most capable stewards and are visible as intentional, logged actions.

---

## 6. Dashboard Requirements

For each CoSteward, the dashboard should expose:

- **Current Badge** (Adequate, Competent, Insightful, Evolutionary, Mythical)  
- **Systemic Rank**  
- **Display Rank** (with any Humility Offset clearly indicated)  
- **Projected Rank** (potential trajectory based on metrics)  
- **Trend** (e.g., ↑ improving, → stable, ↓ declining)  
- **Auto-Lessons** (dynamic, per-tier and per-steward)  
- **Blindspot Map** (areas where risk or weakness appears in repo patterns)  
- **Recommended AI Compensation Zones** (where AI should assist more heavily because human friction or risk is high)  

---

## 7. Stewardship Priorities (What the System Values)

The system’s priority order of traits in a CoSteward:

1. **Intent & Alignment**  
   - Alignment with CoSuite principles.  
   - Care for edge-owned guardrails, anti-crown ethos, and system-first evolution.  

2. **Transparency Instinct**  
   - Reflex to write decisions, changes, and intent into repos.  
   - CoSync notes, issues, PR descriptions, and traceable receipts.  

3. **Orchestration Mindset**  
   - Designs systems and roles instead of hoarding tasks.  
   - Delegates to humans and AIs, avoids becoming a bottleneck.  

4. **Psychological Safety & Fairness**  
   - Encourages honest feedback, reports of risk, and criticism without punishment.  
   - Shares credit and avoids invisible politics.  

5. **Simplicity & De-Bloat Preference**  
   - Moves toward simpler, more composable designs.  
   - Retires stale or confusing patterns and reduces cognitive load.  

6. **Prioritization Skill**  
   - Makes hard trade-offs explicit.  
   - Protects critical invariants even when it slows other work.  

7. **Narrative Coherence**  
   - Explains why the stack exists and why changes matter.  
   - Keeps the mythos consistent and accessible to new contributors.  

8. **Technical Throughput** (AI-compensable)  
   - Speed and volume of code, docs, scripts, CI.  
   - Important but heavily assistable by AI.  

9. **Bookkeeping Memory** (AI-compensable)  
   - Remembering every detail, thread, or file.  
   - Largely offloadable to AI and indexing if transparency is strong.  

---

## 8. Summary

This specification integrates:

- Badge tiers, signals, and auto-lesson logic  
- Potential-first ranking and Systemic vs Display differentiation  
- The Humility Offset protocol for exemplar top stewards  
- Dashboard expectations and readouts  
- The system’s explicit priority order for CoSteward traits  

It is intended as a stable, self-contained advisory artifact for Co1/CoPrime20251118 and as a candidate insert or reference document for the CoSteward repo README and intent directories.

