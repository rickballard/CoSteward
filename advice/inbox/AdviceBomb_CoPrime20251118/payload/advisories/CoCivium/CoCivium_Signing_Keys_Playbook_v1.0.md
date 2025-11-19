# CoCivium Signing & Keys Playbook v1.0

**Goal:** Publish a clear trust root; sign all official assets; make verification trivial.

---

## 1) Roles & Keys

- `PRIMARY` (Ed25519)  -  issues official claims and signs policy/legal PDFs.
- `RELEASE` (Ed25519)  -  signs AdviceBomb zips and repo releases.
- `MEDIA` (Ed25519)  -  signs images with C2PA metadata (optional).

**Key metadata example (keys.json):**
```json
{
  "version": 1,
  "updated": "2025-11-18T00:00:00Z",
  "keys": [
    {"key_id":"PRIMARY","alg":"ed25519","fingerprint":"ed25519:XXXX","owner":"CoCivium","status":"active"},
    {"key_id":"RELEASE","alg":"ed25519","fingerprint":"ed25519:YYYY","owner":"CoCivium","status":"active"}
  ]
}
```

Mirror the `PRIMARY` fingerprint in DNS TXT: `_cocivium._auth`.

---

## 2) Key Creation (OpenSSL 3.x examples)

> Run on an offline machine; copy out only the public key.

```powershell
# Generate Ed25519 private key
openssl genpkey -algorithm ED25519 -out primary.key

# Extract public key (PEM)
openssl pkey -in primary.key -pubout -out primary.pub

# Fingerprint (SHA-256 over DER public key, hex)
openssl pkey -pubin -in primary.pub -outform DER | openssl dgst -sha256
```

Store as:
```
/secrets/primary.key      (600)
/public/primary.pub       (644)
```

---

## 3) Signing & Verifying (files)

```powershell
# Sign any file (detached signature, base64)
openssl pkeyutl -sign -inkey primary.key -rawin -in artifact.bin | openssl base64 -A > artifact.bin.sig

# Verify (returns 0 on success)
openssl base64 -d -A -in artifact.bin.sig | openssl pkeyutl -verify -pubin -inkey primary.pub -rawin -in artifact.bin
```

**Note:** For JSON claims, sign the **JCS‑canonical bytes** of the JSON (not the pretty‑printed text).

---

## 4) Repo Layout & Publication

```
/keys/keys.json                 (authorized keys + fingerprints)
/keys/primary.pub               (PEM)
/releases/<name>.zip + .sig
/claims/cc-*.json               (inline signatures per Spec v1.0)
/claims.jsonl                   (append-only log)
```

Serve `/keys/` and `/claims*.json*` over HTTPS with long‑cache headers and `ETag`.

---

## 5) Rotation & Revocation

- Emit a signed claim announcing the new key (and reason).
- Mark prior key `status:"retired"` in keys.json; keep public material online.
- For compromise: add `status:"revoked"` + `revoked_at` and publish a short incident claim.

---

## 6) One‑click Verify (server‑side option)

Expose an endpoint:
```
GET /api/verify?id=cc-YYYY-MM-DD-###
-> { "status":"PASS", "key_id":"PRIMARY", "issued_at":"...", "sha256":"..." }
```
This service performs the Spec v1.0 checks server‑side for users without local tooling.

