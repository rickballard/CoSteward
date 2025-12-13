# CoGuard: Stealth Exposure Semantics v0.1

Seed-stage definition
- "On repo" means: merged to main in a CoIndexed repo (source of truth).
- "Exposed" means: discoverable/advertised via CoGBx or other public surfaces.
- During stealth mode, default policy is: on repo != exposed.

Operational rule
- Treat all public repos as public, even if not yet advertised.
- Never commit or paste GLUKEY-adjacent, HP57-ish, patent-descriptive, or otherwise secret/sensitive material.
- When unsure, treat as sensitive: keep in vault; commit only stub pointers + hashes.

Session rule (CoPre)
- This guardrail must be reiterated every wave of every session (header or footer rail),
  and any content that threatens secrecy must be redirected to vault workflow.

Watcher posture (minimum viable)
- Enable/maintain: branch protection + CODEOWNERS for guardrail files, GitHub secret scanning,
  dependency alerts, and a periodic audit script that flags new public files with "vault/sensitive" markers.
- Alert CoStewards on unexpected changes to guardrail directories and any new "intent" docs.
