# PS7 Prompting Standard

Goals: zero-friction paste, ENTER-safe, clear why-questions, re-run hints.

Checklist
- Show defaults up front (RepoPath, SiteRoot, Out).
- If a non-default is critical, explain why and state the risk of using the default.
- On missing paths, do not mutate anything. Print a single re-run template line.
- Always end with a tiny summary and CoBloat heartbeat.

Example blurb to show users:
This run uses defaults automatically. If they are wrong, nothing is changed; you will see a one-line command to re-run with your paths.
