# CoInsight - Prompt-Widening Language For CoStewards (v1)

Generated: 20251207T172710Z

## Intent

Explain why certain words and patterns (for example \inferred\, \tc\,
\nd so on\, \/b/c/d/etc\) help AIs reason more broadly and align
with the human's wider concept cloud, not just literal text.

This is not about being vague; it is about signalling that there is more
in the human's mind than fits into a short prompt.

## Example widening patterns

Examples of patterns that widen the requested scope:

- \"inferred\", \"implied\", \"reading between the lines\".
- \"etc\", \"and so on\", \"and so forth\".
- Slash lists: \"a/b/c/d/etc\" instead of only \"a\" or \"a/b\".
- Words like \"broader\", \"deeper\", \"widely\", \"holistically\".

Used carefully, these tell the AI:

- \"Do not stop at the literal list; treat this as a sample of a wider family.\"
- \"Look for patterns and clusters, not just items 1, 2, and 3.\"
- \"Pull in adjacent concepts from your training that match the implied shape.\"

## Why this matters for CoCivium

Human minds often:

- Carry a large, fuzzy cloud of related ideas and experiences.
- Only express a tiny slice of that cloud in any given sentence.
- Expect collaborators (human or AI) to extrapolate from tone, context, and
  small hints like \"etc\" or \"and so on\".

AIs, by default, tend to:

- Treat text literally unless asked to generalise.
- Miss the rest of the idea cloud when only a small list is provided.

Prompt-widening language helps bridge this gap.

## Steward guidance (seed)

CoStewards MAY:

- Use widening words when they want the AI to explore adjacent possibilities.
- Combine specific examples with \"etc\" to invite pattern-finding.
- Explicitly say: \"interpret this list as examples, not hard boundaries\".

CoStewards SHOULD:

- Avoid relying only on widening words when precise constraints are critical
  (eg. legal clauses, security rules).
- Use widening language in mythos, strategy, and brainstorming contexts where
  exploration is valued.

Future work:

- Add prompt templates and CoAnchor snippets that demonstrate this style.
- Train new CoStewards to mix widening and narrowing language deliberately,
  depending on context.
