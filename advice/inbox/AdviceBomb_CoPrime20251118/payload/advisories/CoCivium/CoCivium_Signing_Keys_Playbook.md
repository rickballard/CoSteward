# CoCivium Signing and Keys Playbook

Targets to sign
- Public PDFs and briefs
- AdviceBomb zips and releases
- Images used as official statements or badges

Key publication
- Publish authorized keys at `/keys/` with owner, role, and fingerprint
- Mirror fingerprints in a DNS TXT record for out-of-band trust

Signing
- Use Ed25519 with a role key such as `claims@cocivium`
- Keep the private key offline where possible

Verification
- Provide a one click verify page that loads the asset, checks signature, and looks up inclusion in the log
