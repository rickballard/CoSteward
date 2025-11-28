# CoCheck - Open Threads and Next Waves - v1

Timestamp: 20251128T045431Z
Repo: CoSteward
Session label: CoCheck
Mission id: CoCheck_ProductBuild_Mission

This note captures loose intent from the CoCheck session so that no
important CoCheck wisdom remains only in transient session memory.

## 1. Scope clarification

- CoCheck v1 is a media reading and trust layer plus a writer co-evo helper.
- It is responsible for:
  - cleaning and summarizing long form articles,
  - scanning for bias and framing patterns,
  - estimating time and attention saved,
  - aggregating outlet and author level metrics such as MeritRank and RepTag,
  - and shipping a prompt based writer co-evolution pack.

- The idea of a helper asset that reorganizes Git repos into a
  CoCivium aligned layout (reversible refactors, intent notes,
  BPOE alignment for folder structure) is **not** part of CoCheck v1.
- That repo focused helper should be a sibling product with its own
  mission and MegaWave countdown. Working names could include
  CoStruct, CoRefit or CoCheck-Code, but it should live under
  a separate product line and not be bundled into the CoCheck v1 scope.

## 2. MegaWave countdown as a BPOE pattern

- The file docs/product/CoCheck/CoCheck_MegaWave_Countdown_v1.md is
  the first example of a compact MegaWave summary for a product mission.
- It records:
  - wave ids and short roles,
  - landing paths for each wave,
  - key files created or updated,
  - and the megazip path patterns for local artifacts.

Future BPOE work should add a general pattern document, for example:

- docs/bpoe/CoMegaWave_Countdown_Pattern_v1.md

That pattern should describe:

- one countdown file per mission,
- the expected sections and fields,
- how a mission can be audited and rehydrated from the countdown,
- and how other repos can copy the pattern when they start new missions.

## 3. Launch and licensing posture

CoCheck is intended as a free to world civic utility, not a commercial,
ad driven product.

Principles to codify in a future document such as
CoCheck_LicensingAndAntiCapture_v1.md:

- no paid score boosts or trust badges,
- no ads embedded into trust features,
- no sale of user behavior data to scored outlets,
- donations (if any) flow only via CoCivium structures under
  anti capture governance,
- scoring methods and changes remain transparent and versioned,
- data and methods should be exportable so CoCheck scores cannot be
  quietly captured by a single platform.

This document does not select a specific license text, but it records
the intent that CoCheck be treated as a long lived civic utility under
explicit anti capture constraints.

## 4. Suggested next waves (post v1 docs)

These are not commitments, but suggested directions for future
CoCheck MegaWaves.

### 4.1 Wave 6 - Test plan and example sessions

- Define a small suite of article to CoCheck View examples.
- For each example, capture:
  - the original source and topic (or an anonymised description),
  - the expected Quick and Concise output shape,
  - the expected Verbose, Original Voice and Favorite Writer mode
    behaviours,
  - and a short acceptance checklist for any implementation.

This wave would make it easier for future implementors to test CoCheck
behaviour without having to re read all upstream specs.

### 4.2 Wave 7+ - Sibling repo refactor helper (new mission)

- Start a separate mission for a repo structure helper aligned with
  CoCivium BPOE.
- That mission should:
  - read a repo structure and key docs,
  - propose reversible change plans into a more CoCivium aligned layout,
  - emit intent notes and CoSync pointers so changes are auditable.

Naming and repo placement for this sibling product should be decided
in that future mission, not in CoCheck v1.

## 5. Session close declaration

As of this note being written, the CoCheck mission has the following
assets on repo:

- product seed and short need/spec stub,
- full PRD draft and writer co-evo prompt pack stub,
- UX flows and architecture and MVP plan,
- local helper and CLI implementation spec,
- a MegaWave countdown file for the CoCheck mission,
- and this open threads and next waves note.

Any additional CoCheck ideas that arise after this note should be
treated as **new waves or new missions** and captured in their own
files. There is no remaining CoCheck specific intent that needs to be
recovered from this session once this file is added, committed and
pushed.
