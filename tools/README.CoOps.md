# CoOps.psm1 (helper aggregator)

Use these in DO blocks and CI instead of calling raw scripts:

```powershell
Import-Module ./tools/CoOps.psm1

Invoke-InboxGuard             # runs advice/inbox/.CoVerify.ps1 if present
Invoke-VerifyCoTips           # wraps tools/Verify-CoTips.ps1
Get-Rulesets -Name "seed-mode (main)"
Upsert-Ruleset  -TemplatePath docs/ops/policies/rulesets/seed-mode.main.json
Backup-Rulesets -OutDir docs/ops/policies/rulesets/_snapshots
Principle: compose existing helpers; repo stays the source of truth.


