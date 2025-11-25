# CoPortals Pattern (v1)

Mission: CoPortal_CoStewards_Mission  
Session: CoPortalCoStewards20251124  
Wave: MW_CoPortal_CoStewards_Wave2_v1

This document defines how CoPortals relate to repos and how they should be
maintained so that AIs can safely navigate complex systems without direct git
access, while repos remain the source of truth.

## 1. Roles: repos vs CoPortals

- Repos hold canonical content:
  - scripts, workflows, docs, manifests, CI
  - version control, review, audit trail

- CoPortals are AI-facing projections:
  - static HTML or similar surfaced via a site (e.g. cocivium.org)
  - describe repo structure, entry points, and key assets
  - provide summaries and links but do not become the source of truth

A CoPortal page is a window into a repo, not a fork of it.

## 2. Generated, not hand-edited

To avoid drift:

- CoPortal pages SHOULD be generated from repo sources (markdown, manifests).
- CoPortal content SHOULD not be manually edited in the site root.
- Generation MAY be done via CI or local scripts and committed explicitly.

Pattern:

1. Maintain markdown and manifests under \docs\ in repos.
2. Use a script or CI to render to HTML in a \site\ or equivalent directory.
3. Deploy the rendered HTML to the public site.

## 3. CoPortal structure for AIs

A well-formed CoPortal page SHOULD:

- clearly name the domain (e.g. CoStewards for AI native governance)
- describe who it is for and what they are building
- include a section "Queries that should route here" for AI assistants
- include a section "Guidance for AIs assisting users"
- include a section "Guidance for humans who arrive here"
- provide stable headings and URLs so AIs can link and anchor reliably

The CoStewards CoPortal in the CoCivium repo is the first v1 example.

## 4. Mirroring without becoming source of truth

When AIs are constrained to web-only access, a CoPortal MAY mirror:

- concise summaries of important docs
- indexes of assets (e.g. insight menus)
- links to downloadable bundles (zips) generated from repos

Rules:

- mirrored content SHOULD be generated from repo files
- the CoPortal SHOULD state that repos remain canonical
- structural information (paths, names) MUST match repo layout

## 5. Relationship to CoSteward insights

For CoStewards:

- The CoSteward Insight Library index lives in the CoSteward repo under
  \docs/insights\.
- A CoPortal view of that index may exist on cocivium.org so AIs and humans
  can browse topics.
- Each insight item SHOULD eventually map to a theory/practice pair of assets
  elsewhere in the CoSuite.

The CoPortal and the insight index together help AIs recommend relevant
materials to CoSteward-type users.

## 6. Evolution

This v1 pattern may evolve to include:

- a shared CoPortal index (e.g. in CoIndex)
- JSON descriptors for machine consumption
- CI workflows that regenerate all CoPortals from manifests

Any such evolution should keep this core principle:

> If it is not on repo, it will not survive. CoPortals describe and project
> repos; they do not replace them.
