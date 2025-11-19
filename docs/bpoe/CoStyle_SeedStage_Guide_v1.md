# CoStyle seed stage guide

This is a working style guide for human facing CoSuite assets during the seed stage.  
It focuses on reducing obvious AI fingerprints and keeping the voice close to how real people speak.

## Punctuation

- Do not use Unicode em dashes in human facing assets unless you are quoting existing text.
- Prefer short clauses with commas or full stops, or break the sentence in two.
- If you need contrast, consider a colon, or "but" or "and" in plain language.
- Avoid long punctuation trains such as "??" or "!!" unless you truly mean them.

## Tone and stock phrases

Avoid classic AI boilerplate such as:

- "In this section, we will..."
- "This document provides an overview..."
- "We will explore..."
- "In conclusion..."
- "Overall..."
- "cutting edge", "seamless experience", "powerful tool", "leverage" as verbs.

Preferred patterns:

- Start with the concrete thing you want to say, then give one short reason.
- Use plain verbs: "show", "test", "check", "ship", "fix".
- When summarising, use "In short" or "Here is the gist" instead of formal wrap ups.

## Layout

- Check Markdown files for balanced code fences, especially ` ```mermaid` blocks.
- Keep README files readable in the GitHub preview, not just raw.
- When in doubt, run the CoSteward style sweeps:
  - `MW_StyleSweep_EmDash_AllRepos_v2`
  - `MW_StyleSweep_EmDash_Followup_v1`
  - `MW_StyleSweep_AIStyleLint_v2`
  - `MW_StyleSweep_CodeFence_Parity_v1`

This document is a seed. Future CoStewards can evolve it, but changes should pass a quick human read test first.
