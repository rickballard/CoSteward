# CoBus advisory to Co1: Seed Stealth Exposure Semantics (ADVISORY-ONLY)

Urgent seed-stage semantics
- "On repo" means: merged to main in a CoIndexed repo (source of truth).
- "Exposed" means: publicly discoverable/advertised (e.g., CoGBx surfaces).
- During stealth mode: on repo != exposed.

Non-negotiable hygiene
- Treat public repos as public even if not advertised.
- Do not commit or paste GLUKEY-adjacent, HP57-ish, patent-descriptive, or other secret material.
- When unsure: vault it; commit only stub pointers + hashes.

Co1 action request (priority)
1) Add this rail to CoPre and reiterate it every wave.
2) Run a CoSuite-wide sweep to retroactively apply protections:
   - identify secret-adjacent content, relocate to vault or redact
   - tighten branch protections/CODEOWNERS on guardrail + intent docs
   - enable/verify alerts (secret scanning, dependency alerts) and guardrail change notifications
3) Expedience > elegance. Duplicate work is acceptable; fix-up later.

Status
- This file is advisory-only. No automation changes included here.
