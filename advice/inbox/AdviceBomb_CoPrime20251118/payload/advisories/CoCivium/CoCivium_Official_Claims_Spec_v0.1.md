# CoCivium Official Claims Spec v0.1

Purpose: make any public claim machine verifiable within seconds.

## Claim JSON (canonical before signing)
```json
{
  "claim_id": "cc-2025-11-18-001",
  "title": "Example partnership claim",
  "body": "Short factual text.",
  "issued_at": "2025-11-18T16:05:00Z",
  "issuer": {
    "name": "CoCivium Steward's Office",
    "rep_tag": "CoCivium/Steward",
    "key_id": "ed25519:EXAMPLE"
  },
  "resources": [
    {"type": "url", "href": "https://example"},
    {"type": "repo", "href": "https://github.com/example"}
  ],
  "merit_rank_snapshot": {"version": "0.3", "score": 0.82},
  "log_pointer": "claims.jsonl:<hash or line>"
}
```

## Signature
- Detached signature file: `<claim_id>.sig` using Ed25519
- Public keys published at `/keys/` and in a DNS TXT record

## Transparency log
- Append each claim hash to `claims.jsonl`
- Keep a Merkle root note for periodic checkpoints

## Human QR
- Encodes claim id, hash, signature URL, and `verify` page URL

## Verify page flow
- Fetch JSON and signature, validate against authorized key list
- Confirm inclusion in transparency log
- Show PASS or FAIL with key owner and timestamp
