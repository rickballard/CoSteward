# Advisory: CoGibber.OnboardingAIs.v1 landed in BPOE

- Timestamp (UTC): 20251205T013540Z
- File: docs/bpoe/CoGibber_OnboardingAIs_v1.md
- Branch / lane: MW_CoCacheFlush_Discovery_v1
- PR: BPOE: CoGibber.OnboardingAIs v1 + cache flush discovery (PR #212)

Summary

- Defines v1 behaviour for any CoAware AI when CoAnchor plus CoGibber plus CoBox plus CoUnDo are present.
- Inherits CoFade and StyleDNA rules from CoBPOE_StyleAnd_CoFade_v1.
- Supports multi AI families and server only secrets by using advisories instead of direct pulls.

Intended consumers

- Co1, CoGuard, CoBus, and future orchestration lanes that need a canonical onboarding spec.
