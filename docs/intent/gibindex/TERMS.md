# GIBindex — Terms & Cadences (v1)

> This page defines the minimal, enforceable vocabulary CoSuite uses for intent, evolution, and session hygiene.

## Evo Loop  {#evo-loop}
A repeatable **human+AI improvement cadence** for CoSuite assets. Each loop:
1) frames intent,
2) records observations,
3) proposes tiny hypotheses,
4) ships them as one or two PRs,
5) verifies via guard/CI and human skim,
6) leaves a CoSync/CoEvo note (trail + pointers),
7) selects the next hypothesis.

Scripts are helpers. **The loop is the thinking + proof of improvement.**

## Cycle / Set  {#cycle}
A **run-unit** inside an Evo Loop. A cycle **must** include:
- A **short intro** stating scope and expected receipts.
- One or more **serialized** execution blocks:
  - **DO Blocks** (CLI/PS7) and/or **Manual UI Lists** (click-path), each **numbered/lettered/versioned** so they cannot be mixed up.
- A single **TEACHING** section at the end, clearly delineated, never executable.

## DO Block  {#do-block}
A paste-safe, deterministic instruction block intended for PS7/CLI. Must:
- Set strict modes (`$ErrorActionPreference='Stop'`), be idempotent where possible,
- Write receipts (violet line and/or CoSync entry),
- Avoid side effects beyond stated scope.

## Manual UI Instruction List  {#manual-ui}
A numbered click-path. No hidden steps; includes screen landmarks or URLs. Ends with a receipt hint (what proof to produce).

## TEACHING Section  {#teaching}
A non-executable **explanation** following the cycle’s DO/Manual lists. It clarifies why/when to use the pattern, pitfalls, and evolution hooks.
> Must never be mistaken for a DO Block. Keep the “TEACHING” header exact.

## Megachecklist policy  {#megachecklist}
- The megascrolled intent checklist shows:
  - The **last few months of completed** items (for momentum/traceability), and
  - **All future intent** items (distant/low-priority can be terse labels).
- Ambiguous labels are acceptable for humans if they are **AI-parsable**; AIs are expected to expand labels on request.
