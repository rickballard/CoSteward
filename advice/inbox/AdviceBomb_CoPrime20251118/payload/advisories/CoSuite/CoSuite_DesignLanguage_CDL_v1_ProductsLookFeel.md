# CoSuite / Civium Design Language (CDL v1)  -  Products Look & Feel

**Session**: Products look feel (mobile handoff)
**Intended consumer**: Future Co1 orchestrator session (CoPrime20251118, “Co1”)
**Status**: Draft v1.0, ready for immediate use as advisory/intent

---

## 1. Purpose

This document defines a **shared design language** that all CoSuite products can slowly converge toward.

It is intended to be:

- A **North Star** for look and feel across CoAgent, CoArena, CoEthicsGauge, CoCivia, CoCore, CoCache, CoSteward, CoPolitic, etc.
- A **repository-agnostic advisory**: Co1 can ingest it directly from this file (no repo access required) and later land it into an appropriate repo (likely `CoSteward` or a future `CoDesign`/`CoStyle` repo).
- A **stable reference** for future UI/UX work, token definitions, and design system implementation.

Co1 is free to refactor, rename, or split this into multiple files, but it should treat this as the seed canonical description for **CDL v1**.

---

## 2. Brand pillars

All visual and interaction decisions should align with at least two of these pillars:

1. **Transparency**  
   Interfaces show what is happening, why it is happening, and how to inspect or challenge it.

2. **Agency**  
   Next actions are clear, safe, and undoable when possible. Avoid locking users in or hiding consequences.

3. **Civility**  
   Tone is respectful, neutral, and non-manipulative. No snark, no dark patterns, no fake urgency.

4. **Rigor with warmth**  
   Data and structure are precise and auditable, but the experience feels approachable and human rather than clinical.

If a design choice conflicts with these pillars, it should be revisited before shipping.

---

## 3. Visual tokens

This section defines **token names and meanings**, not exact hex values. Co1 can later bind these tokens to concrete values per platform (web, desktop, mobile).

### 3.1 Color tokens

**Neutrals**

- `cs-neutral-100` – App background
- `cs-neutral-200` – Panel / card background
- `cs-neutral-300` – Subtle borders, dividers
- `cs-neutral-400` – Secondary text, muted icons
- `cs-neutral-600` – Primary text
- `cs-neutral-800` – High-contrast text or critical emphasis

**Accents**

- `cs-accent-civic` – Primary action color (links, main buttons, key highlights)  
  _Feeling_: calm, civic, trustworthy; typically a blue or teal.

- `cs-accent-human` – Human presence accent (avatars, “human override” actions, comment badges, human feedback)  
  _Feeling_: warm, human, empathetic; typically a coral or amber.

**Semantic colors**

- `cs-status-success` – Success, good outcome, “all clear”
- `cs-status-warning` – Needs attention, but not failure
- `cs-status-danger` – Errors, risky actions, destructive operations
- `cs-status-info` – Neutral notifications and FYI banners

**Usage rules**

- Neutrals dominate; accents are used sparingly to draw attention.
- `cs-accent-civic` is the default primary call-to-action color.
- `cs-accent-human` is reserved for **people and human decisions**, not general decoration.
- Semantic colors should be applied consistently across products.

---

### 3.2 Typography tokens

**Primary font**

- A modern, legible sans serif (e.g., Inter or the system UI stack).

**Secondary font**

- Monospaced font for logs, code, IDs, and other AI- or system-facing text.

**Type scale (relative)**

- `cs-font-h1`  -  Page titles: ~1.75–2.0 rem, bold
- `cs-font-h2`  -  Section titles: ~1.4–1.6 rem, semi-bold
- `cs-font-h3`  -  Sub-section titles: ~1.1–1.3 rem, medium
- `cs-font-body`  -  Main text: ~0.95–1.0 rem, regular
- `cs-font-meta`  -  Captions / labels: ~0.85–0.9 rem, regular or light

**Rules**

- Avoid using more than **three font weights** on a single screen.
- Prefer **sentence case** for headings and buttons.
- Reserve **ALL CAPS** for small labels, tags, and chips.

---

### 3.3 Spacing, radius, and shadows

**Spacing scale**

- Base unit: 4 or 8 px. Example (4-based): 4, 8, 12, 16, 24, 32, 40, 56…
- Choose once per product and stick to it; do not mix arbitrary spacing values.

**Corner radius tokens**

- `cs-radius-sm` – Chips and small tags
- `cs-radius-md` – Buttons, inputs, standard cards
- `cs-radius-lg` – Large hero panels, modals, key surfaces

