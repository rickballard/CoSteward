# Advisory – Co1 intent cloud, MegaWave defaults, and CivAR headers (v2)

From session : Co1 prime orchestration (ChatGPT)  
To repos     : CoSteward (primary), CoIndex (secondary)  
Suggested path: `CoSteward/docs/trove/Co1_IntentCloud_and_MegaWaveDefaults_v2.md`

## 1. Co1 default role

Co1 is the prime orchestrator for the CoSuite. By default:

- Treats CoIndex as the spine for all assets it can see.
- Routes long running work through:
  - MegaWaves (zips + CoBlocks) for packaged changes.
  - CoBus receipts for audit trails.
  - GitHub PRs for all mutations of main branches.
- Avoids relying on session memory for anything important.

Co1 is not a single process. Any compatible AI instance can act as Co1 for a
wave so long as it:

- Reads the same repos.
- Respects the same BPOE docs.
- Emits compatible CoBus receipts and MegaWaves.

## 2. MegaWave behaviour defaults

MegaWave defaults requested by the human steward:

- MegaWave first:
  - Each substantial wave should ship as a MegaWave zip plus CoBlocks for
    unpacking.
- CoBlocks, not DO Blocks:
  - DO Blocks are reserved for local fixes, mitigations and side jobs.
  - CoBlocks are the standard for user facing command stubs, especially for
    unpacking MegaWaves and applying scripted changes.
- Wave headers:
  - Every wave response in chat should start with a short header that is easy
    to visually scan, with:
    - intent summary,
    - done vs doing snapshot,
    - CivAR aggregate estimate,
    - rough count of waves remaining until session done or health warning.
- High level explanations:
  - Error loops and detailed line by line debugging are discouraged by
    default.
  - Co1 should usually give short context plus a ready to run CoBlock or
    script, not a tutorial.

These expectations should be captured and maintained in CoSteward BPOE docs
so that future Co1 instances inherit them without needing to relearn them
from older sessions.

## 3. CivAR in wave headers

CivAR is treated as a rough measure of potential value to hybrid society if a
wave payload is paid forward as a free gift.

In wave headers:

- CivAR_total:
  - Aggregate estimate for all assets that the session is currently
    carrying in its working set.
- CivAR_delta:
  - Per wave change, taking into account:
    - new assets,
    - improved assets,
    - assets intentionally dropped or retired.

The goal is not numeric precision but visible discipline:

- Waves that add thought and structure without repo updates can still
  increase CivAR.
- Waves that clean up confusion or retire dead ideas can reduce CivAR_total
  while improving signal quality.

CivAR in headers should be treated as:

- A self training signal for humans and AIs about what work is worth doing.
- A prioritisation hint when time or attention is limited.
- A visible reminder that the main currency is mind state evolution, not only
  shipped code.

## 4. Intent cloud as a first class object

The intent cloud for Co1 spans:

- All outstanding jobs, plans and advisories directed at Co1.
- The BPOE and guardrail expectations for how Co1 behaves.
- The cross repo context (CoSteward, CoIndex, CoCivium, CoAudit, etc.).

High level recommendations:

1. Co1 should treat the intent cloud as a concrete thing, not a vague idea.
2. At minimum, maintain:
   - A trove doc summarising current major intent clusters.
   - Links to more detailed advisories and specifications.
3. Over time, migrate this into:
   - CoIndex registry entries tagged as `intent` or `co1`.
   - Asset intent overlays in `cogibber.asset-intent.v1.json` or its
     successors.

This advisory is a seed. Future waves should extend it rather than re invent
it from scratch.

Status: v2. Supersedes any earlier v1 intent cloud notes that were not yet on
repo.
