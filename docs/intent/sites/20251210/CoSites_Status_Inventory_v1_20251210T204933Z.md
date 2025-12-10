# CoSites status inventory – v1

*UTC:* 20251210T204933Z

This file summarizes local repo state for the eight priority sites.

| Site | Repo path | Live index | Seed v3 backups | Legacy backups | Git remotes | Domain hint | Concurrency |
|------|-----------|-----------|-----------------|----------------|-------------|-------------|-------------|
| CoScendence | C:\Users\Chris\Documents\GitHub\CoScendence | site/index.html | index_seedv3_20251210T041501Z.html<br>index_seedv3_20251210T191314Z.html | index_legacy_20251210T025826Z.html | origin	https://github.com/rickballard/CoScendence.git (fetch)<br>origin	https://github.com/rickballard/CoScendence.git (push) | CoScendence.org / .com | single-session (this lane) |
| CoEvoTheory | C:\Users\Chris\Documents\GitHub\CoEvoTheory | site/index.html | index_seedv3_20251210T041507Z.html<br>index_seedv3_20251210T191316Z.html | index_legacy_20251210T025828Z.html | (none) | (local only; no remote yet) | single-session (this lane) |
| CoPolitic | C:\Users\Chris\Documents\GitHub\CoPolitic | site/index.html | index_seedv3_20251210T041510Z.html<br>index_seedv3_20251210T191317Z.html | index_legacy_20251210T025829Z.html | origin	https://github.com/rickballard/CoPolitic.git (fetch)<br>origin	https://github.com/rickballard/CoPolitic.git (push) | CoPolitic.org / .com | concurrent (dedicated session active) |
| InSeed | C:\Users\Chris\Documents\GitHub\InSeed | site/index.html | index_seedv3_20251210T041514Z.html<br>index_seedv3_20251210T191319Z.html | index_legacy_20251210T025833Z.html | origin	https://github.com/rickballard/InSeed.git (fetch)<br>origin	https://github.com/rickballard/InSeed.git (push) | InSeed.com | concurrent (dedicated session active) |
| Opename | C:\Users\Chris\Documents\GitHub\Opename | site/index.html | index_seedv3_20251210T041524Z.html<br>index_seedv3_20251210T191321Z.html | index_legacy_20251210T025835Z.html | origin	https://github.com/rickballard/Opename.git (fetch)<br>origin	https://github.com/rickballard/Opename.git (push) | Opename.org / .com | single-session (this lane) |
| GroupBuild | C:\Users\Chris\Documents\GitHub\GroupBuild | site/index.html | index_seedv3_20251210T041532Z.html<br>index_seedv3_20251210T191324Z.html | index_legacy_20251210T025838Z.html | origin	https://github.com/rickballard/GroupBuild.git (fetch)<br>origin	https://github.com/rickballard/GroupBuild.git (push) | GroupBuild.org | concurrent (dedicated session active) |
| EntMent | C:\Users\Chris\Documents\GitHub\EntMent | site/index.html | index_seedv3_20251210T041538Z.html<br>index_seedv3_20251210T191328Z.html | index_legacy_20251210T025842Z.html | origin	https://github.com/rickballard/EntMent.git (fetch)<br>origin	https://github.com/rickballard/EntMent.git (push) | EntMent.org / .com | single-session (this lane) |
| BeAxa | C:\Users\Chris\Documents\GitHub\BeAxa | site/index.html | index_seedv3_20251210T041540Z.html<br>index_seedv3_20251210T191329Z.html | index_legacy_20251210T025847Z.html | origin	https://github.com/rickballard/BeAxa.git (fetch)<br>origin	https://github.com/rickballard/BeAxa.git (push) | BeAxa.org / .com | single-session (this lane) |

## CoScendence / CoSets / CoGBx intent (seed stub)

- CoScendence will eventually surface a catalogue of **CoSets** (standard sets) used across the CoCivium constellation.
- Those CoSets should be indexed and versioned via CoIndex / CoGBx rather than hard-coded into the site.
- This inventory file is the anchor for a future DO block that will:
  - read canonical CoSets metadata from CoIndex / CoGBx; and
  - regenerate a standards section on the CoScendence site from that source of truth.

_Future sessions (CoSites / CoScendence lanes) should treat this stub as the starting spec for that linkage, not as the implementation._
