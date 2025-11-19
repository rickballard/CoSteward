# Handover Plan  -  Risks & Mitigations
**UTC:** 2025-11-19 03:38:38Z

## Potential Flaws
1. **Link rot / non-existent files** if assets are not generated in-session.
2. **Partial ingestion** when phone drops more than 10 files without a manifest.
3. **Ambiguous precedence** if multiple sessions create overlapping files.
4. **Stubs slipping through** if creators don't verify content length or checksums.

## Mitigations (baked into this bundle)
- All files are generated in-sandbox and verified prior to linking.
- A manifest with SHA-256 for each file is provided.
- Files are grouped into a versioned zip for atomic ingest.
- Each file is self-contained and references related assets explicitly.

## Operator Tips
- Import assets in batches of 9–10 files max per cycle if needed; otherwise just use the zip.
- Record the zip name and checksum in your INBOX_LOG after moving to repo.

