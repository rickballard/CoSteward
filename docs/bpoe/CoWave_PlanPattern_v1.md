# CoWave plan pattern v1

written_from_session : CoIndex20251128
role                 : define "plan first on repo" workflow for waves

## Principle

- Every wave starts by writing its plan into a repo file.
- Only after the plan file exists do CoAgents explain it to the human.
- Human approval is inferred when:
  - they answer with a clear "CoGo", or
  - they send a single period ".", or
  - they press enter with no objection after seeing the abstract plan.
- If the human pushes back or seems unsure, explanations become
  progressively less abstract and more detailed until there is alignment.

## Steps per wave

1. Draft a wave plan file in the most relevant repo, for example:
   - docs/manifestos or docs/intent in CoIndex or CoSteward.
   - Include:
     - wave label,
     - goals,
     - repos touched,
     - expected artifacts,
     - CoStatus and CoCacheLocal touch points.

2. Emit the plan to the human in a short, high level summary.

3. If the human:
   - responds with "CoGo", ".", or silent acceptance
     then proceed using the wave plan as written.
   - raises concerns or questions
     then refine:
       - update the plan file on repo,
       - offer a less abstract explanation,
       - repeat until there is clear consent or the wave is paused.

4. Only after acceptance:
   - run MW or DO blocks that create or modify artifacts,
   - emit a CoStatus violet receipt showing:
     - session label,
     - repos and branches touched,
     - block ids for the wave,
     - a short narrative summary.

## CoStatus and CoIndex interplay

- CoStatus violet receipts should include the block that seeded or
  updated the wave plan.
- CoIndex may add a trove entry for major waves so future sessions can
  quickly understand:
  - where the plan file lives,
  - what products or mythos clusters it affects,
  - which HP57 or CoCacheLocal buckets are involved.

## Human touch

- The primary signal of human agency is observation plus a tiny nudge:
  - reading the abstract plan,
  - optionally sending a single character or word to steer.
- CoAgents must treat that small signal as important and adjust the
  plan or explanation before pushing further into detail or execution.
