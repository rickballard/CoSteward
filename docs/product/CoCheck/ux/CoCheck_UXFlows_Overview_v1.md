# CoCheck UX Flows – Overview v1

This document sketches the first pass UX for CoCheck as a downloadable reading
container that sits on top of existing media sources.

## 1. Core Concept

CoCheck adds a second view on any article:

- Original View - the source app or site as-is.
- CoCheck View - a cleaned, summarized, bias scanned and time estimated version.

The user can always toggle between these two views and see a clear indication
of which one they are currently using.

## 2. Primary User Journeys

### 2.1 Quick Scan of a Single Article (Substack example)

1. User opens a Substack article in their normal browser.
2. CoCheck is available as:
   - a browser extension button or
   - an "Open in CoCheck" share target or
   - a desktop helper that listens for "CoCheck this page".
3. User triggers CoCheck on the current page.
4. CoCheck extracts the article text and layout.
5. CoCheck shows a new window or side panel with:
   - Gist and time saved
   - Key claims and evidence snapshot
   - Bias and framing notes
   - Actionable takeaways
   - A clear toggle back to Original View.

The user can copy or share the CoCheck summary, or click "Open Original"
to jump back into the unmodified article.

### 2.2 CoCheck Container Mode

In this mode CoCheck itself hosts a reading environment.

1. User opens the CoCheck app.
2. CoCheck offers simple "Add source" flows:
   - Substack login and list of followed newsletters
   - RSS or Atom feed import
   - Plain URL paste
3. User clicks on an article in a feed list.
4. CoCheck opens two tabs or panes for that article:
   - Original View
   - CoCheck View
5. A clear toggle at the top lets the user switch between them.

Future iterations can add:
- keyboard shortcuts (for example, "O" for Original, "C" for CoCheck),
- a per-article time saved indicator on the feed list,
- and filters like "show me only articles where CoCheck time is under 3 minutes".

### 2.3 Sharing a CoCheck View

1. User processes an article in CoCheck.
2. CoCheck offers a "Share CoCheck View" button.
3. For MVP:
   - CoCheck generates a static HTML or markdown export that can be sent as a file or pasted.
4. Later:
   - CoCheck can publish the CoCheck View to a simple non commercial server,
     returning a shareable CoCheck URL.
5. The share view always includes:
   - a link back to the original article,
   - a short explanation of what CoCheck is,
   - and an invite link to download CoCheck.

### 2.4 CoCheck Club Touchpoint (Lightweight)

The CoCheck Club is not a heavy social network. For early versions it is a simple
"reaction and comment" layer.

1. On any CoCheck View, a signed in user can:
   - leave a short comment
   - leave simple reactions such as "Well sourced", "High spin", "Thought provoking".
2. The UI shows only a small number of comments by default.
3. Comments are anchored on the CoCheck View, not on the original article.
4. CoCheck aggregates these signals into outlet and author metrics (MeritRank, RepTag, etc).

## 3. Reading Modes in the UI

Reading modes are user visible options within the CoCheck View.

### 3.1 Mode Switcher

Provide a simple mode switcher, for example a row of buttons or a drop down:

- Quick and Concise (default)
- Verbose informative
- Verbose amusing
- Original voice
- Favorite writer mode

The default view on first use is Quick and Concise. CoCheck remembers the last
mode used for that user and article type if allowed to store settings.

### 3.2 Mode Behavior in the UI

- **Quick and Concise**
  - Show a single scroll length block.
  - Keep headings minimal.
  - Show time saved prominently at the top.

- **Verbose informative**
  - Split into clear sections with headings.
  - Expand explanations and context.
  - Show a short list of related topics or reading directions.

- **Verbose amusing**
  - Same sections as informative.
  - Allow light humor in the copy.
  - Show a small "Amusing mode" indicator so the user knows tone is relaxed.

- **Original voice**
  - Present a text that more closely mirrors the style and language of the author.
  - Highlight where CoCheck has trimmed or annotated the original.
  - Provide a toggle to show or hide CoCheck annotations.

- **Favorite writer mode**
  - Only enabled after the user has optionally configured a favorite style.
  - Clearly label the view as AI stylized content.
  - Do not attempt to visually impersonate an individual.

## 4. Trust and Transparency in the UX

CoCheck is a trust layer, so transparency is part of the UX.

Wherever possible:
- Show why a bias label or score was given, not only the score.
- Show examples from the article that triggered a bias note.
- Allow users to click "Why this?" to expand the reasoning behind a metric.

For early versions, metrics should be:
- simple and explainable,
- framed as "indicators" not "verdicts",
- versioned so changes in scoring rules are traceable.

## 5. Onboarding UX

First run:
- Brief one screen explanation:
  - what CoCheck does,
  - non commercial and anti capture stance,
  - how to toggle Original vs CoCheck View,
  - how privacy and local processing work.
- Offer two main buttons:
  - "Use alongside my existing browser"
  - "Use CoCheck as a reading container"

For onboarding to writer co evolution support, CoCheck can offer:
- "I write articles or newsletters"
- This leads to a short explanation and a "Launch Writer Co Evo Companion" button,
  which opens a separate AI session guided by the prompt pack.