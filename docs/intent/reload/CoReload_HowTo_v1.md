# CoReload HOWTO (v1)

Generated: 20251208T105322Z

## Purpose

CoReload is the minimal, evidence-based recovery channel for ChatGPT sessions.

It exists because sessions:
- forget unpredictably
- compress concept-clouds
- lose attachment history
- mis-associate context across waves

CoReload solves this by:
- snapshotting attachments into repo
- indexing them
- giving sessions a reliable, repo-driven memory anchor

## When to run CoReload

Run a CoReload cycle when:
- session memory feels 'thin' or drifty
- large amounts of advisory files have entered a session
- attachments refuse to upload due to model memory saturation
- ChatGPT begins contradicting earlier repo truth

## What CoReload does, step-by-step

1. Reads all attachments dragged into the active session.
2. Copies them into the repo under /attachments.
3. Generates a JSON snapshot under 	ools/CoReload/snapshots/.
4. Generates an index under docs/intent/reload/.
5. Optionally triggers CoStatus to measure bloat and health.

## Why this matters

- Session memory is not safe storage.
- Repo is the single source of truth.
- CoReload preserves *all session inputs* in a portable, stable way.

## After running CoReload

Stewards SHOULD:
- git add the new snapshot + index
- git commit the reload wave
- continue the orchestration from repo, not session-memory

## Future extensions (seed)

- Tag snapshots by session-label (Co1, Outreaches, CoIndex, etc.)
- Auto-build a reload dashboard in CoSteward
- Cross-link snapshot hashes with CoAudit and CoProtect
- Auto-merge reload events into CoBus traces

This HOWTO is intentionally simple: keep the reload pathway robust.

---
END OF FILE
