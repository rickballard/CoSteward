# CoSteward Local OE: PowerToys 4VPanel Layout

## Purpose

Give CoStewards a standard 4-column desktop layout that keeps:
- PS7 panels on the edges for command and logs.
- Active chat sessions in the middle for CoSessions.

This is a recommended Best Practice Operating Environment pattern for local workstations.

## Layout (4VPanel)

Tooling: PowerToys → FancyZones → custom layout `CoSteward_4VPanel`

Columns (left to right):

1. **Zone 1 (Outer Left)**
   - PS7 panel for Session Group A
   - Typical tabs: repo A, CoSync scripts, DO blocks

2. **Zone 2 (Inner Left)**
   - Browser: Chat session A

3. **Zone 3 (Inner Right)**
   - Browser: Chat session B

4. **Zone 4 (Outer Right)**
   - PS7 panel for Session Group B
   - Typical tabs: repo B, test harness, logs for Session B

## Activation Notes

- PowerToys FancyZones enabled.
- Layout Editor: select `CoSteward_4VPanel` as default for the primary monitor.
- Hold `Shift` while dragging windows to snap into zones.
- Optional: enable "Override Windows Snap shortcut" so `Win+Arrow` moves windows between the 4 zones.

## BPOE Status

- Category: Local OE augmentation
- Status: Recommended for CoStewards with dual PS7 + dual-chat workflows
- Source of truth remains the repos; this layout exists to reduce friction and context switching.
