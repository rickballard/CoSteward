# CoProtect decision note – CoAudit

- UTC: 20251204T132108Z
- Decision: Set rickballard/CoAudit visibility to *private* on GitHub.
- CoProtect level: Private_RepoOnly
- Rationale:
  - CoAudit contains audit patterns and orchestration-sensitive insights that should not be public while CoProtect/HP57 posture is still evolving.
  - Codeword switches in a public repo are not a strong defense against adversarial mining.
- Next steps:
  - Use CoAudit privately to refine Scan-CoExposure and CoProtect helpers.
  - Later curate a Public_OK/Public_Harden subset (CoAuditPublic or CoCache/CoIndex views) once counsel and Outreach&BP are satisfied.

This note is informational until added to Git and pushed.