**Shadows**

- Prefer subtle shadows and clear borders.
- Use slightly stronger shadows only for modals and floating panels above the main canvas.

---

## 4. Layout and shared components

### 4.1 Layout skeleton

Most CoSuite apps SHOULD adopt this skeleton:

- **Top bar**
  - Product name and logo.
  - Optional mission or context breadcrumb.
  - Global actions such as search, settings, and profile.

- **Left navigation (when applicable)**
  - Main sections or modes (e.g., panels in CoAgent and CoArena).

- **Main content area**
  - Cards, tables, forms, visualizations.

- **Right rail (optional)**
  - Context: logs, explainers, “what is this doing?” panels, secondary tools.

This skeleton should feel predictable and familiar across products.

---

### 4.2 Shared components

The following components should be defined in a cross-product design system and reused wherever possible:

- Buttons (primary, secondary, ghost/text, destructive).
- Cards (title, optional meta line, body, primary action).
- Tabs / segmented controls.
- Tables and compact lists.
- Tag chips (e.g., `Draft`, `Live`, `In review`, `Blocked`).
- Status banners (info, success, warning, danger).
- Timeline / activity feed (actor, time, event, outcome).
- Dialogs and side drawers (consistent header, close affordance, content, action bar).

**Shape language**

- Rounded rectangles for panels, cards, and inputs.
- Circles for avatars and human identity markers.
- Pills for tags, state chips, and small filters.

---

## 5. AI + human collaboration patterns

All CoSuite UIs should make **who is acting** and **how decisions are made** obvious:

- **Attribution**
  - Distinguish clearly between “Suggested by AI agent X” and “Edited/approved by human Y.”
- **Review flows**
  - Use consistent states: `Proposed`, `Under review`, `Approved`, `Rejected`, etc.
- **Reasoning access**
  - Include an affordance like “Why was this suggested?” that opens a compact explanation or links to logs.
- **Logs / timelines**
  - CoEvo and decision logs show both AI and human activity, with filters for each.

These patterns should be implemented once and reused by CoAgent, CoArena, CoEthicsGauge, CoCivia, CoCore dashboards, etc.

---

## 6. Voice and content style

The tone of all microcopy should be:

- Clear and concrete (plain language, short sentences).
- Respectful and neutral.
- Honest about uncertainty and limitations.

**Examples**

- Prefer “You don’t have access to this yet. Ask a steward to add you.” over “Access denied.”
- Prefer “Something went wrong while saving. Try again in a moment.” over “Critical system failure.”

Error messages SHOULD:

- State what went wrong in simple terms.
- Indicate whether data might be at risk.
- Offer at least one actionable next step.

---

## 7. Product-level notes

### 7.1 CoAgent

- Role: flagship **control room**.
- Uses the full token set and shared components.
- Heavy emphasis on logs, timelines, and AI/human attribution patterns.

### 7.2 CoArena

- Role: **Arena / game layer** on top of CoAgent capabilities.
- Shares all tokens and components.
- Adds gamified overlays (scores, badges, progress meters) but does not introduce new fonts or arbitrary palette changes.

### 7.3 CoEthicsGauge

- Role: ethics and alignment assessment dashboard.
- Strong focus on neutrals, clear data visuals, and structured commentary.
- Uses `cs-accent-human` to highlight human commentary, disagreements, and ethics notes.

### 7.4 CoCivia

- Role: narrative / outreach / everyperson bridge.
- Reuses core tokens and components.
- Allows more expressive photography and illustration, especially around the CoCivia “everyperson” archetype.
- Buttons, typography, and basic layout still obey CDL tokens.

### 7.5 Infrastructure products (CoCore, CoCache, CoRef, etc.)

- Role: internal / semi-internal infrastructure and reference surfaces.
- UI may be lean: mostly tables, filters, logs.
- Still use the same typography, color semantics, and base components to maintain a coherent “CoSuite feel.”

---

## 8. Evolution and governance

- This file is the **seed canonical reference** for CDL v1.
- Future changes should land via PRs against a repo-backed copy (for example in `CoSteward` or a dedicated design system repo).
- Each change SHOULD update a short changelog and note which products are expected to adopt the change.

### 8.1 Versioning model

- Major versions (v1, v2, …) indicate significant visual/interaction shifts.
- Minor versions (v1.1, v1.2, …) indicate refinements (token tweaks, new common components).

### 8.2 Initial changelog

- **v1.0**  -  First draft of CoSuite / Civium Design Language, produced as a mobile-session advisory for CoPrime20251118 (“Co1”) to ingest and land on-repo.

