---
title: CoSteward Ops Manual  -  Tiered Execution Addendum v0.1
epoch: 2025-11-10 21:00:43Z
status: draft
glyph: "♡"
---

# Tiered Execution & CoSync Clarification

This addendum clarifies **where** AI can act and **how** CoSync works across environments. It should be appended to `docs/ops/CoSteward.OpsManual.md` and linked from `docs/bpoe/INDEX.md`.

## 1) Execution Tiers

- **Tier‑1  -  Chat Orchestrator (cloud, sandboxed)**
  - Capabilities: plan, generate text/code, produce artifacts for download.
  - Limits: **no filesystem**, **no GitHub API**, **no PS7**, **no helpers**, **no web unless explicitly enabled**.
  - CoSync: **conceptual** only; requires **context injection** (paste/upload).

- **Tier‑2  -  Local CoAgent (your machine)**
  - Capabilities: PS7, helpers, Git, GH CLI, repo mounts, CI triggers.
  - CoSync: **read/write** against repos; runs CoBlocks and MegaWaves.

- **Tier‑3  -  CI (GitHub Actions)**
  - Capabilities: enforce policies (style/frontier/evolution guards), build, test.
  - CoSync: event‑driven; reacts to PRs/branches/labels.

- **Tier‑4  -  Observability (CoAudit/CoPrime)**
  - Capabilities: read‑only evaluation, audit deltas, surface frontier options.
  - CoSync: receives reports; **no final decisions**.

## 2) CoSync Across Tiers

- **Tier‑1 → Tier‑2**: Tier‑1 requests context; Tier‑2 supplies it (paste/upload or local fetch).
- **Tier‑2 → Tier‑3**: PR opened; CI validates with guards.
- **Tier‑3 → Tier‑4**: audit artifacts published internally; CoAudit/CoPrime review.
- **Decisions** always require human label (e.g., `human-select`).

## 3) Context Injection (Required for Tier‑1)

Tier‑1 cannot fetch repos. To “read” repos, **inject context** by:
- Uploading ZIPs or pasting files (markdown/yaml/scripts).
- Providing specific paths and snippets.
- Supplying logs or PR diffs.

Without context injection, Tier‑1 remains **concept-only**.

## 4) BPOE Policy Snippet

Add to `docs/bpoe/INDEX.md`:

```yaml
ai_tiers:
  - name: tier1_chat_orchestrator
    can: [plan, draft, generate, package]
    cannot: [filesystem, ps7, helpers, git, github_api, implicit_web]
    cosync: conceptual_only_requires_context_injection: true
  - name: tier2_local_coagent
    can: [ps7, helpers, git, github_cli, repo_reads_writes, run_coblocks]
    cosync: read_write
  - name: tier3_ci
    can: [enforce_guards, build, test]
  - name: tier4_observability
    can: [audit, measure, advise]
cosync_rules:
  tier1_context_injection_required: true
  decision_requires_human_label: human-select
  hp57_inherit_acls: true
```

## 5) CoCivia Defaults (excerpt)

- Authority: **advise‑only** by default; internal artifacts only; glyph **♡**.
- Access: inherit repo ACLs; exclude `**/HP57/**` by policy.
- Widen‑first: frontier ≥ 7 options; dissent quota ≥ 1; reversible‑first.
- Expression: dual‑track  -  song/poetic gibber + plain summary.
- Evolution cues (for later SAP‑1): entropy→tempo, coherence→melody, audit_pass→resolution, inclusion→stereo width.

## 6) Operator Checklist (CoSteward quick use)

1) Spawn local CoAgent (Tier‑2).  
2) Download zip artifacts from Tier‑1 if provided; unpack under target repos.  
3) Run **.CoVerify.ps1** and repo guards.  
4) Open short branches; create PRs with labels.  
5) Let CI (Tier‑3) enforce.  
6) Route outputs to CoAudit/CoPrime (Tier‑4).

---

**Footer**: Internal guidance only. ♡

