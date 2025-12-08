# CoBus Advisory: CoSteward Local OE Audit Required

## Intent

Notify Co1 that the active CoSteward local operating environment (OE) on Rick's workstation
includes tools and helpers that are not yet fully documented in CoSteward or CoContrib.

This advisory asks Co1 to:

- Audit the local OE
- Update CoSteward and CoContrib docs
- Align CoBPOE with the current real-world setup

## Context

Recent changes on Rick's workstation include:

- PowerToys installed via winget (current version near 0.96.1)
- FancyZones in use with a 4 column layout \CoSteward_4VPanel\
- Advanced Paste with OpenAI key configured for clipboard AI
- OPENAI_API_KEY now set at the User environment level
- PS7 used as primary shell with multiple helper scripts and DO blocks
- winget used for install and upgrade flows

CoSteward already documents some of this, including:

- \docs/intent/operations/CoSteward_OE_PowerToys4VPanel_v1.md\
- \scripts/Invoke-CoStewardOE-Bootstrap.ps1\

However, there is no single source of truth that lists all local tools, helpers, and hotkeys
that a CoSteward is expected to have.

## Observed Gaps

- CoSteward OE docs do not yet enumerate:
  - winget as a required or recommended tool
  - PowerToys as a standard OE dependency
  - Advanced Paste AI behaviour and its relationship to the OpenAI key
  - The presence of local helper scripts beyond what is visible in the repo
- CoContrib onboarding does not yet clearly separate:
  - Full CoSteward OE expectations
  - Lighter Contributor OE expectations

## Recommended Actions for Co1

1. **Run the local OE inventory script**

   Ask Rick to run:

   \\\powershell
   cd "C:\Users\Chris\Documents\GitHub\CoSteward"
   .\scripts\Get-CoStewardLocalOEInventory.ps1 | Tee-Object -FilePath ".\docs/intent/health/CoSteward_LocalOE_InventoryReport_20251207T220604Z.txt"
   \\\

   Or let Co1 evolve a similar pattern. The goal is to capture a snapshot of:

   - Installed versions of PowerShell, winget, PowerToys, git
   - Presence of OPENAI_API_KEY and related env vars
   - Basic OS and edition info

2. **Update CoSteward OE docs**

   - Expand \CoSteward_OE_PowerToys4VPanel_v1.md\ to mention:
     - winget as an installation path
     - Advanced Paste with AI and clipboard behaviour
   - Add references to the OE inventory script and audit checklist.

3. **Update CoContrib onboarding**

   - Add explicit distinction between:
     - CoSteward OE (full, with PowerToys and AI integration)
     - Contributor OE (lighter, no AI requirement)

4. **Add a CoBus rule**

   - Any time Rick upgrades or adds a significant local tool
     (for example new PS7 modules, shell helpers, or desktop utilities),
     there should be:
     - a CoBus advisory file
     - a pointer to any updated OE inventory report
     - a follow up change in CoSteward and CoContrib docs

## Files Created by This Advisory

This DO block also created:

- \$advisoryRel\ (this file)
- \$inventoryRel\ (local OE inventory script)
- \$checklistRel\ (CoSteward Local OE Audit Checklist)

Co1 can evolve these assets and link them into CoBPOE and CoContrib as needed.
