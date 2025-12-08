# CoAnchor Quickstart (Thin v5)

## Purpose
Bootstrap all CoCivium nodes (human or AI) into the CoSuite BPOE:
- repo-first
- PS7 automation
- programmatic updates only
- CoLanguage-aware
- Civ2-default intentionality

## Rules
1. All work is programmatic-first (PS7 default).
2. All repo modifications go through DO Blocks → git branch → PR → squash.
3. Desktop CoAnchor file MUST be updated by automation scripts only.
4. Session interactions SHOULD emit PS7 DO Blocks.
5. BPOE evolves on-repo.

## Required Tools
- PowerShell 7+
- Git with SSH auth
- Local checkout of all CoSuite repos

## Quickstart
1. Run Update-CoAnchor.ps1 to refresh this file.
2. Run CoSync.ps1 to align repos.
3. Run DO Blocks emitted by AI.

## Civ2 Note
CoLanguage primitives SHOULD be used for CLI verbs, advisory packets, and metadata.
