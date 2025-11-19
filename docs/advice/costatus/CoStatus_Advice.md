# CoStatus  -  contract, gates, and enforcement (render-agnostic)

**This doc is the session-agnostic contract.** Co1 owns the render; this defines stable fields & gate logic for all sessions.

## Fields (JSONL per cycle)
- \	s\ (UTC ISO8601), \health\, \cu\, \pu\, \hu\, \wt\ ∈ {OK,SOFT,HARD,FATAL}
- \drift_pct\ (signed int), \gate\ priority: rules > review > checks > conflicts > draft > none
- \pr_ref\ (optional), \ci\ ∈ {green,red,none}, \epos\ (int), \queue\ (int), \hint\ (short action)

## Machine line (append JSONL)
Example:
\\\json
{"ts":"2025-11-13T00:00:00Z","health":"OK","cu":"OK","pu":"OK","hu":"OK","wt":"OK","drift_pct":-6,"gate":"none","pr_ref":"","ci":"green","repos":4,"queue":0,"hint":" - "}
\\\

## Enforceability
- Every cycle emits **both**: human CoStatus line **and** JSONL append at \docs/ops/status/STATUS.log.jsonl\.
- Lint fails if:
  - latest JSONL older than latest session-artifact commit,
  - \gate != none\ **and** \hint\ is empty,
  - \drift_pct\ magnitude increases across 3 consecutive entries.

## Interop
- Field names & gate order are **immutable**; render is free.

