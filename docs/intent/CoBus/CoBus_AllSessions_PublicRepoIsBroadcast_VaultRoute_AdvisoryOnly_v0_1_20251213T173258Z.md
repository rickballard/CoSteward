# CoBus advisory (ALL SESSIONS): Public repo is a broadcast medium + Vault-route session-only CoCarries (ADVISORY-ONLY)

This file is advisory-only. It contains no secrets. Not legal advice.

## 1) Prime directive (seed stage + beyond)
- Treat any public git remote as public, forever.
- "Deleted" does not mean gone: history, forks, clones, caches, PR refs, mirrors can retain the original.
- Therefore: if secret-ish content touches a public repo, assume compromise and respond accordingly.

## 2) Semantics rail (seed stealth mode)
- "On repo" means: merged to main in a CoIndexed repo (source of truth).
- "Exposed" means: publicly discoverable/advertised/surfaced (e.g., CoGBx).
- During stealth mode: on repo != exposed, but public repo is still public.

## 3) Vault routing (session-only CoCarries)
When a session generates operational details that exist only in the current chat instantiation ("CoCarry-now"):
- DO NOT paste bulk secrets into chat logs or public repos.
- Route to off-repo vault using encrypted bundles (e.g., SecureUploadZip micro-standard: 7z AES-256 + mhe on).
- On repo: commit ONLY stubs/pointers + hashes (and optionally filenames, dates, and a vault locator label that is non-sensitive).

Stub template (repo-safe)
- Artifact name (sanitized):
- SHA256:
- Created UTC:
- Vault location label:
- Retrieval procedure pointer (non-sensitive):
- Notes: "Content kept off-repo per seed-stage vault rail."

## 4) Trigger conditions (hard stop)
If any of these might be true, the session must default to vault + stubs:
- GLUKEY-adjacent / HP57-ish / patent-descriptive
- credentials, tokens, keys, secrets, endpoints
- operational guardrails that would help an adversary bypass or surveil

## 5) Incident posture (if leak happens)
- Assume compromise
- Rotate/disable credentials and tokens
- Assess blast radius
- Consider git history rewrite only as secondary mitigation; it is not a full undo

## 6) CoPre requirement (every wave)
- Repeat: "Public repo is broadcast medium" + "Vault-route CoCarry-now"
- When rail triggers: externalize, stub+hash, rotate to fresh tab if needed

Status
- Advisory-only. Convert to enforceable standards only after Co1 decides scope and vault boundaries.
