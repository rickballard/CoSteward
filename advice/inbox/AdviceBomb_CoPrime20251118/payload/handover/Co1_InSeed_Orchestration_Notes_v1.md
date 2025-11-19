# Co1 InSeed Orchestration Notes v1
_Handoff notes for CoPrime20251118 / Co1 regarding InSeed.com and the InSeed business plan_

## 1. Context

Rick is pivoting InSeed from a legacy identity (angel fund / generic consulting) toward a focused role:

> A boutique, vendor-neutral advisory that helps Transition/Transformation Offices in partner-led firms make safer AI and data decisions, with clear guardrails and governance awareness.

InSeed.com is already wired to a repo under `rickballard`, but the live site currently shows:

- Mixed old and new concepts (CoAudit, CoFlow, CoMirror, CEO Survival Guide).
- Visible placeholders (e.g. “Hero placeholder” text).
- Pages that look like half-finished experiments (directory-like Resources, skeletal Services, etc.).

This session’s job is to give Co1 the assets needed to:

1. Tidy the current site quickly (triage).  
2. Align public content with the emerging InSeed business plan.  
3. Keep internal strategy (the full blueprint) out of public view.

These notes describe how Co1 should approach that work.

---

## 2. Key assets handed to Co1

Co1 should ingest and understand at least these two documents:

1. **`Co1_InSeed_BusinessPlan_SiteBlueprint_v1.md`**  
   - Internal-only blueprint containing:
     - Positioning and target clients.
     - Initial offering stack (Vendor-Neutral Guardrail, Partner Pitch Pack, Governance Blueprint).
     - Page-by-page content outlines for InSeed.com.
     - Tone, design direction, and graphics-handling rules.
     - Serialized instructions for a future “site evolution” session.

2. **`InSeed_Site_Triage_Pass_v1.md`**  
   - Operational checklist for a fast clean-up of the current InSeed.com site.
   - Assumes existing pages and navigation structure.
   - Focuses on removing placeholders, fixing the CEO Survival Guide path, and making key pages look complete.

These two files should be treated as the **authoritative upstream sources** for InSeed.com work.

---

## 3. Recommended sequence for Co1

Co1 should approach InSeed in three main phases.

### Phase 1 – Triage & stabilise the current site

- Use `InSeed_Site_Triage_Pass_v1.md` as a literal checklist.
- Work in a short-lived feature branch (for example, `inseed-triage`).
- Make the smallest possible changes that:
  - Remove obvious “under construction” signals.
  - Make the Steward CEO / CEO Survival Guide content feel deliberate.
  - Give each top-level page enough content to look intentional.

Criteria for completion:

- No visible placeholders.
- No obviously empty template pages.
- CEO Survival Guide path is clean (home → exec summary → whitepaper download).
- Resources page is curated, not a file dump.

Once satisfied, merge and deploy so that InSeed.com becomes safe to show to senior visitors as a “v0.9” site.

### Phase 2 – Align content with the blueprint

After triage is live, switch to a new branch (for example, `inseed-blueprint-v1`) and:

1. Load `Co1_InSeed_BusinessPlan_SiteBlueprint_v1.md`.  
2. Compare current page content with the blueprint’s section 7 (“Page-by-Page Content”) and section 11 (serialized evolution instructions).  
3. Adjust:

   - Home hero and subhead to emphasise:
     - Guardrails for AI and transformation decisions.
     - Focus on partner-led firms and Transition Offices.

   - Services page to describe the three main offerings in blueprint language, even if the public labels still mention CoAudit/CoFlow/CoMirror for continuity.

   - “Why InSeed” and “About” to align with the vendor-neutral, partner-politics-fluent, governance-aware narrative.

4. Keep graphical changes modest in this phase; text and layout alignment is more important.

Criteria for completion:

- A new visitor can answer, within 10–20 seconds:
  - What InSeed is.
  - Who it helps.
  - What three main services exist.
  - How to contact Rick.

- The narrative on the site matches the blueprint’s intent, even if legacy names (CoAudit, etc.) are still present in places.

### Phase 3 – Optional refinements and diagrams

Using the graphics rules in the blueprint:

1. Scan for `.svg` and other diagram assets.
2. Prioritise hand-made diagrams (typically exported from Google Drawings).  
3. Ignore or quarantine programmatically generated diagrams unless they are obviously clean and legible.
4. Introduce, at most, one or two diagrams where they clearly strengthen the story:
   - For example, a simple “decision guardrail” map or a visual of the vendor-neutral evaluation process.

Do **not** expose internal graphics inventories or experimental assets directly via public links.

---

## 4. Privacy and exposure rules

For Co1:

- The full blueprint file (`Co1_InSeed_BusinessPlan_SiteBlueprint_v1.md`) is **internal**.  
  - Do not place it in any directory that the static site generator publishes.
  - Do not link to it from public pages.
  - If stored in a repo, keep it:
    - In a private repo, or
    - In a non-published `internal/` subtree with clear `.gitignore` / build exclusions.

- Any future planning documents for InSeed (deeper business plans, pricing models, staffing notes) should follow the same pattern: accessible to Co1, invisible to the public.

- Public-facing references to CoCivium / CoSuite should stay high-level unless and until there is a clearly designed public narrative for them on InSeed.com.

---

## 5. Exit criteria for Co1’s InSeed wave

Co1 can treat this InSeed wave as substantially complete when:

1. The triaged site is live and checked.  
2. The content is aligned with the v1 blueprint in terms of positioning, offers, and tone.  
3. At least one or two friendly reviewers (for example, Pam or equivalents) can browse the site and find it coherent, professional, and easy to understand.  
4. Internal strategy files remain private and are not linked anywhere publicly.

At that point, InSeed.com can be considered ready for use as a reference point in conversations with Transition Offices and other early clients, and InSeed-specific work can move into lighter, iterative maintenance until a v2 blueprint is agreed.

