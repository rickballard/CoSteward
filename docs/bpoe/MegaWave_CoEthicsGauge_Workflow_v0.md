# BPOE — MegaWave + CoEthicsGauge Workflow Patterns (v0)

- **Session label:** CoEThicsGauge
- **Date (local):** 2025-11-16

This note captures patterns and gotchas observed while wiring up **CoEthicsGauge v0**
and the **Academia Shock** linkage during this session.

---

## 1. PS7 panel + MegaWave countdown

### 1.1 Session panel launcher pattern

- Use a **dedicated PS7 panel per session**; label the tab with the session name prefix (e.g. `CoET…`).
- Standard header:

```pwsh
$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

function UTS { (Get-Date).ToUniversalTime().ToString('yyyyMMddTHHmmssZ') }

function Invoke-MegaWaveCountdown {
  param(
    [int]$Total = 5,
    [int]$Current
  )
  if (-not $Current -or $Current -lt 1 -or $Current -gt $Total) {
    Write-Host "MW: please pass -Current 1..$Total" -ForegroundColor Yellow
    return
  }
  $remaining = $Total - $Current
  Write-Host ("MW{0}/{1} · remaining:{2}" -f $Current,$Total,$remaining) -ForegroundColor Cyan
}
Invoke-MegaWaveCountdown -Total 5 -Current <n>
# DO — MW<n>: <mission>
git -C $RepoRoot checkout `
  docs/CoEthicsGauge-wave3-metricslog-20251115T041148Z -- `
  docs/CoEthicsGauge/CoEthicsLog/ENTRY_TEMPLATE_v0.json `
  docs/CoEthicsGauge/CoEthicsKit/METRICS_LIBRARY_v1.md

git -C $RepoRoot checkout `
  docs/CoEthicsGauge-wave4-entryschema-20251115T043732Z -- `
  docs/CoEthicsGauge/CoEthicsLog/ENTRY_SCHEMA_v0.json `
  docs/CoEthicsGauge/CoEthicsLog/ENTRY_AUTHORING_v0.md
Get-Content $entryPath -Raw | Test-Json -SchemaFile $schemaPath
& 'tools/CoEthicsGauge/New-CoEthicsLogEntry.ps1' `
  -RepoRoot    $RepoRoot `
  -BrandId     'demo-brand' `
  -BrandName   'Demo Brand' `
  -Sector      'example-sector' `
  -RegionCode  'US-federal' `
  -LensId      'CoEthicsLens.DemocracyFirst.US2025' `
  -LensVersion 'v1'

& 'tools/CoEthicsGauge/Test-CoEthicsLogEntries.ps1' -RepoRoot $RepoRoot
& 'tools/CoEthicsGauge/Export-CoEthicsDashboardSnapshot.ps1' -RepoRoot $RepoRoot
Treat the snapshot as a read model for dashboards (Academia Shock, later CoArena/CoAgent).

5. Linkage stub as a first-class artifact

Linkage doc: CoCivium/docs/academia-shock/CoEthicsGauge_Linkage_v0.md

Pattern:

For any “paper ↔ kit” relationship (like Academia Shock ↔ CoEthicsGauge), create a linkage doc that:

Lists relevant branches and paths,

Explains the conceptual contract,

Leaves deeper modeling for later Waves.
