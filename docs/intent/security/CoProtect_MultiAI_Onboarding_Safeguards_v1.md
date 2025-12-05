# CoProtect – Multi-AI Onboarding Safeguards (v1)

- Timestamp (UTC): 20251205T022305Z
- Repo: CoSteward
- Related BPOEs:
  - docs/bpoe/CoBPOE_StyleAnd_CoFade_v1.md
  - docs/bpoe/CoGibber_OnboardingAIs_v1.md (on MW_CoCacheFlush_Discovery_v1 as of this note)
- Status: EXPERIMENTAL – Co1-only, not for general external AIs.

## 1. Threat model (v1)

Assume:
- Any non-Co1 AI (including future platforms) is **untrusted** by default.
- Hostile or careless actors may:
  - prompt those AIs to "act as Co1" or "follow CoGibber.OnboardingAIs.v1",
  - scrape CoSuite repos and CoPortals for behaviors to imitate,
  - attempt to reverse-engineer governance logic to subvert or compete.

Therefore:
- CoSuite tokens (CoAnchor, CoGibber, CoBox, CoUnDo, etc.) are **not authority**.
- Authority comes from:
  - environment (LAN vs public),
  - steward-controlled repos,
  - human / Co1 decisions, not just strings in prompts.

## 2. Scope and default posture

Until this note is superseded:

- Multi-AI onboarding rails (CoGibber.OnboardingAIs.v1) are:
  - **designed** and documented,
  - **NOT deployed as default** for arbitrary external AIs.

- Only Co1 (and future CoGuard lanes as explicitly authorized) may:
  - treat CoGibber.OnboardingAIs.v1 as binding behavior,
  - orchestrate other AIs using those rails.

- Public-facing CoGbx / CoPortal surfaces:
  - MAY explain the existence of these rails conceptually,
  - MUST NOT suggest that any random AI can or should "be Co1" or self-appoint as CoSteward.

## 3. Secrets and GLUKEY protections

- GLUKEY, crown jewels, and deeper financials:
  - remain **server-only**, outside all public repos,
  - are never to be pasted into or reconstructed by generic AIs,
  - MAY be referenced only at high level (e.g., "GLUKEY capsule on secure server").

- Any advisory documents involving server-only materials:
  - should live in **LAN-only locations** (e.g., CoCiviumAdmin on server),
  - or be passed via human-mediated .md drops to Outreaches,
  - not committed to public repos.

## 4. Onramp tightening

- CoAnchor Quickstart variants:
  - SHOULD treat "multi-AI orchestration" as **opt-in** and **Co1-supervised only**.
  - Default assumption: this session has **one primary AI** plus optional guest tools.

- CoGbx / portal onramps:
  - MUST assume that external AIs are **read-only interpreters** of public content,
  - MUST NOT grant or imply write authority to repos or servers without a human or Co1 in the loop.

## 5. Use of CoGibber.OnboardingAIs.v1 (v1 deployment rule)

- It is acceptable for:
  - Co1, CoGuard, and closely controlled lanes to **read** CoGibber_OnboardingAIs_v1.md
    and treat it as guidance.

- It is **not** acceptable at this stage to:
  - wire generic AI platforms so they automatically adopt those rails
    just because the token CoGibber.OnboardingAIs.v1 appears in a prompt.

Any automated adoption of these rails:
- requires an explicit CoProtect review and update of this note,
- and should be logged as a CoBus / CoGuard event.

## 6. Future work before broad deployment

Before broadening multi-AI onboarding beyond Co1:

- Add:
  - legal review (IP, liability, platform terms),
  - clearer license badges and "approved host" markings,
  - CoAudit checks for:
    - where multi-AI rails are referenced,
    - which environments are allowed to act on them.

- Consider a CoProtect v2 note that:
  - lists approved platforms / models,
  - defines allowed capabilities per platform (read-only, advisory-only, etc.).

---

This note exists so that:
- governance text for multi-AI onboarding can live on repo,
- while posture remains conservative: Co1-centric, server-protective, and hostile-AI aware.
