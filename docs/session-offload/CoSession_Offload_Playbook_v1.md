# CoSession Offload Playbook (v1)

Generated: 20251208T052903Z

## Intent

Define how chat / AI sessions offload their "memory cloud" into repos so that:

- Repos remain the **source of truth**.
- Sessions can "bleed" safely without losing key wisdom and intent.
- CoStewards have repeatable patterns for turning session drift into durable assets.
- Future CoAgents can treat session offload as a first-class behaviour.

This is a **playbook**: concrete patterns and habits, not just philosophy.

## BPOE assumptions (session vs repo)

- Sessions are **working memory**, not permanent storage.
- Session memory is:
  - Noisy, lossy, and vendor-constrained.
  - Vulnerable to bloat, truncation, and opaque "forgetting".
- Repos are:
  - Auditable, versioned, and portable across vendors.
  - The only stable place for long-lived CoWisdom and CoIntent.

**Therefore**:

- Anything you would be sad to lose to session drift MUST be pushed to repo.
- Offload should happen regularly, not just at "the end" of a project.

## Offload units: clusters, frames, blobs, links (seed)

Session offload content is organised into **clusters** and **packets**:

- Cluster: a logical grouping (eg. Cluster01_BPOE_Deltas) under  
  docs/session-offload/cloud/clusters.
- Packets (seed terminology):
  - GBR-Frame: high-level framing of a session theme or wave-set.
  - GBR-Blob: dense payload (eg. summarised insights, stitched advisories).
  - GBR-Link: pointers to repos, files, or external artefacts.

Earlier CoWaves seeded Cluster01_BPOE_Deltas and related packet structures.

## When to offload (seed)

Stewards SHOULD trigger offload waves when:

- A session has accumulated several important attachments and advisories.
- The dialogue has produced new patterns, BPOE rules, or GIBindex-worthy terms.
- There are signs of bloat:
  - Long thinking-time gaps.
  - Increasing reliance on distant in-session memories.
  - Confusion about "which session knows what".

Heuristics:

- **Little and often** beats giant, rare offloads.
- Whenever you write "we should not lose this", schedule an offload wave.

## How to offload (human steps, seed)

Short version:

1. Identify a cluster:
   - Use an existing one (Cluster01_BPOE_Deltas, etc), or
   - Create a new cluster under docs/session-offload/cloud/clusters.
2. Decide the packet types:
   - Frames for high-level story / context.
   - Blobs for detailed payload.
   - Links for cross-repo references.
3. Run CoWaves that:
   - Create the YAML packets and navigation maps.
   - Store human-facing summaries alongside the machine-facing view.
4. (Optional) Attach offload work to:
   - Advisory docs for Outreaches / Co1 / CoPrime.
   - GIBindex entries and concept definitions.

Future waves and tools will automate more of this (see helper script stubs).

## Relation to Outreaches and Co1 / CoPrime

- Outreaches:
  - Receives curated advisories that summarise and route offload results.
  - Acts as a review hub for what should become public vs HP57 / crown-jewel.
- Co1 / CoPrime:
  - Orchestrates multi-repo offload and indexing.
  - Ensures offload assets are linked into CoIndex, GIBindex, and CoBus flows.

## Open work

- Define more clusters (Cluster02_*, etc) for different themes.
- Create helper scripts that:
  - Ingest local advisory files and turn them into blobs + links.
  - Generate CoIndex snippets from stable offload packets.
- Connect this playbook explicitly to:
  - CoBPOE core rules.
  - CoAudit / CoGuard style tools that watch for "forgotten" offload obligations.
