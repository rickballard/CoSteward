# CoSync note – CoGo navigation + profile wiring

UTC timestamp: 20251128T042139Z

This CoSync captures wiring of the common CoSuite navigation helpers:

- Updated: tools/CoGo.ps1 (central CoSuite repo registry and Go-Co helpers)
- Updated: $PROFILE to dot source CoGo.ps1 on shell startup

Pointers:

- CoGo script: tools/CoGo.ps1
- Loader snippet lives in: C:\Users\Chris\Documents\PowerShell\Microsoft.PowerShell_profile.ps1

This session ensures that future PS7 shells can use:

- Go-CoSteward, Go-CoCache, Go-CoAgent, Go-CoCivium, Go-CoArena, Go-RickPublic
- Go-Co -Name '<RepoKey>' for any registered repo
