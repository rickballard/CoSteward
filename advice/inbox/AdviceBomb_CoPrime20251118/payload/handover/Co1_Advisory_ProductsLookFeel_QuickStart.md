# Co1 Advisory: Products Look & Feel Quickstart

**From**: Mobile session “Products look feel”  
**To**: CoPrime20251118 (future Co1 orchestrator session)  
**Intent**: Give Co1 a simple, actionable brief for unifying the look & feel of CoSuite products.

---

## 1. What this is

This file is a **short advisory** for Co1 about product look & feel. It is paired with a more complete spec:

- `CoSuite_DesignLanguage_CDL_v1_ProductsLookFeel.md`

Co1 can ingest this file as context and use it to:

- Decide where the design language should live on-repo.
- Plan how to roll it out across products (CoAgent, CoArena, CoEthicsGauge, CoCivia, etc.).
- Keep future UI work anchored to a consistent design language.

---

## 2. Summary of CDL v1 in plain terms

1. **Single family look**  
   All CoSuite products should feel like siblings: same general colors, type, spacing, and component patterns.

2. **Civic, not corporate**  
   The vibe is civic-tech: transparent, respectful, and calm. No hype, no dark patterns.

3. **AI + human collaboration is visible**  
   It should always be clear who did what: “Suggested by AI” vs “Confirmed by human,” with logs and timelines to track it.

4. **Tokens first**  
   Colors, typography, spacing, radii, shadows, and key components are defined as **tokens**, not ad-hoc values. Tokens can then be bound into Tailwind, CSS variables, or other design systems.

5. **Gradual convergence**  
   Existing products do not have to be rewritten at once. New screens should comply with CDL v1; older screens converge over time.

---

## 3. Concrete next actions for Co1

Suggested first set of steps when Co1 picks this up:

1. **Choose a repo home for CDL v1**
   - Candidates: `CoSteward` or a new design-system repo (e.g., `CoDesign` / `CoStyle`).
   - Create a `docs/ops/Design/` or similar path to host the canonical CDL file.

2. **Land the CDL v1 document**
   - Lift `CoSuite_DesignLanguage_CDL_v1_ProductsLookFeel.md` into the chosen repo.
   - Commit as a new file, with a clear message like “docs: add CoSuite/Civium Design Language CDL v1”.

3. **Create implementation tokens**
   - From the CDL text, derive:
     - Color tokens → normalized hex values.
     - Typography tokens → CSS / Tailwind config or equivalent.
     - Radius, spacing, and shadow tokens → design system variables.
   - Store these as code-level artifacts (e.g., a `tokens.json` or `theme.ts` file).

4. **Pick a first product to adopt CDL**
   - Recommended: **CoAgent**, since it is the flagship control room.
   - Apply CDL tokens and shared components to at least one key CoAgent screen (e.g., main panel layout).

5. **Define a lightweight design governance loop**
   - CDL changes land via PRs to the design doc.
   - New products must either adopt CDL or explicitly document why they diverge.
   - Consider adding a short “Design” checklist to PR templates in product repos.

---

## 4. How to use these assets

1. **Treat this file as the “instructions on the box.”**
   - Read once for orientation.
   - Use the paired CDL spec for details.

2. **When implementing or refactoring UI:**
   - Check colors, typography, spacing, and component patterns against CDL v1.
   - Prefer reusing patterns over inventing new ones.

3. **When in doubt:**
   - Default to transparency, agency, civility, and rigor with warmth.
   - If a design choice undermines any of those, reconsider.

---

## 5. Handoff status

- This advisory and the CDL v1 spec are **self-contained**; Co1 does not need PS7 or repo access to read and reason about them.
- Once Co1 has an active PS7/CLI context, the obvious next step is to:
  - Land CDL v1 into a repo.
  - Derive code-level tokens and components.
  - Begin applying CDL to CoAgent and CoArena.

Co1 is free to rename, split, or supersede this as the design system evolves.
