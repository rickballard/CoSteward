# InSeed Site Triage Pass v1
_For Co1 / CoPrime20251118 – pre-pivot cleanup for InSeed.com_

## Purpose

Make the current InSeed.com site look coherent, finished-enough, and safe to show to senior visitors (including Pam and peers) **before** doing any deeper pivot or redesign. This pass should be fast and surgical: fix obvious rough edges, do not overthink structure.

This document assumes:
- The InSeed.com site is driven from the InSeed repo under rickballard.
- The business / content blueprint lives in `Co1_InSeed_BusinessPlan_SiteBlueprint_v1.md` and is internal-only.
- Co1 has PS7/CLI access to the repo.

---

## High-level goals

1. Remove all visible placeholder text (especially “Hero placeholder”) from public pages.
2. Make the Steward CEO / CEO Survival Guide path look deliberate and high-quality.
3. Ensure each top-level page has at least minimal, sane content.
4. Avoid exposing directory-like resource dumps or obviously empty templates.
5. Make **no** deep structural or branding changes in this pass.

After this triage, the site should feel like a lean, finished v0.9, ready for deeper evolution.

---

## Target pages (current structure)

This checklist is based on the observed current structure (URLs approximate):

- `/` – Home
- `/problems/`
- `/services/`
- `/resources/`
  - `/resources/insights/ceo-steward-exec-summary.html`
  - `/resources/insights/full-references.html`
- `/contact/`

If the actual paths differ, map these intentions to the nearest equivalents.

---

## Step 1 – Remove visible placeholders

**Task:** Search all rendered pages for the literal text `Hero placeholder`.

- Delete this text wherever it appears.
- If deletion leaves an awkward gap directly under an `h1` page title, replace with a one-line contextual intro instead, e.g.:
  - “Curated resources from InSeed on AI, governance, and transformation.”
  - “How InSeed works with partner-led firms.”

**Pages likely affected:**
- Services
- Resources
- Contact
- CEO exec summary
- Full references

Do **not** leave any visible “Hero placeholder” on the live site.

---

## Step 2 – Fix the Steward CEO exec summary page

URL (approx): `/resources/insights/ceo-steward-exec-summary.html`

This is currently the **public, web-based entry point** to the Steward CEO vs Legacy CEO thinking and the CEO Survival Guide whitepaper. Treat it as a flagship asset.

### Required actions

1. Keep the main title (“Legacy vs Steward  -  Exec Summary (Sample)” or equivalent).  
2. Remove any “Hero placeholder” line under the title.
3. Fix broken bullet lines in the “Steward” column. The intent is roughly:

   - *File-based prompts, flows, and evaluations stay portable so you can switch vendors without losing your work.*  
   - *Evidence becomes a shared scoreboard and guardrails: lead time, rework %, and decision quality.*  

   Adjust phrasing as needed for clarity, but keep those ideas.

4. Make the “Intent” text a clean, short paragraph, e.g.:

   > Intent: This page is a quick contrast for busy CEOs. The full CEO Survival Guide whitepaper is the canonical, downloadable reference.

5. Change the download link text to something clear, e.g.:

   - **“Download full CEO Survival Guide (PDF)”**

6. Scan the rest of the page for any obviously truncated phrases or template leftovers and tidy them.

Outcome: the page should read as a polished executive summary with a clear path to the full whitepaper.

---

## Step 3 – Tidy the Resources page

URL (approx): `/resources/`

Current problems:
- It behaves like a mixed directory listing plus a small intro.
- Multiple `index` entries and technical-looking names are visible.

### Required actions

1. Replace any “Hero placeholder” under `# Resources` with a one-line intro, e.g.:

   > Curated briefings and whitepapers from InSeed on AI, governance, and transformation.

2. Curate a **short list** of resources to display publicly, for example:

   - CEO Survival Guide – full whitepaper (PDF)  
   - Legacy vs Steward – Exec summary (web)  
   - CEO Survival Guide – transcript  
   - CEO Survival Guide – full references (living document)  

