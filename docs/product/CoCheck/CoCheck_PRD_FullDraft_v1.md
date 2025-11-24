# CoCheck – Product Requirements Document (Full Draft v1)

## 1. Overview

**CoCheck** is a user-owned, non-commercial reading container and trust layer
that sits on top of existing media experiences (Substack, blogs, news sites, etc.).

CoCheck behaves like an ordinary reader to upstream platforms, but gives the
human a second, "CoCheck View" of any article that:

- strips clutter and self-promo,
- summarizes the core claims and takeaways,
- surfaces commercial / political / worldview bias patterns,
- estimates time and attention saved,
- and aggregates rolling merit/rep metrics for outlets and authors
  (e.g., MeritRank, RepTag, commercial pressure, evidence/storytelling mix).

CoCheck is governed as a **civic utility**, not a commercial product.
It is designed to be non-capturable, transparent in method, and aligned with
global digital rights and media-literacy best practices.

---

## 2. Goals

### 2.1 Reader-Level Goals

- Reduce cognitive overload and time-waste when consuming long-form media.
- Make it easy to see:
  - what the article is actually claiming,
  - how well those claims are supported,
  - how the piece may be trying to shape emotions or identity.
- Provide several reading modes so people can choose between:
  - maximum efficiency,
  - deeper context,
  - entertainment/voice,
  - or "favorite writer" stylization.

### 2.2 Societal Goals

- Provide a **trust layer** across media sources that does not belong to them.
- Help shift incentives toward honest, evidence-based journalism by making
  merit and bias patterns visible.
- Empower citizens and heavy readers to interrogate media more easily.
- Offer a path for writers and journalists to **co-evolve with AI** rather
  than be displaced by it, via prompt-based co-evolution coaching.

---

## 3. Core User Personas

1. **Time-Poor Reader**
   - Wants: "TL;DR plus bias check in under 2 minutes."
   - Success: keeps up with topics of interest without burnout.

2. **Media-Literate Skeptic**
   - Wants: to check claims, understand framing, and compare outlets.
   - Success: has a trustworthy meta-layer across all sources.

3. **Heavy Research User**
   - Wants: structured outputs, exportable metrics, repeatable scoring.
   - Success: can assess many outlets/authors quickly.

4. **Writer / Journalist / Creator**
   - Feels threatened or overwhelmed by AI.
   - Wants: to maintain their voice and creative joy while using AI to
     increase quality and speed.
   - Success: feels like a co-evolution partner with AI, not a commodity.

5. **CoCivium Steward / Ally**
   - Wants: CoCheck to remain non-commercial and civically aligned.
   - Success: sees methods, scores, and governance remain open and anti-capture.

---

## 4. Feature Set

### 4.1 Reading Modes

All modes share the same underlying analysis (claims, bias, etc.), but differ
in how the results are presented.

#### 4.1.1 Quick & Concise (Default)

- One screen of bullets:
  - main thesis,
  - key claims,
  - strongest evidence cited,
  - obvious bias/commercial framing.
- Time/attention saved estimate.
- Ideal for "get the gist and move on."

#### 4.1.2 Verbose & Exploratory

- Adds:
  - richer context,
  - examples,
  - optional links to related articles/topics (when available).
- Several sub-styles:
  - "Informative": neutral tone, explanation-first.
  - "Amusing": light humor and narrative, while preserving accuracy.
- For readers with time and curiosity.

#### 4.1.3 Original Voice Mode

- Prioritizes preserving the original author's style:
  - rhythm, tone, rhetorical quirks, as far as is feasible.
- Still:
  - cleans obvious repetition,
  - flags claims and bias,
  - suggests clarifications.
- Goal: reduce friction without severing the audience's connection to the author.

#### 4.1.4 Favorite Writer Emulation

- User selects a preferred writer/voice (e.g., "in the style of X").
- CoCheck outputs a summary / retelling in that style, while:
  - clearly labelling it as AI-generated emulation,
  - preserving factual and bias analysis structure.
- This must respect ethical bounds:
  - avoid impersonation that could mislead about authorship,
  - avoid deepfake-level mimicry of real living individuals without consent.

### 4.2 Analysis Components (Shared Across Modes)

- **Core Claim Extraction**
  - Identify 3–10 central factual or causal claims.
  - Label each with a short, human-readable tag.

