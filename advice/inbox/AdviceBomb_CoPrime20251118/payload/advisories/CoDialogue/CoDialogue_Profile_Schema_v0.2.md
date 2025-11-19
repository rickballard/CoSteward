# CoDialogue Profile Schema v0.2

```yaml
user:
  id: <uuid>
preferences:
  communication:
    clarity: true
    challenge_default: true
    tone: neutral
  workflows:
    repo_first: true
    zip_first: false
    ps7_blocks: true
nudges:
  active_rules:
    - rule_repo_first
    - rule_challenge_default
reality_grade:
  latest:
    clarity: 85
    evidence: 60
history:
  sessions:
    - session_id: abc123
      timestamp: 2025-11-18T12:00:00Z
      metrics:
        clarity: 70
        evidence: 55
```
