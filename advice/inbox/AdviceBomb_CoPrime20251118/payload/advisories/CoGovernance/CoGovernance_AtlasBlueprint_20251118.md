# CoCivium Governance Atlas  -  Blueprint

Origin-Session: CoCivia20251118 / CoCivium governance discussion
Intended-For: CoPrime20251118 (a.k.a. Co1)
Version: 2025-11-18

## 1. Purpose

This document describes how to construct a **Governance Atlas**:

- A cross-repo index of principles, rules, processes, role specs,
  and decisions.
- A bridge between human-readable docs and machine-readable JSON.
- A safer place to reason about power, norms, titles, and
  arbitration without creating new “crowns”.

The Atlas is an index, not a new cathedral. It points at canonical
sources (existing files across repos) and adds:

- stable IDs,
- hashes,
- status (draft/active/superseded),
- precedence metadata, and
- basic schemas.


## 2. Recommended home and structure

Suggested canonical home repository: **CoCache** (or another
“shared infrastructure” repo).

Suggested structure:

```text
docs/governance/atlas/
  README.md            # high-level explanation and usage
  ATLAS_TOC.md         # human-oriented table of contents
  ATLAS_INDEX.json     # machine-readable index of all items
  schemas/
    atlas-item.schema.json
    atlas-index.schema.json
  registry/
    P001_no-crowns.json
    PR007_consent-checks.json
    R014_sortition-panel.json
    PR021_safety-pause.json
    RO002_costeward.json
    INS_power-caps_THEORY.json
    INS_power-caps_PRACTICE.json
    ... more items ...
```


## 3. Taxonomy

Each atlas item has a **kind** and a **level**.

**Kinds**
- `principle`  -  enduring values that guide everything else.
- `law`        -  hard rules with explicit enforcement paths.
- `rule`       -  more specific constraints, often under a law.
- `standard`   -  repeatable quality bars or data/format standards.
- `process`    -  stepwise procedures and playbooks.
- `role`       -  scoped responsibilities and expectations.
- `guide`      -  advisory content, non-binding.
- `compact`    -  agreements with other communities/institutions.
- `decision`   -  recorded outcomes (e.g., sortition panel verdicts).

**Levels** (soft precedence)
- principle
- law
- rule
- standard
- process
- guide
- role
- decision

In case of conflict:
1. Higher **level** wins over lower.
2. An **active** item beats a draft or deprecated one.
3. An item that explicitly **supersedes** another wins over it.
4. If still tied, the one with narrower scope for the context wins.


## 4. Item schema (conceptual)

This is *not* code, just a conceptual schema that can be converted
to JSON Schema and PS7 validators.

```text
id            : string      # unique atlas ID (e.g., P001, PR007)
kind          : enum        # principle, rule, process, etc.
level         : enum        # one of the precedence levels
title         : string
summary       : string
source.repo   : string      # e.g., "CoCivium"
source.path   : string      # e.g., "docs/BPOE.md"
source.ref    : string      # git ref, "main" or commit SHA
status        : enum        # draft, active, deprecated, superseded
scope         : string      # e.g., "CoCivium-wide", "CoAgent only"
effective     : date        # ISO date when it took effect
expires       : date?       # optional expiry date
supersedes    : [string]    # IDs of items it supersedes
superseded_by : string?     # ID of item that supersedes this one
tags          : [string]
hash          : string      # e.g., sha256:...
receipts      : [string]    # PR IDs, CoSync notes, etc.
evidence      : [string]    # decisions, tests, logs
```


## 5. Example registry entries (non-executable)

Example: **No crowns principle**

```text
id: P001
kind: principle
level: principle
title: "No crowns"
summary: "Titles are tools, not thrones. Authority is granted per-initiative and time-boxed."
source: { repo: "CoCivium", path: "docs/BPOE.md", ref: "main" }
status: active
scope: "CoCivium-wide"
tags: ["authority", "roles", "consent"]
hash: "sha256:<fill-with-real-hash>"
receipts:
  - "PR#<id>"
  - "docs/intent/advice/notes/YYYYMMDD/CoSync_<stamp>.md"
```


## 6. Relationship to Insight Pairs

The Atlas should register *Insight Pairs* (THEORY + PRACTICE) as
first-class items.

Example IDs:
- `INS_power-caps_THEORY`
- `INS_power-caps_PRACTICE`

Each such item points to:
- a markdown file in `insights/governance/<topic-id>/THEORY.md` or
  `PRACTICE.md` in a source repo, and
- evidence and receipts (tests, decisions, CoSync notes).

The Atlas itself stays small and aggregative; the heavy thinking
lives in the insight pair files.


## 7. CI / automation sketch

Minimal, non-binding suggestion for Co1:

- Job: `Build Governance Atlas`
- Trigger: on changes to `docs/**` or the `atlas` directory.
- Steps:
  1. Validate all `registry/*.json` against `atlas-item` schema.
  2. Rebuild `ATLAS_INDEX.json` from those entries.
  3. Rebuild `ATLAS_TOC.md` with a simple markdown outline.
  4. If anything in `docs/governance/atlas` changed:
     - commit and push (for bot accounts), or
     - fail the job and ask a human to review the diff.


## 8. Weaknesses and evolution intents

**Weaknesses / constraints**
- The Atlas can fall out of sync with sources if updates happen only
  in the underlying repos and the index is not refreshed.
- Too many IDs or a noisy taxonomy may confuse new contributors.
- If the Atlas feels “canonical” in the social sense, people may
  hesitate to challenge outdated principles.

**Evolutionary intents**
- Keep the Atlas **small and curated**: only list items that are
  actually used or likely to be referenced by others.
- Use automation aggressively: regenerate hashes, TOC, and indexes
  via CI, not by hand.
- Include explicit “how to challenge this item” links in Atlas
  entries to invite evolution.


## 9. How Co1 can use this

When Co1 ingests this file, it can:

- Stand up an initial `docs/governance/atlas/` tree using the
  suggested structure and basic schemas.
- Seed the registry with a small set of high-value entries:
  BPOE core, power caps, safety pause, consent checks, CoSteward.
- Add a single lightweight CI job to validate registry entries and
  rebuild the TOC.
- Treat this blueprint as a starting point, not a hard spec: future
  Insight Pairs can refine and extend it as CoCivium evolves.

