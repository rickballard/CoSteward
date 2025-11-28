# CoStatus Session Health Spec v1

Role: Describe how we think about session health, bloat, and rotation.

Axes (examples):
- CU (cognitive load / complexity)
- PU (prompt / token usage)
- HU (human fatigue / confusion)
- WT (wall-time / calendar age)

Tiers:
- OK    : all axes within comfortable bounds.
- SOFT  : early signs of bloat; consider planning a successor session.
- HARD  : frequent truncation, confusion, or repeated context loss.
- FATAL : session is unreliable; must rotate to a new CoPrime.

Checklist (draft):
- Has this session run for more than N days?
- Are we seeing "conversation too long" or truncation symptoms?
- Do we struggle to remember what was decided without re-reading notes?
- Are we repeating the same planning steps without shipping?

Next steps:
- Log perceived tier for CoPrime20251128 periodically.
- Use notes to design a future automated CoStatus meter.
