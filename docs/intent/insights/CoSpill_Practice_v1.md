# CoSpill – Practice (v1)

Generated: 20251207T120514Z

## Intent

Offer practical guardrails and patterns so that:

- Accidental CoSpill is caught early and made harmless.
- Tactical CoSpill becomes a deliberate, documented tool.

## Quick checklist (for stewards)

- Before pasting a CoPingable:
  - Check the PS7 panel label (PS1 vs PS2).
  - Check the `$PWD` repo path.
  - Run `pwd` or look at the prompt to confirm context.
- Ensure each DO block has:
  - A clear session label and repo expectation at the top.
  - A cheap CoSpill guard that warns on mismatched repos.

## Sample CoSpill guard pattern

Embed this near the top of any DO block that expects a specific repo:

```powershell
$expectedRepo = Join-Path $HOME 'Documents\GitHub\CoSteward'
$actualRepo   = (Get-Location).Path

if ($actualRepo -ne $expectedRepo) {
    Write-Warning "CoSpill guard: expected '$expectedRepo' but you are at '$actualRepo'."
    Write-Warning "If this CoPing was pasted into the wrong PS7 panel, press Ctrl+C now."
    Read-Host 'Press Enter to continue anyway'
}
This does not block advanced users, but it makes accidental CoSpill very loud.

Tactical CoSpill patterns

Examples:

Spill note to future session:

Write a markdown note under docs/intent/advice/notes/YYYYMMDD
in CoSteward.

Mention the future session label and repo explicitly.

Treat the note as a "soft handoff" that Co1 or CoPrime can route.

Local-only secret spill:

Use a local-only folder (for example a LAN-only CoCiviumAdmin path)
instead of a repo when dealing with crown-jewel assets.

Clearly mark these notes as LOCAL_ONLY and reference them from
public handoff docs without including the sensitive payload.

Open work

CoSpill runbook for Co1 / CoPrime, including how to detect patterns
of repeated accidental CoSpill.

GIBindex entries for CoSpill and related CoTerms (CoSpill-Accidental,
CoSpill-Tactical, CoSpill-Channel).

Session metrics that flag unusual cross-repo or cross-session activity.
