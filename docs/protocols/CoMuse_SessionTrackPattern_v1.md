# CoMuse – session ideation stack pattern (v1)

UTS seed: 20251127T181110Z

## 1. Purpose

CoMuse is a light-weight way for a session to keep track of:

- major directional changes;
- the list of active and parked threads in a dialogue;
- the main artefact that is being evolved for each thread.

It is intended to reduce drift and “forgotten middle” ideas by giving each thread a name, status and a working asset.

## 2. CoMuse list format (markdown table)

For now, CoMuse can be expressed as a table in any session note, e.g.:

\\\markdown
### CoMuse – session tracks

| ID  | Title                                      | Status  | ScopeTags                        | Asset                                   | Notes                          |
|-----|--------------------------------------------|---------|----------------------------------|-----------------------------------------|--------------------------------|
| T01 | Seismic CoSource / CoIndex / CoPortal      | active  | CoIndex, CoSource, CoPortal      | CoCache/advice/inbox/AdviceBomb_...    | Next: seed ProtoCoIndexHelper |
| T02 | CoWindow / CoStatus / CoBloat metrics      | active  | CoSteward, CoCivia, CoWindow     | CoSteward/docs/status/CoWindow_*.md    | Draft baseline schema         |
| T03 | CoVoice / CoGlyph / CoSource naming        | parked  | GIBindex, CoVoice, CoGlyph       | GIBindex/docs/terms/CoVoice_v1.md      | Await GIBindex wave           |
| T04 | CoRace / CoSweep insight couplets          | parked  | CoTheories, CoRace, CoSweep      | CoTheories/docs/insights/CoRace_*.md   | Seed theory/practice folders  |
\\\

Recommended statuses:

- \ctive\ – this session should keep nudging this thread forward.
- \paused\ – temporarily on hold, but still in scope soon.
- \parked\ – acknowledged, but waiting for another repo/session to lead.
- \done\ – completed enough for now (there may be future versions).

## 3. CoMuse and wave numbers

A session may also include wave numbers in IDs, for example:

- \[63 of 315] ::: DO Block ::: ...\

This can be mirrored in CoMuse, e.g.:

- ID \W63\ with a note:
  - “See PS7 DO block [63 of 315] in transcript; this track is about X.”

This helps humans mirror audio memory tricks:
- say the wave number while copying,
- say “and” between copy and paste,
- let CoMuse act as the written rail snapshot.

## 4. CoMuse and working assets

Each CoMuse row should point at exactly one “front runner” asset, usually:

- a CoGlyph (front asset for an asset-set); or
- an AdviceBomb note; or
- a draft markdown file that is meant to become a CoGlyph.

This makes it easy for AIs and humans to know:

- “If I only have time for one artefact on this track, read this.”

## 5. Suggested usage

Short term:

- CoPrime and CoSteward sessions maintain a CoMuse section in:
  - CoSync notes; or
  - AdviceBomb notes; or
  - dedicated CoMuse session logs.

Longer term:

- CoAgent panels may show CoMuse as a live UI component.
- CoPortals may include CoMuse summaries in AI-facing mirrors.
- CoWindow metrics may incorporate:
  - number of active tracks;
  - duration and churn per track;
  - density of “done” threads vs. parked ones.

## 6. Evolution notes

This is a v1 pattern only.

Later versions may:

- define a JSON schema for CoMuse;
- integrate with CoSessionRegistry and CoBus;
- attach CoMuse entries to CoSource records for specific Co* concepts.
