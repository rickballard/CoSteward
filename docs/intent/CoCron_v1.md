# CoCron v1 – Recurring job list (human-run, CI-ready)

Role: Track recurring jobs across CoSuite before they are fully automated.

| Job ID     | Frequency | Owner     | Description                                      | Triggered via         | Outputs to            |
|------------|-----------|-----------|--------------------------------------------------|-----------------------|------------------------|
| CoCron_01  | weekly    | CoPrime   | Sweep CoBus_Events for stale tracks              | PS7 manual checklist  | CoMuse table, CoStatus |
| CoCron_02  | monthly   | CoSteward | Update CoSessionRegistry from CoSync notes       | PS7 or CI later       | CoSteward/CoSessionReg |
| CoCron_03  | monthly   | CoIndex   | Review ProtoCoIndexHelper entries for coverage   | CoIndex helper script | GIBindex, CoPortals    |

Implementation:
- Start by treating this as a human-run checklist.
- Later, map entries to PS7 DO-blocks and CI workflows.
