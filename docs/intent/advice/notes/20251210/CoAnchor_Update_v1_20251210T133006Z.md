# CoAnchor update v1 (20251210T133006Z)

- Installed canonical CoAnchor_Quickstart_Thin.md at:
  - C:\Users\Chris\Documents\GitHub\CoSteward\docs\CoAnchor\CoAnchor_Quickstart_Thin.md

- Created tools/Update-CoAnchor.ps1 to push this file into other repos.
- Default target repos: CoSteward, CoIndex (extend TargetRepos array as needed).
- CoStart_Launch.ps1 now uses recursive search from CoSteward root to display a thin CoAnchor banner in new PS7 panels.

Next steps (recommended):
- Run:  .\tools\Update-CoAnchor.ps1
- Review git status and branch/PR per BPOE before merging to main.
