# CoModules Seed List – W2 Overlay (M11–M15)

Session: Products20251128
Owner: Products20251128 (not CoPrime)

This overlay extends `CoModules_SeedList_v1.md` with M11–M15.
It does not replace W1; it layers new modules on top.

---

## M11 – Sessions and identity

- Code: M11_Sessions
- Purpose:
  Track lightweight, privacy-respecting session identity and context.
- Used by:
  All products that want:
  - session continuity,
  - better civar estimation,
  - or MeritRank-friendly contribution logs.
- Repos:
  - CoAgent (session labels, PS7 helpers),
  - CoSteward (session patterns and CoStatus),
  - CoIndex (mapping sessions to concepts, not people).
- Notes:
  - Focus on “who is the steward right now” and “what is this session label”.
  - Avoid storing personal data beyond what is needed for stewardship and respect.
  - Play nicely with civars (M03_Civar) and CoStatus pulses.

---

## M12 – Telemetry and health

- Code: M12_Telemetry
- Purpose:
  Provide a simple, shared way to emit health metrics per product.
- Used by:
  CoArena, CoAgent CLI, RepoZipper, CoCheck, CoPlan, CoAudit and others.
- Repos:
  - CoSteward (telemetry patterns),
  - CoCache (logs and rollups),
  - product repos (local emitters).
- Notes:
  - Start with a minimal set:
    - total calls / matches,
    - success vs error counts,
    - basic latency buckets,
    - coarse civar buckets.
  - Prefer JSONL that can be tailed by CoCache tools.
  - Be careful not to create a mass-surveillance anti-pattern; telemetry is for stewardship and reliability, not spying.

---

## M13 – Experiment flags

- Code: M13_Experiments
- Purpose:
  Allow controlled, documented experiments (feature flags, A/B tests) across products.
- Used by:
  Any product that wants to try new flows, prompts or UI without breaking everyone.
- Repos:
  - CoSteward (experiment patterns and ethics),
  - CoAgent / CoArena (runtime flags),
  - CoCache (experiment logs).
- Notes:
  - Keep the mechanics simple:
    - a small experiment registry,
    - clear on/off flags,
    - log decisions via PTAG facets (M04_PTAGLog).
  - CoAudit should be able to review experiments later.
  - Tie to guardrails (M10_Guards) so risky experiments are harder to run.

---

## M14 – Content packs and bundles

- Code: M14_ContentPacks
- Purpose:
  Standardise how products package outputs: zips, AdviceBombs, logs and artifacts.
- Used by:
  CoAgent, CoArena, RepoZipper, CoTheories, CoIndex and others.
- Repos:
  - CoCache (bundle layout and tooling),
  - CoSteward (bundle patterns),
  - product repos (bundle emitters).
- Notes:
  - Lean on existing patterns:
    - MW zips,
    - AdviceBomb layouts,
    - .sha256 receipts.
  - Make it easy to:
    - create bundles from PS7,
    - unpack and register them for later sessions,
    - keep a clear CoBloat heartbeat (CU/PU/HU/WT) inside bundles when helpful.

---

## M15 – Pricing and value signals

- Code: M15_ValueSignals
- Purpose:
  Extend civars with optional “value-ish” signals without becoming a currency.
- Used by:
  Products that might later link to real-world pricing or sponsorship.
- Repos:
  - CoSteward (ethics and patterns),
  - CoCore (best practices),
  - CoAudit (guardrails).
- Notes:
  - Conceptually:
    - civars remain the primary pseudo-value for effort and insight,
    - value signals layer on top as annotations.
  - Examples:
    - tags like `value.band: low|medium|high`,
    - flags indicating whether an output is “sponsorable” or “public-good only”.
  - All pricing-related logic must respect M10_Guards and local law.

---

## Usage

- When extending `CoModules_SeedList_v1.md`, copy these entries into the main list as M11–M15.
- When updating `Products_Ramp_Pattern_v1.md`, reference these new modules where relevant.
- Future waves can introduce M16+; keep this overlay tail as a record of how W2 expanded the rails.

