# CoBus Notice – Darren pack session drain

> UTS: 20251209T154902Z
> Repo: CoSteward
> Vault root: \\Server\CoCiviumAdmin

## Summary

- The long-running "Outreaches" session has been drained into the vault for Darren-related work.
- A Darren-specific handoff pack now lives under:
  - \\Server\CoCiviumAdmin\VaultHandoff\Darren20251212
- Future sessions must treat the vault as source of truth for Darren prep, not chat history.

## Darren pack anchors in vault

- Darren handoff dir:
  - \\Server\CoCiviumAdmin\VaultHandoff\Darren20251212
- HP/BP working area for Megascroll evolution:
  - \\Server\CoCiviumAdmin\VaultMegaScroll\HP_BP_Work
  - Includes HP, BP, investor story, risk, valuation sketch, investor profile, manifest, stress tests.
- Vault inventory baseline root:
  - \\Server\CoCiviumAdmin\VaultInventory
  - Use latest CoVaultInventory_* run for size and complexity context.

## Prior Outreaches handoff (context only)

- Outreaches session drain handoff lives under:
  - \\Server\\CoCiviumAdmin\\VaultHandoff\\Outreaches20251208
  - File: Outreaches_SessionDrain_Handoff_v1_*.md (see directory for exact UTS).
- That handoff explains the original vault evolution intent and HP/BP goals.

## Instructions for CoPrime20251208 (Co1) and future sessions

- Do not rely on this ChatGPT session memory.
- Always reopen, on each new session:
  - \\Server\CoCiviumAdmin\VaultHandoff\Darren20251212
  - \\Server\CoCiviumAdmin\VaultMegaScroll\HP_BP_Work
  - \\Server\CoCiviumAdmin\VaultInventory (latest inventory run and baseline metrics JSON).
- Treat the Darren handoff note in the Darren20251212 folder as the local index for this wave.

## Scope and limits of this drained session

- This session contributed:
  - HP/BP core pack drafts.
  - Stress tests and risk framing concepts.
  - Vault inventory baselines and CoVault BPOE guidance.
  - Multi-site constellation framing (quiet-phase, AI-facing facades).
- All further Darren-related evolution (IP pipeline, decks, memos, Megascroll polishing) is expected to happen in CoPrime20251208 and follow-on sessions.
- This session should be considered complete and not reused for heavy work.

## CoBloat / rotation note

- CoBloat at time of drain:
  - CU: SOFT (compute usage elevated).
  - PU: HARD (long chains of MegaWaves).
  - HU: SOFT to HARD (user fatigue, lag concerns).
  - WT: SOFT (waits tolerable but creeping up).
- Recommendation: treat this notice as the formal close of "Outreaches" for Darren work and default to fresh sessions.
