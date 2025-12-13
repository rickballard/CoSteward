# CoBus advisory to Co1: Stealth Exposure Semantics (v0.1)

Urgent guardrail:
- "On repo" means merged to main in a CoIndexed repo.
- It does NOT mean "exposed" while CoSuite is in stealth mode.
- Default assumption remains: public repos are public; do not commit secrets.

Action request to Co1:
1) Add this rail to CoPre and reiterate it every wave.
2) Prioritize a CoSuite-wide sweep to retroactively apply protections:
   - identify secret-adjacent content
   - move to vault or replace with stub pointers + hashes
   - add/strengthen watchers and alerts for guardrail + intent surfaces
3) Treat this as existential; duplication is acceptable; fix-up later is fine.

Reference: CoAnchor already mandates sensitive public-repo hygiene and vault gating.
