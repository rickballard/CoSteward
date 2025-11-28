# CoCheck Architecture and MVP Plan – v1

This document outlines how to implement CoCheck as a downloadable,
non commercial product that can sit alongside tools like RepoZipper.

## 1. High Level Architecture

CoCheck consists of the following layers:

1. **Input layer**
   - Accepts:
     - raw URL
     - pasted article text
     - embedded browser view of logged in media sources
     - optional RSS or feed inputs.
   - Responsible for:
     - fetching page HTML (when allowed),
     - extracting main article text and metadata,
     - handing content to the analysis engine.

2. **Analysis engine**
   - Core components:
     - clutter and boilerplate stripping
     - claim extraction
     - lightweight claim and evidence grading
     - bias and framing scan
     - summary generation
     - time and attention estimation.
   - Implementation:
     - minimal local logic for structure and metrics,
     - calls out to an AI model for linguistic and semantic tasks,
       with model choice configurable.

3. **Scoring and metrics layer**
   - Maintains per source and per author metrics:
     - MeritRank
     - RepTag
     - bias balance
     - commercial pressure index
     - evidence vs storytelling ratio.
   - Uses anonymous or pseudonymous user interactions where possible.
   - Exposes metrics as simple data structures that can later be surfaced
     through APIs.

4. **Rendering layer (CoCheck View)**
   - Converts analysis outputs into a clean human facing UI for the
     various modes (Quick and Concise, Verbose, Original voice, etc.).
   - Also responsible for export formats:
     - markdown
     - simple HTML
     - static share pages.

5. **Container and integration layer**
   - Desktop app or helper process that:
     - runs the analysis engine,
     - provides the CoCheck window,
     - offers "Open in CoCheck" or "CoCheck this page" hooks to the OS
       and browsers.
   - May later be paired with a browser extension for ease of use.

## 2. MVP Implementation Phases

### Phase 1 – Local helper plus manual copy paste

- Small cross platform app or script that:
  - accepts pasted article text
  - runs CoCheck analysis
  - displays a CoCheck View in a window or in the console.
- Uses a single AI provider at first.
- No persistence of metrics except in simple local files.

Goal: prove the UX and analysis model without heavy integration.

### Phase 2 – Desktop container with dual view

- Build a desktop app using a cross platform framework such as:
  - Tauri, Electron or a WebView based shell.
- Features:
  - embedded browser view for Original View
  - CoCheck View panel for the same article
  - simple navigation and back stack.
- Basic local profile and preferences storage.

Goal: make CoCheck usable as a daily reading container.

### Phase 3 – Lightweight integration with browsers

- Provide:
  - a browser extension for one major browser or
  - a protocol handler / share target that lets the user send pages to CoCheck.
- Minimal data flow:
  - browser sends the URL
  - CoCheck fetches and analyzes the article.
- Maintain the rule that CoCheck behaves like a normal user from
  the perspective of media sources.

Goal: let users keep their existing reading habits and layer CoCheck on top.

### Phase 4 – Metrics and sharing

- Add basic metrics storage and retrieval:
  - local cache for MeritRank and RepTag
  - heuristics for updating scores as more CoCheck Views are created.
- Add simple static export of CoCheck Views:
  - HTML exports that can be attached to emails or saved.
- Optional: a non commercial CoCheck gateway server that can:
  - accept a CoCheck export
  - host it as a read only share page
  - provide a stable URL.

Goal: make CoCheck Views shareable and gradually useful for groups and clubs.

## 3. Non Functional Considerations

- **Anti capture stance**
  - Core CoCheck code and scoring rules should be open or source available.
  - No paid score boosts or advertising integrations.
  - Governance and change logs for metrics should be documented.

- **Privacy**
  - Prefer local processing where possible.
  - Clarify which parts use remote AI calls and why.
  - Minimize data stored about user behavior.

- **Resilience**
  - If external AI providers change terms or models, CoCheck should be able
    to switch providers without breaking the user experience.
  - A local only mode should still provide some benefit even if the
    external AI is unavailable.

## 4. Repo Level Plan

For the CoSteward and CoSuite repos:

- Keep CoCheck concept and product docs under CoSteward/docs/product/CoCheck.
- Implementation specific repos can be created later, for example:
  - CoCheckApp (desktop container)
  - CoCheckEngine (analysis engine)
  - CoCheckClub (optional shared layer).

CoCheck should be treated as a long lived civic utility that co evolves
alongside CoCivium and other trust and governance tools.