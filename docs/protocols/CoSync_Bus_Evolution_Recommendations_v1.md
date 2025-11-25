# CoSync Bus Evolution -- Recommendations for Co1

## Overview

This document summarises a fully evolved set of recommendations for
strengthening the CoSync bus so that Co1 can maintain oversight of
multi-session, multi-repo workflows.

## Goals

-   Provide a shared, standardised way for all sessions to declare
    intent.
-   Enable Co1 to detect overlaps, risks, or conflicts across repos.
-   Make it possible for Co1 to route advisories to other sessions.
-   Reduce hidden divergence and confusion in concurrent missions.

## Recommendations

### 1. Standard CoSync Wave Schema

All missions should produce short, consistent wave notes that include: -
missionId - sessionLabel - CoGo holder - active repos/branches - short
scope summary - CoBloat heartbeat (CU, PU, HU, WT) - links to PRs and
AdviceBombs

### 2. Centralised Index of Active CoSync Waves

Co1 should maintain a canonical index file (e.g.,
`CoCache/docs/intent/CoSync_Index.json`) containing: - all wave notes
discovered across repos - timestamps and freshness status - rough topic
tags

### 3. Repo Scanner CoBlock

Each session should be able to run a standard CoBlock before modifying a
repo: - scans local repo's waves folder - identifies active missions
touching this repo - prints advisories if risks or conflicts appear

### 4. Global Scanner for Co1

Co1 should run a wider scanner: - walks all repos in the workspace -
collects all wave notes - builds the global index - computes overlaps
(repositories and topics)

### 5. Topic Heuristics

Wave notes should include lightweight topic tags (e.g., `CoSteward`,
`InSeed`, `CoCore`, `GIBindex`) to allow overlap detection.

### 6. Advisory Routing

Once the bus is robust, Co1 can: - notify relevant sessions when
overlaps occur - prompt users to refine scope - recommend lane splitting
or merging

------------------------------------------------------------------------

This document can be dropped into Co1 directly to initiate development
of the next-level sync tooling.
