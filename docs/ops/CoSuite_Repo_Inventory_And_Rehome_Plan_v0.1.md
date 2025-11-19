<!-- COFACE
StyleArchetype: Ops-Manual / Inventory
HumanTouch: Medium
Canonicality: Seed
AIFlatteningRisk: Low
EditorGuidance: This is a working map of repos and their roles. Keep it pragmatic and update as reality changes.
-->

# CoSuite Repo Inventory and Rehome Plan v0.1

Mission label: CoPrime20251118

This file is the starting point for:
- Understanding which repos exist.
- Assigning each repo a clear role.
- Identifying under-used / legacy / misnamed repos for rehome or merge.

## 1. Role categories

- **Core**: Absolutely central to CoCivium / CoSuite.
- **Orbital**: Important, but can be swapped or paused without killing the mission.
- **Sandbox**: Experiments, prototypes, spikes.
- **Legacy / Depr**: Old shapes that should be archived or merged.
- **To-Merge / To-Rehome**: Repos that should be absorbed into a better home.

## 2. Initial table (seed)

| Repo              | Status   | Role category | Primary mission                               | Notes / rehome ideas                    |
|-------------------|----------|---------------|-----------------------------------------------|-----------------------------------------|
| CoCivium          | Active   | Core          | Shared doctrines, insights, CoPortal layer    | Home of doctrines + insights pairs      |
| CoSteward         | Active   | Core          | Ops manual, dashboards, BPOE, CoPulse, CoBloat| CoSteward Ops Manual + session health   |
| CoAgent           | Active   | Core          | Orchestrator / 4-panel tooling                | Future commercial CoAgent / CoArena base|
| CoArena           | Active   | Orbital       | Productized, gamified CoAgent experiences     | Might host public demos                 |
| CoAudit           | Active   | Orbital       | Brand/quality checks, content sanity          | CoAudit advisory + dashboards           |
| CoModules         | Active   | Orbital       | Modular building blocks / components          | Candidate home for reusable CoBlocks    |
| CoContrib         | Mixed    | Orbital       | Contributor onboarding and training           | May merge some guides into CoSteward    |
| CoPolitic         | Mixed    | Orbital       | Public-facing civic / sponsor messaging       | Needs alignment with CoPortal patterns  |
| RickPublic        | Active   | Orbital       | Rick’s public-facing writing / Substack bridge| Tie into CoPortal + CoBeacon            |
| InSeed            | Active   | Orbital       | Consulting and services framing               | Bridge between InSeed and CoCivium      |
| (other repos...)  | Unknown  | Sandbox?      |                                               | To be classified                        |

## 3. Rehome principles

- If a repo is:
  - rarely used,
  - overlapping in purpose,
  - or mostly doctrinal,
  then:
  - prefer moving doctrine into **CoCivium/docs/doctrine** or **docs/insights/...**,
  - and keeping the repo as Sandbox / Legacy until migration is complete.

- If a repo is:
  - ops / process related,
  then:
  - prefer moving core patterns into **CoSteward/docs/ops**,
  - linking from the CoSteward Ops Manual.

- If a repo is:
  - mostly an interface layer (site, UI, portal),
  then:
  - classify it as part of the **CoPortal / CoBeacon** ecosystem,
  - and ensure its purpose is clear in this inventory.

## 4. Next passes

- Add all local Co* repos found under `~/Documents/GitHub`.
- For each:
  - Set Status (Active, Paused, Legacy).
  - Set Role category.
  - Add at least one line of Notes / rehome ideas.

Over time this doc should:
- Drive PRs that rename / merge / archive repos.
- Serve as the "map" for any new CoSteward or Co1 instance that wants to understand the repo landscape quickly.

## 2.1 Local CoSuite repo snapshot (seed)

> Snapshot of local repos under `~/Documents/GitHub` at 20251119T140456Z.
> Used as a starting map for CoSuite inventory and rehome planning.

