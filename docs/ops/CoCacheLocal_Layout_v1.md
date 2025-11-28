# CoCacheLocal layout (pilot)

- session_label: CoIndex20251128
- written_utc: 20251128T220342Z

## Mount

- root_mount: Z:\  (\\\\Server\\CoCacheLocal)

## Top folders

- _AdviceBombs   - long-term storage of AdviceBomb_*.zip plus .sha256 sidecars.
- _CoSuiteInbox  - staging area for future CoSuite-wide bundles and MegaWaves.
- _HP57\\_Repos   - high-privacy repo zips, encrypted where applicable.
- _HP57\\_Transcripts - high-privacy transcripts and sensitive notes.
- _MegaZips      - whole-CoSuite or multi-repo mega archives.
- _Temp          - scratch space, safe to clear when idle.

## Notes for CoPrime / Co1

- Treat Z:\ as primary cold-storage / object-store for HPC-scale artifacts until
  a distributed CoCacheGlobal is ready.
- AdviceBomb wave archives now live under _AdviceBombs with SHA256 receipts.
- Future HP57 helpers should:
  - move highly sensitive payloads into _HP57 (or encrypted subfolders),
  - keep public-safe artifacts elsewhere for easier mirroring.
