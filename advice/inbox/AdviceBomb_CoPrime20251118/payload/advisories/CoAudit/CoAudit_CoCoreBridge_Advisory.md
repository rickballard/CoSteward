# CoAudit → CoCore Bridge  -  Advisory for Co1 / CoPrime20251118

## 1. Purpose

The **CoAudit → CoCore Bridge** is a read-only translator that turns CoAudit findings into **structured proposals** for:

- **CoCore**  -  the database of best practices and reusable patterns.
- **CoTheory**  -  theory-of-everything style structures tying practices to outcomes and concepts.
- **Megascroller-like renderers**  -  long-form, assembled insight experiences.

The bridge itself must not write into other repos. It only produces artifacts that humans or separate tools can use to create PRs and update systems.

---

## 2. Inputs

The bridge consumes outputs from CoAudit, especially:

- `_coaudit/meta/report.json`
  - Unified findings across rulepacks and scopes.

Optionally, it may also look at:

- `_coaudit/outreach/report.json`
  - Outreach-specific details if separate sweeps are run.

- `_coaudit/outreach/judge_llm_raw.json`
  - LLM-derived advice (scores, suggestions) used only for additional context.

The key requirement is that the bridge always treats these as **read-only inputs**.

---

## 3. Outputs

The bridge produces several types of artifacts to drive learning and documentation.

### 3.1 Best-Practice Proposals

- `bridge/proposals.json`
  - A normalized list of **Best-Practice Proposals** (BPPs).
  - Each proposal includes:
    - `id`
    - `domain` (e.g., “Civic Outreach”, “Editorial Hygiene”, “Brand Governance”)
    - `practice` (e.g., “Calls to Action”, “Clear Language”, “Accessible Communications”)
    - `pattern` and/or `antipattern` description
    - `source_repo`
    - `source_path`
    - `finding_code`
    - `severity`
    - `rationale`
    - `suggested_steps[]`
    - `tags[]`
    - `metrics` (e.g., count of occurrences)

- `bridge/proposals.md`
  - A human-readable summary (often a table) listing the proposals for quick scanning.

### 3.2 Best-Practice Cards

- `bridge/cards/*.md`
  - One markdown card per proposal (or per consolidated cluster of proposals).
  - Structure example:

    ```markdown
    # Best Practice: Clear Language in Civic Outreach

    **Domain:** Civic Outreach  
    **Practice:** Clear Language  
    **Type:** AntiPattern (as discovered)  

    **Observed Issue**  
    Excess jargon makes it harder for residents to understand what is being offered.

    **Why it matters**  
    Plain language reduces cognitive load, increases trust, and improves completion rates.

    **Suggested Steps**  
    - Replace buzzwords with concrete, specific phrases.
    - Provide examples and numbers where possible.
    ```

  - These cards are intended to be moved (manually or via external tooling) into CoCore or related knowledge repos.

### 3.3 Theory Linkages

- `bridge/theory_links.json`
  - Suggested nodes and edges describing how practices relate to outcomes and concepts.
  - Example:

    ```json
    {
      "id": "link-clear-language-participation",
      "nodes": [
        { "id": "n-clear-language", "type": "practice", "label": "Clear Language" },
        { "id": "n-higher-participation", "type": "outcome", "label": "Higher Participation" }
      ],
      "edges": [
        { "from": "n-clear-language", "to": "n-higher-participation", "relation": "supports" }
      ],
      "rationale": "Plain language reduces confusion and encourages more residents to engage."
    }
    ```

  - CoTheory or related systems can ingest this to grow the theory graph.

### 3.4 Megascroller Manifest

- `bridge/megascroller.manifest.json`
  - A manifest describing how to assemble a long-form experience out of proposals and cards.
  - Example sections:
    - An intro section referencing `proposals.md`.
    - A card grid referencing `bridge/cards/`.
    - Optional callouts or quotes.

This allows a Megascroller-like renderer to present the “state of CoAudit learnings” as a narrative.

---

## 4. Mapping from Findings to Proposals

The bridge maintains mapping logic that interprets CoAudit finding codes into higher-level concepts.

Example mappings:

- `OUTREACH/CTA/MISSING`
  - Domain: Civic Outreach
  - Practice: Calls to Action
  - Antipattern: Missing primary CTA
  - Tags: `["outreach", "cta", "usability"]`

- `OUTREACH/ACCESSIBILITY/ALT`
  - Domain: Civic Outreach
  - Practice: Accessible Communications
  - Pattern: Provide alt text for images
  - Tags: `["a11y", "compliance"]`

- `OUTREACH/JARGON/EXCESS`
  - Domain: Civic Outreach
  - Practice: Clear Language
  - Antipattern: Excess jargon
  - Tags: `["plain-language", "style"]`

- `INCOMPLETE/PLACEHOLDER/LOREM`
  - Domain: Editorial Hygiene
  - Practice: Publishing Readiness
  - Antipattern: Placeholder text in live content
  - Tags: `["quality", "reputation"]`

- `BRAND/LOGO/UNAPPROVED`
  - Domain: Brand Governance
  - Practice: Approved Asset Use
  - Antipattern: Unapproved logo or asset usage
  - Tags: `["brand", "asset"]`

Co1 should keep this mapping table:

- Version-controlled,
- Easy to extend,
- Reviewed periodically along with rulepack changes.

---

## 5. Co1’s Role in the Flow

When Co1 orchestrates this flow with CLI + repos:

1. Run **MetaSweep** on a target repo to produce `_coaudit/meta/report.json`.
2. Run the **Bridge** script to produce `bridge/proposals.*`, `bridge/cards/*`, `bridge/theory_links.json`, and `bridge/megascroller.manifest.json`.
3. Review `bridge/proposals.md`:
   - Decide which proposals are worth accepting.
   - Mark which ones need refinement.
4. Use separate scripts or manual steps to:
   - Copy accepted cards into CoCore (or a staging area).
   - Wire accepted cards into CoTheory structures.
   - Open PRs against CoCore and/or theory repos.

Throughout, CoAudit and the Bridge remain **read-only**. Any writes are explicit, visible actions controlled by Co1 or human operators.

---

## 6. Relationship to Other Advisories

- `CoAudit_MetaSweep_Advisory.md`
  - Explains how the unified report works and why it is the primary driver of bridge inputs.

- `CoAudit_BrandKit_Advisory.md`
  - Helps people visually understand which repos are under CoAudit and how serious current issues are.

- `CoAudit_SessionPlan_Detailed.md`
  - Lays out the step-by-step implementation plan, including when to introduce the bridge.

Co1 can treat this document as the conceptual spec for the CoAudit → CoCore Bridge and refine it as real-world usage reveals new needs.

