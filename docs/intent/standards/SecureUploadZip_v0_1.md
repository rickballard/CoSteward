# SecureUploadZip v0.1

Purpose
- Standardize encrypted attachment uploads using 7-Zip, consistent across sessions and repos.

Default
- Format: 7z
- Cipher: AES-256
- Encrypt file names (header encryption): on (-mhe=on)
- Passphrase: prompted interactively (never inline)

Canonical command
- 7z a <archive>.7z <inputs...> -mhe=on -p

Notes
- Use -p (prompt) to avoid secrets in history.
- Treat anything possibly GLUKEY, HP57, or patent-descriptive as sensitive. Keep in vault; commit only stubs + hashes.
