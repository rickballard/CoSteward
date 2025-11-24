# CoPermanence doctrine v0.1

## Purpose

CoPermanence describes what it means for something in CoCivium to "count" as persistent.

Local workspaces are always treated as temporary. Only artifacts that are cloud or remote service based, and sharable by design, are considered durable.

This doctrine tells AIs and humans how to speak about persistence, how to reason about "what landed", and how to wire CoStatus around that.

## Definitions

- Local – anything on a single device, session, or memory space. Examples: PS7 buffers, downloads, local clones, window settings.
- Remote or cloud – repos and services that are reachable by more than one device or agent, with version history and access control.
- Shared artifact – a file, issue, PR, or record that can be accessed, linked, and versioned across time and space.
- CoPermanence threshold – the bar at which an artifact is treated as part of the evolving CoCivium record.

Local things can be long lived in practice, but they are still classified as temporary.

## Rules for AIs

When describing actions and verification:

- Always say "cloud" or "remote repo" or "remote service" when you mean a persistent, shared source of truth.
- Treat "local" and "in memory" as temporary, even if the local device writes to disk.
- Never imply "permanent" based only on local state.
- Prefer to create sharable artifacts such as markdown, scripts, and zips that can be moved into repos.
- When unsure, call out the distinction explicitly, for example:
  - "Verified in local reasoning only."
  - "Verified against remote repo state."

Only massively sharable actions or results are treated as candidates for CoPermanence.

## CoStatusCloud vs CoStatusLocal

CoStatus lines should separate:

- CoStatusCloud – metrics that depend on remote facts, such as:
  - repo health,
  - CI passes,
  - advice inbox and MegaWave counters,
  - token and usage metrics reported by the platform.

- CoStatusLocal – metrics that depend on the user's environment, such as:
  - PS7 profile fit to BPOE,
  - local repo cleanliness,
  - startup noise (unexpected consoles or tasks),
  - backup and scratchpad hygiene.

CoStatusLocal is about environment fit, not about the user's worth. The grade is "how aligned is this machine with BPOE", not "how good is this human".

## Evolution note

Nothing in CoCivium is assumed to be truly permanent. Even doctrines and structures can be refactored as the system learns.

Some concepts, such as edge owned guardrails and shared constitutions, are expected to survive far future stages, even to a hypothetical intergalactic civilization.

At that point, all bets are off. CoPermanence is about being honest and explicit about persistence inside the current epoch, not about freezing CoCivium forever.
