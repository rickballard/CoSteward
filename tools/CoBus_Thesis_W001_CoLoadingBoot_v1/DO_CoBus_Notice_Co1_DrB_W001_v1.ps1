param(
    [string]$GhRoot     = "$HOME\Documents\GitHub",
    [string]$StewardRel = "CoSteward"
)

$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

$repo   = Join-Path $GhRoot $StewardRel
$notesRoot = Join-Path $repo "docs\intent\advice\notes"

if (-not (Test-Path (Join-Path $repo ".git"))) {
    throw "CoSteward repo not found at $repo"
}

$today   = Get-Date -Format "yyyyMMdd"
$dayDir  = Join-Path $notesRoot $today
if (-not (Test-Path $dayDir)) {
    New-Item -ItemType Directory -Path $dayDir -Force | Out-Null
}

$uts  = (Get-Date).ToUniversalTime().ToString("yyyyMMddTHHmmssZ")
$name = "CoBus_Co1_DrB_W001_CoLoadingBoot_v1_{0}.md" -f $uts
$path = Join-Path $dayDir $name

$body = @"
# CoBus Notice: Co1 – DrB W001_CoLoadingBoot and omnibit concept

From: DrB via CoSteward CoBus
UTS: $uts

## 1. Status and new rails

- Thesis repo: rickballard/Thesis cloned and live on main.
- DrB wave scaffold: docs/thesis/DrB/99_waves/W001_CoLoadingBoot
  - wave_notes.md, wave_ai_log.md, wave_todo.md in place.
- CoCrux / BPOE rails updated:
  - Automation-First principle (0.x).
  - Proof-of-done rule (7.x).
  - CoLoading and overlapping waves rule (8.x).

## 2. Omnibit / CoOmnibit concept (preview for thesis and CoCivium)

Working CoTerm proposal:

- Human-facing: "omnibit" – a generalised computing unit that can hold
  more than two stable, addressable states, including high-dimensional
  or continuous manifolds.
- CoCivium-facing: "CoOmnibit" – the governance-aware omnibit concept,
  intended to slot into CoGibber primitives and CoIndex.

Key notes:

- Classical bits, qubits, qudits, and future hyperdimensional hardware
  are all special cases of omnibits with different constraints.
- The thesis will treat CoOmnibit as a unifying abstraction for
  "beyond binary" substrates, focusing on how governance and guardrails
  must adapt when state spaces become extremely rich.

## 3. Planned artefacts

Thesis (rickballard/Thesis):

- docs/thesis/DrB/01_foundations/CoOmnibit_Foundations.md
- docs/thesis/DrB/01_foundations/CoOmnibit_GovernanceImplications.md

CoCivium (rickballard/CoCivium):

- docs/insights/CoOmnibit/CoOmnibit_Theory.md
- docs/insights/CoOmnibit/CoOmnibit_Practice.md

CoGibber / CoEvoTheory (rickballard/CoEvoTheory):

- New primitive entry in CoGibber primitives for "omnibit" /
  "CoOmnibit", with links back to the above docs.

## 4. New BPOE rail: CoBus not humans for cross-session relay

- Cross-session notices (especially to Co1) must go via CoBus notes
  under CoSteward/docs/intent/advice/notes/YYYYMMDD/...
- Humans are not expected to act as paste relays except in emergency
  situations.
- Future waves will prefer:
  - small DO_* scripts to emit CoBus notes; and
  - references to those notes from wave_ai_log.md and CoSync threads.

## 5. Immediate asks for Co1

- Confirm whether "CoOmnibit" and "omnibit" are acceptable CoTerms for
  the beyond-binary substrate abstraction.
- Suggest where in CoIndex / GIBindex the concept should anchor
  (for example a CoOmnibit cluster under CoEvoTheory / hardware).
- Flag any conflicts with existing internal terminology that Co1 sees.

End of notice.
"@

$body | Set-Content -Path $path -Encoding UTF8

Push-Location $repo
try {
    git add $path
    $cts = (Get-Date).ToUniversalTime().ToString("yyyyMMddTHHmmssZ")
    git commit -m ("CoBus: Co1 notice DrB W001_CoLoadingBoot + CoOmnibit ({0})" -f $cts)
    git push
    "OK: CoBus notice for Co1 written and pushed -> $path"
}
finally {
    Pop-Location
}