- **Claim Check**
  - For each claim:
    - Status: Well supported / Mixed / Disputed / Not checkable.
    - Short explanation of status.
    - Types of sources that would back or dispute it (generic, not link spam).

- **Bias & Framing Scan**
  - Commercial: product funnels, sponsor pressure, self-promotion intensity.
  - Political: axes such as economic L/R, cultural L/R, populist/institutional.
  - Theological/worldview: explicit religion, or secular "faiths"
    (market fundamentalism, techno-utopianism, doomism, etc.).
  - Concrete examples from the text (phrases, metaphors, omissions).

- **Time & Attention Estimate**
  - Approximate original reading time (words / 225 wpm).
  - Approximate CoCheck reading time for each mode.
  - % of removed low-value or repetitive content.

- **Actionable Takeaways**
  - 3–7 bullets: "If you accepted this article's best arguments, what would you do or think differently?"

- **Steelman & Counterpoint**
  - Steelman: best, fair version of author’s argument.
  - Counterpoint: best, fair critique a smart opponent might make.

### 4.3 Modes & Containerization

- **Online/Native Mode**
  - Browser extension / share target / companion app.
  - User browses in original app/site.
  - CoCheck offers "CoCheck this" on article pages.
  - Opens "CoCheck View" with:
    - summary,
    - analysis,
    - source metrics,
    - "View Original" and "Share CoCheck View" links.

- **CoCheck Container Mode**
  - Optional: user logs into their media accounts in CoCheck.
  - Embedded browser/webview for reading feeds/articles.
  - Dual tabs per article:
    - Original View,
    - CoCheck View.
  - Explicit toggles and cross-links.

### 4.4 Viral Distribution & CoCheck Club

- **Shareable CoCheck URLs**
  - Every processed article can be shared as a CoCheck link.
  - Landing page shows summary, analysis, source metrics, and
    "View Original Article" + "Get CoCheck".

- **Lightweight CoCheck Club**
  - Optional handles.
  - Short comments and reactions on the CoCheck View (inside the app).
  - Focus on:
    - claim evaluation,
    - bias notes,
    - praising good journalism.
  - No heavy social network features.

### 4.5 Source Metrics: MeritRank, RepTag, etc.

- **MeritRank (0–100)** – craft:
  - sourcing quality,
  - evidence use,
  - visibility of corrections.

- **RepTag (0–100)** – perceived honesty/fairness:
  - aggregate reader assessments over time.

- **Bias Balance**
  - Shows tilt across defined axes.

- **Commercial Pressure Index**
  - Measures intensity of selling/promo.

- **Evidence vs Storytelling Ratio**
  - Indicates whether the outlet leans more on data or narrative.

- Aggregation principles:
  - moving averages with time decay,
  - per-user influence caps,
  - stats about rater diversity (where self-identified),
  - and fully documented formulas.

---

## 5. Non-Functional Requirements

- **Non-Commercial Core**
  - No ads, no sale of user data to scored outlets,
  - no pay-to-improve scores,
  - no paywalls on core trust features.

- **Privacy & Security**
  - Prefer on-device or privacy-respecting processing.
  - Minimal logging, clear privacy policy.

- **Openness & Anti-Capture**
  - Open-source or source-available where feasible.
  - Public, versioned methodology for scoring and analysis.
  - Exportable aggregate scores and metrics.

- **UX Principles**
  - Always show path back to original content.
  - No dark patterns.
  - Use plain language for trust-critical concepts.

---

## 6. Writer Co-Evolution Support (High-Level)

CoCheck will ship with a **Writer Co-Evo Prompt Pack**, not a static course.

- Writers copy/paste prompts into their AI tool.
- The AI becomes a personalized coach that:
  - maps their fears, goals, and style,
  - helps them integrate AI into their workflow,
  - preserves and enhances their unique voice,
  - and co-designs a personal evolution roadmap.

This is delivered as markdown prompt templates and guidance, not as a fixed curriculum.

---

## 7. Open Questions / Future Waves

- Exact scoring formulas and axes for MeritRank/RepTag.
- Detailed UX flows and wireframes.
- Governance structure for CoCivium foundation / non-profit.
- APIs for third parties to consume CoCheck metrics.

These should be addressed in later waves and versioned as separate docs.