# BPOE — MegaWave (Megazip Waves)

**Principle.** Ship human-facing content and runnable demos as **zip-first** bundles (“Waves”), each with a .sha256 sidecar, a Violet Receipt, and an INBOX_LOG entry.

## Canonical flow
1. **Stage** under ~/CoTemp/Megazip_*/* (never commit raw dumps directly).
2. **Verify** with erify/.CoVerify.ps1 (strict; CI-safe).
3. **Pack** via 	ools/Pack-ContentWave.ps1 ⇒ AdviceBomb_ContentWave_<UTCSTAMP>.zip + .sha256.
4. **Ingest** to CoCache/advice/inbox and **append** INBOX_LOG.md (tab-delimited).
5. **Receipt**: docs/intent/advice/notes/YYYYMMDD/VIOLET_RECEIPT_<Wave>_<UTCSTAMP>.md.
6. **PR etiquette**: short branch (ops/contentwave-…), labels: dvicebomb, 	riage, squash-merge.

## Versioning & windows
- **Wave labels**: 1/a2/… for authoring passes; N for repacks (verification/patches).
- **Diagram/content freeze** (when needed): announce DIAGRAM_FREEZE_NOTICE.md + guard workflow; always add a **Violet Receipt** on lift.

## Repo hygiene
- .gitattributes: normalize LF for text; avoid CRLF churn.
- .editorconfig: UTF-8, LF, 2-space YAML/MD, 4-space PS1.
- Do not store large binaries in repo; keep in Waves.

## Roles
- **Assistant** posts links + .sha256. **Rick** downloads (unless failure reported).
- **Receipts by default.** Everything reversible, auditable, and timed.