3. Hide or de-list any repeated `index` entries, or files whose names are not meaningful to an executive (e.g. raw `index` files, temporary versions). They may remain in the repo but should not be visible as individual resources.

Outcome: `/resources/` should feel like a small, deliberate “library”, not a raw file tree.

---

## Step 4 – Make Services look real, not skeletal

URL (approx): `/services/`

Current issue: it only shows a heading, a placeholder, and one CoFlow link.

### Required actions

Under `# Services`, add three short sections using existing concepts (CoAudit, CoFlow, CoMirror) as placeholders for the more refined offering stack:

- **CoAudit – Rapid AI & risk audit**  
  One or two sentences explaining this as a fast, structured look at AI/data risk and opportunities.

- **CoFlow – Weekly workflow upgrades**  
  One or two sentences explaining ongoing improvement of decision and workflow patterns.

- **CoMirror – Leadership day / reflection**  
  One or two sentences about a focused leadership session to reflect on AI, risk, and governance.

You can later map these to the refined offerings (Vendor-Neutral Guardrail, Partner Pitch Pack, Governance Blueprint), but for this triage pass, the goal is simply to avoid an obviously empty page.

Each section should end with a small CTA link pointing to Contact, e.g. “Talk to us about this”.

---

## Step 5 – Clean up Contact

URL (approx): `/contact/`

### Required actions

1. Replace any “Hero placeholder” with a short inviting line, e.g.:

   > If you are facing a significant AI or data decision – or want to get ahead of the next one – start a conversation with InSeed.

2. Keep existing contact details (email/phone/address) and the corridor image if present.

Outcome: Contact should feel human and intentional, not like a stub.

---

## Step 6 – Handle the Problems page

URL (approx): `/problems/`

Currently this page is extremely minimal and risks looking like a mistake.

Two options (pick one):

1. **Populate it with real content** (preferred if quick):  
   Add a short list such as:

   - Vendor-biased AI and data roadmaps  
   - Lock-in that only appears after the first renewal
   - Partners over-promising without clear guardrails
   - Transformation Offices asked to fix all of this without real authority

   This turns the page into a simple “what we see” lens.

2. **Hide the Problems nav item** for Phase 1:  
   Remove it from navigation and leave the page in place for now.

Choose whichever option is simpler given the current site generator and routing.

---

## Step 7 – Minimum viable Full References

URL (approx): `/resources/insights/full-references.html`

If this page currently shows section headings with no content and a “Hero placeholder”, it looks like an unfinished template.

### Required actions

1. Remove “Hero placeholder” text.  
2. Either:
   - Add at least 1–2 real references under each major heading (even if incomplete), **or**
   - Keep this page reachable only via direct link and do not surface it prominently in navigation until it has more content.

Outcome: the page should not look empty if a visitor lands on it from a link.

---

## Step 8 – Visual consistency for headers

Without changing the overall design system, ensure:

- All top-level page titles (`<h1>`) use the same container class.
- Titles and the first paragraph/introduction share consistent width and alignment (for example, `max-width` and `margin: 0 auto` at larger breakpoints).

Do **not** attempt a major visual redesign in this pass. Only normalise spacing and centring so pages feel like they belong to the same site.

---

## Step 9 – Final smoke test

After edits and a local or staging build:

1. Click through, in this order:
   - Home
   - CEO Survival Guide (from home)
   - Exec summary
   - Whitepaper download
   - Resources
   - Services
   - Problems
   - Contact

2. Confirm:
   - No page shows “Hero placeholder” or obviously template-like empty sections.
   - The path into the Steward CEO / CEO Survival Guide content feels deliberate.
   - Resources looks curated, not like a raw directory.
   - All nav links resolve without errors.

If all checks pass, merge the triage branch and deploy. The site is then ready for the deeper, blueprint-driven evolution.


