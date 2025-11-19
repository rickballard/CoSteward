# CoStatus line  -  scope, spec, and guardrails (for Co1)

Owner: Co1

Schema (one line in `docs/ops/costatus/SAMPLE.txt`):
CoStatus: [CU <OK|SOFT|HARD|FATAL>][PU <OK|SOFT|HARD|FATAL>][HU <OK|SOFT|HARD|FATAL>][WT <OK|SOFT|HARD|FATAL>]  T±hh:mm  Drift ±d  ███░░░░░  <context>

Regex:
^CoStatus:\s*\[CU\s+(OK|SOFT|HARD|FATAL)\]\[PU\s+(OK|SOFT|HARD|FATAL)\]\[HU\s+(OK|SOFT|HARD|FATAL)\]\[WT\s+(OK|SOFT|HARD|FATAL)\]\s+T[+\-]\d{2}:\d{2}\s+Drift\s+[+\-]?\d+\s+[█▓░]{8}(\s+.+)?$

Inputs: `docs/intent/sessions/<current>/plan.json` with waves_total, waves_done, start_utc, cadence_minutes, deadline_utc, branch, pr.

Policy, visuals, and drift logic: Co1 owns. Seed-stage CI is advisory; tighten post-seed.

