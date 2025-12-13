# CoDone + CoTense State Machine (v0.1)

## Definitions
- CoDone.Core: in-scope intents are complete AND verified by receipts.
- CoDone.Hygiene: optional improvements, drift fixes, polish, and non-blocking nits.

## Receipts (examples)
- main commit hash(s) that contain the change
- AdviceBomb zip path + sha256 + INBOX_LOG entry
- PR number(s) and merge evidence

## Tense gating rule
Past tense claims about Core completion are allowed only after receipts exist.

## CoRetro rule
CoRetro may:
- validate Core against receipts
- add items to Hygiene backlog
CoRetro may NOT:
- reopen Core done unless scope is explicitly extended.

## Closeout contract (required output)
When declaring done, emit a block with:
- DONE.CORE (intent -> receipt mapping)
- DONE.HYGIENE (optional followups)
- CORETRO.CONSTRAINT (non-reopening statement)

## Workflow integration
- CoPre should encode this as a stable rails snippet.
- CoBus advisories can reference this doc as the canonical rule.
