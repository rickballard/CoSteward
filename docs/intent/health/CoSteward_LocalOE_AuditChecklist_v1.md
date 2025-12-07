# CoSteward Local OE Audit Checklist

Purpose: help Co1 and CoStewards verify that local workstations match the
documented Best Practice Operating Environment.

## 1. Core Tools

- [ ] PowerShell 7 installed and used as primary shell
- [ ] Git installed and on PATH
- [ ] winget installed and usable for installs and upgrades
- [ ] PowerToys installed and enabled

## 2. PowerToys Configuration

- [ ] FancyZones enabled
- [ ] 4 column layout \CoSteward_4VPanel\ configured:
  - Zone 1: PS7 for Session Group A
  - Zone 2: Chat session A
  - Zone 3: Chat session B
  - Zone 4: PS7 for Session Group B
- [ ] Advanced Paste enabled
- [ ] OpenAI integration enabled for clipboard transformations (if desired)

## 3. OpenAI and Secrets

- [ ] OPENAI_API_KEY set at User environment level
- [ ] Key also configured in PowerToys AI settings (if used)
- [ ] No secrets committed to repos
- [ ] Any AI usage limits monitored in OpenAI dashboard

## 4. Scripts and Automation

- [ ] \scripts/Invoke-CoStewardOE-Bootstrap.ps1\ present and working
- [ ] \scripts/Get-CoStewardLocalOEInventory.ps1\ present and working
- [ ] DO blocks for CoSteward maintenance follow BPOE rules
- [ ] Local OE inventory report captured occasionally for Co1 review

## 5. Documentation Alignment

- [ ] \docs/intent/operations/CoSteward_OE_PowerToys4VPanel_v1.md\ up to date
- [ ] CoContrib onramps reflect difference between:
  - CoSteward OE
  - Contributor OE (lighter)
- [ ] CoBus advisories capture any major OE changes

Use this checklist when:

- setting up a new CoSteward workstation
- making significant OE changes
- performing periodic BPOE audits for Co1
