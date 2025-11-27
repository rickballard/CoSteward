# CoSync tag: MW_Replan v1

Purpose: standard CoSync tag for announcing that a MegaWave countdown has been replanned or reset.

Recommended pattern on the bus:

- `CoSync: MW_Replan <mission>/<session>/<wave_id> <- <reason>`

Examples:

- `CoSync: MW_Replan CoIndex_BackboneDesign2025_Mission/MurphyPlus_CoIndex20251123/MW_CoIndex_HelperWave_v2 <- PU=HARD, split helpers`
- `CoSync: MW_Replan CoPortal_Bootstrap2025_Mission/CoPortal+Git20251125/MW_CoPortal_BetaWave_v1 <- scope change`

Any session that sees `MW_Replan` should prefer the most recent declared wave plan for that mission and session.
