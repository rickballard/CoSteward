# CoCivium Official Claims Spec v1.0

**Purpose:** Any assertive public statement from CoCivium must be machine‑verifiable in <10s by anyone.

---

## 1) Canonical Claim Object

- **Format:** UTF‑8 JSON, canonicalized via [JCS] (deterministic property ordering, no insignificant whitespace).
- **Filename:** `claims/<claim_id>.json`
- **Required fields:**

```json
{
  "schema": "https://cocivium.org/specs/claim/v1",
  "claim_id": "cc-YYYY-MM-DD-###",
  "title": "Short factual title",
  "body": "Clear, factual statement (<= 1,000 words).",
  "issued_at": "2025-11-19 04:02:16Z",
  "issuer": {
    "name": "CoCivium Steward's Office",
    "role": "steward",
    "key_id": "ed25519:PRIMARY"
  },
  "resources": [
    {"type":"url","href":"https://cocivium.org/verify/cc-YYYY-MM-DD-###"},
    {"type":"repo","href":"https://github.com/rickballard/CoCivium"}
  ],
  "merit_rank_snapshot": {"version":"0.3","score":0.82},
  "hash": "sha256:BASE16_OF_CANONICAL_BYTES",
  "log_pointer": "claims.jsonl:<sha256>",
  "signature": "ed25519:BASE64(SIGN(JCS_BYTES))"
}
```

**Notes**
- `hash` is the SHA‑256 of the canonical bytes (hex, lowercase).
- `signature` is the Ed25519 signature over the same canonical bytes.
- `key_id` must match a key published under `/keys/` and mirrored in DNS TXT.

---

## 2) Keys and Trust Roots

- **Authorized keys directory:** `https://cocivium.org/keys/keys.json`
- **DNS TXT:** `_cocivium._auth TXT "ed25519:<fingerprint> keyid=PRIMARY; updated=<ISO8601>"`
- **Rotation:** announce new keys in a signed claim; keep prior keys for verification for at least 12 months; mark old keys `"status":"retired"`.

---

## 3) Transparency Log

- **File:** `claims.jsonl` (append‑only, one JSON object per line)
- **Entry:** `{"claim_id":"...", "sha256":"<hex>", "issued_at":"<iso>", "merkle_leaf":"<hex>"}`
- **Merkle root:** publish `claims.merkle` after each batch with `root`, `leaf_count`, and `generated_at`.
- **Immutability:** never rewrite published lines; corrections require a new claim referencing the prior id.

---

## 4) QR Payload Schema

- **Format:** JSON compact string (<= 512 chars)
```json
{"id":"cc-YYYY-MM-DD-###","sha256":"<hex>","u":"https://cocivium.org/verify/cc-YYYY-MM-DD-###"}
```

---

## 5) Verify Page (Reference Behavior)

1. Fetch claim JSON by id.
2. Canonicalize (JCS), recompute SHA‑256, compare to `hash`.
3. Resolve `key_id` → fetch keys.json, verify Ed25519 signature.
4. Confirm the `sha256` is present in `claims.jsonl` (and in the latest Merkle tree if published).
5. Display **PASS/FAIL**, issuer name, key id, issued_at, and diffs if a newer superseding claim exists.

---

## 6) Error Codes

- `NOCLAIM` – id not found
- `BADHASH` – computed hash != `hash` field
- `BADSIG` – signature invalid for key
- `KEYUNKNOWN` – key_id not in authorized set
- `NOTINLOG` – sha256 not present in log
- `SUPERSEDED` – a newer claim supersedes this id

---

## 7) Minimal Repository Layout

```
/claims/cc-*.json
/claims.jsonl
/claims.merkle
/keys/keys.json
/verify/ (static page + client code if used)
/legal/ (policy, receipts)
```

---

## 8) Back‑compat & Migration

- v0.1 claims lacking `schema` and inline `signature` remain valid if accompanied by a detached `.sig` and listed in `claims.jsonl`.
- New tooling must emit v1.0 fields going forward.
