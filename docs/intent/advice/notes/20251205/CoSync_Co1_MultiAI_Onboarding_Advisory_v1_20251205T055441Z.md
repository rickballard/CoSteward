# CoSync – Co1 multi-AI onboarding advisory (v1)

- Timestamp (UTC): 20251205T055441Z
- Repo: CoSteward
- Branch: MW_CoCacheFlush_Discovery_v1
- Related PR: #212 – BPOE: CoGibber.OnboardingAIs v1 + cache flush discovery
- Related guard note: docs/intent/security/CoProtect_MultiAI_Onboarding_Safeguards_v1.md

What happened

- A standalone advisory file \Co1_MultiAI_Onboarding_Advisory_v1.md\ was generated off-repo.
- That file has been manually dropped into the Co1 session as continuity.
- Advisory tells Co1 to:
  - treat CoGibber.OnboardingAIs.v1 as *design visible but conservative*,
  - keep multi-AI onboarding Co1-only and EXPERIMENTAL until CoProtect v2 and legal/IP rails are in place,
  - avoid auto-granting authority to any external AI just because CoSuite tokens appear in prompts.

Posture summary

- Design: multi-AI onboarding rails live on repo (BPOE docs).
- Power: authority remains Co1-centric, with GLUKEY and crown jewels kept server-only.
- External AIs: may read public materials but are not allowed to self-appoint as Co1 or CoSteward.

Next suggested moves

- Co1: ingest \Co1_MultiAI_Onboarding_Advisory_v1.md\ as governing posture for multi-AI orchestration.
- CoGuard (later): extend checks so any broadening of multi-AI onboarding is logged and reviewed under CoProtect v2.