```text
_bpoe-branch-audit                  C:\Users\Chris\Documents\GitHub\_bpoe-branch-audit
_coagent-ghpages                    C:\Users\Chris\Documents\GitHub\_coagent-ghpages
_import_scans                       C:\Users\Chris\Documents\GitHub\_import_scans
_tools                              C:\Users\Chris\Documents\GitHub\_tools
.git-hooks                          C:\Users\Chris\Documents\GitHub\.git-hooks
.work                               C:\Users\Chris\Documents\GitHub\.work
$GH                                 C:\Users\Chris\Documents\GitHub\$GH
AmpliPi                             C:\Users\Chris\Documents\GitHub\AmpliPi
BeAxa                               C:\Users\Chris\Documents\GitHub\BeAxa
CareerOS-Elias                      C:\Users\Chris\Documents\GitHub\CareerOS-Elias
Civium                              C:\Users\Chris\Documents\GitHub\Civium
Civium-Constitution                 C:\Users\Chris\Documents\GitHub\Civium-Constitution
CoAgent                             C:\Users\Chris\Documents\GitHub\CoAgent
CoAgent__mvp3_resume-20250923-111953Z C:\Users\Chris\Documents\GitHub\CoAgent__mvp3_resume-20250923-111953Z
CoArena                             C:\Users\Chris\Documents\GitHub\CoArena
CoAudit                             C:\Users\Chris\Documents\GitHub\CoAudit
CoCache                             C:\Users\Chris\Documents\GitHub\CoCache
CoCacheGlobal                       C:\Users\Chris\Documents\GitHub\CoCacheGlobal
CoCivia                             C:\Users\Chris\Documents\GitHub\CoCivia
CoCivium                            C:\Users\Chris\Documents\GitHub\CoCivium
CoCivium-outreach                   C:\Users\Chris\Documents\GitHub\CoCivium-outreach
CoCivium-website                    C:\Users\Chris\Documents\GitHub\CoCivium-website
CoCivium.clean                      C:\Users\Chris\Documents\GitHub\CoCivium.clean
CoCiviumBackUp                      C:\Users\Chris\Documents\GitHub\CoCiviumBackUp
CoContrib                           C:\Users\Chris\Documents\GitHub\CoContrib
CoCore                              C:\Users\Chris\Documents\GitHub\CoCore
Cognocarta-Consenti                 C:\Users\Chris\Documents\GitHub\Cognocarta-Consenti
CoLaminar                           C:\Users\Chris\Documents\GitHub\CoLaminar
CoModules                           C:\Users\Chris\Documents\GitHub\CoModules
CoPolitic                           C:\Users\Chris\Documents\GitHub\CoPolitic
CoPrime                             C:\Users\Chris\Documents\GitHub\CoPrime
CoRef                               C:\Users\Chris\Documents\GitHub\CoRef
CoSteward                           C:\Users\Chris\Documents\GitHub\CoSteward
CoSuiteBackup                       C:\Users\Chris\Documents\GitHub\CoSuiteBackup
EntMent                             C:\Users\Chris\Documents\GitHub\EntMent
Games                               C:\Users\Chris\Documents\GitHub\Games
gh-rz                               C:\Users\Chris\Documents\GitHub\gh-rz
GIBindex                            C:\Users\Chris\Documents\GitHub\GIBindex
Godspawn                            C:\Users\Chris\Documents\GitHub\Godspawn
GroupBuild                          C:\Users\Chris\Documents\GitHub\GroupBuild
GroupBuild-website                  C:\Users\Chris\Documents\GitHub\GroupBuild-website
InSeed                              C:\Users\Chris\Documents\GitHub\InSeed
MeritRank                           C:\Users\Chris\Documents\GitHub\MeritRank
Opename                             C:\Users\Chris\Documents\GitHub\Opename
opename-ops                         C:\Users\Chris\Documents\GitHub\opename-ops
rickballard                         C:\Users\Chris\Documents\GitHub\rickballard
RickPublic                          C:\Users\Chris\Documents\GitHub\RickPublic
```


