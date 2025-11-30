# CoSuite Product Safety and Guardrails - Wave 3

Draft v1 - shared guardrails spine for CoSuite products.

## 1. Guardrail layers

Every product should consider at least four layers:

1) Input guardrails
- What prompts, files, and data can enter.
- Filters for obviously harmful or out-of-scope content.
- PII, doxxing, and harassment checks when relevant.

2) Orchestration guardrails
- Which tools and CoModules may be chained.
- Allowed vs forbidden tools in a given context.
- Rate limits and quotas per user, tenant, or community.

3) Output guardrails
- Post-processing passes to catch disallowed outputs.
- Optional second AI pass for safety and tone.
- Clear explanations when content is blocked, edited, or delayed.

4) Feedback and learning guardrails
- Logging of key events with minimal necessary data.
- Buttons and flows for humans to flag bad outputs.
- Defined rules for how logs are used to improve models and prompts.

## 2. Safety posture presets

Define deployment-level presets:

- S0 Experimental
  - Internal only, warnings everywhere, unstable, no civic use.
- S1 Cautious
  - Small pilot groups, conservative filters, heavy human oversight.
- S2 Civic
  - Default for civic-ready deployments, balanced strictness and usefulness.
- S3 High-risk
  - For use in critical or high-harm scenarios, strictest rails.

Each preset should map to:

- Which tools are enabled.
- Thresholds for classifiers and filters.
- Logging and retention expectations.
- Required human oversight level.

## 3. Governance and accountability

For each deployment:

- Name a Steward of Record.
- Maintain a Rails Manifest that includes:
  - Products and modules in use.
  - P/T/A/G level.
  - Safety posture S0-S3.
  - Known exceptions and why they exist.

The Rails Manifest should be both:

- Machine-readable for CoAudit and CoCheck.
- Human-readable for partners, auditors, and citizens.

## 4. Civic partner interface

Civic partners should receive:

- A short rails overview note for the specific deployment.
- A list of known limitations and "hard no" zones.
- Ways to:
  - Ask for stricter or softer rails inside allowed bounds.
  - Request temporary overrides with explicit sign-off.

Over time these notes should become standard contract annexes and public-facing pages.

## 5. Incidents and learning loops

Define:

- What counts as an incident.
- How incidents are logged and escalated.
- How changes to rails are decided after an incident.

Incidents should feed back into:

- Rails configs for that deployment.
- Product roadmaps.
- CoSuite-wide patterns so one product's lessons strengthen all others.

## 6. Integration hooks

Guardrails should be:

- Configurable in code (YAML, JSON, or similar).
- Visible in CoIndex and GIBindex as explicit concepts and patterns.
- Testable in CI:
  - Include known-bad prompts that must be blocked, reshaped, or escalated.
  - Run safety "drills" to verify behaviour stays within rails.

This doc is the spine; each product will add its own overlays on top.
