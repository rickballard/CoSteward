# Co1 loose-advisories wave plan (2025-11-29 v1)

written_from_session : CoIndex20251128 / CoCivium_AIVendor_Onramp
role                 : bring orphan Co1 advisories onto repos

## Assets in scope

- CoCheck_CoEthics_v2.md
  - target_repo  : CoCheck
  - target_path  : docs/intent/CoCheck_CoEthics_v2.md
  - role         : combined CoCheck + CoEthics + CoGuard baseline lens.

- CoCivia_Everywoman_Loop_DesignBrief_v2.md
  - target_repo  : CoCache
  - target_path  : docs/graphics/CoCivia_Everywoman_Loop_DesignBrief_v2.md
  - role         : living design brief for CoCivia “everywoman” morph loop.

- Products20251118_toCo1_handoff.md
  - target_repo  : CoCache
  - target_path  : docs/intent/Products_WaveRegistry_20251118_v1.md
  - role         : product lanes / registry snapshot for Co1.

- CoAnchorQuickstart..md
  - target_repo  : CoSteward
  - target_path  : docs/onramps/CoAnchor_Quickstart_v1.md
  - role         : minimal CoAnchor quickstart advisory.

- CoSync_Beacon_To_Co1_Advisory_v1_1.md
  - target_repo  : CoCache
  - target_path  : docs/intent/CoBeacon_Advisory_v1_1.md
  - role         : CoBeacon / CoHarbour / attention attractor advisory.

- InSeed_more_Advisory_EmergentIntelligenceVideo_v1.md
  - target_repo  : InSeed
  - target_path  : docs/intent/InSeed_EmergentIntelligenceVideo_Advisory_v1.md
  - role         : guidance for using or replacing the emergent-intelligence video on InSeed.

- Co1_Advisory_EmergentIntelligenceVideo_v1.md
  - target_repo  : CoSteward
  - target_path  : docs/intent/Co1_EmergentIntelligenceVideo_Advisory_v1.md
  - role         : meta-advisory for Co1 about the same video / asset.

## Wave pattern

1. Confirm these seven source .md files are present in a single local folder
   (for example: C:\Users\Chris\Downloads\Co1_LooseAdvisories_20251129).

2. Run a Co1 helper script that:
   - copies each file into its target repo + path,
   - creates directories as needed,
   - prints per-repo git add / commit / push hints with #◆Co: safety prefix.

3. For each touched repo:
   - review git status,
   - commit with a clear message,
   - push to GitHub.

4. Optionally:
   - add CoIndex trove entries for key advisories,
   - link from CoSteward BPOE / onramps indices.

This document is the plan-of-record. Any later refinements should
update this file or add a v2+ alongside it.
