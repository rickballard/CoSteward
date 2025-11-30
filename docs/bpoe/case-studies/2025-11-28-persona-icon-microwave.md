# Persona icon micro-wave – GitHub hub profile

Date: 2025-11-28  
Branch: \$branch\

## Context

Tuned the persona badges on the GitHub hub profile (**rickballard**):

- Started from older SVG icons that did not render clearly at GitHub’s default size.
- Tried regex-based edits on \icons/persona-*.svg\ (size + stroke + background).
- GitHub began rendering placeholder tiles instead of the intended icons.
- Some experiments produced dark strokes on dark backgrounds or unreadable micro-icons.

Result: visual regressions plus confusion between “real icon” vs “GitHub placeholder for broken SVG”.

## What ultimately worked

1. **Restore from a known-good commit**

   - Used \git log -- icons/persona-*.svg\ to find the last stable persona icon baseline.
   - Created a short fix branch and restored only the persona SVGs from that commit:
     - \git checkout <goodCommit> -- icons/persona-*.svg\
   - Committed + merged that as a clean reset.

2. **Rebuild the icons as simple badge tiles**

   - Replaced the old SVGs with fresh, minimal icons:
     - 1 black rounded square background (\ect\).
     - Simple white strokes / dots / shapes for each persona.
   - This reduced the risk of malformed paths or tricky viewBox behavior.

3. **Size iteration**

   - Started small (18px), then bumped to **24px** and finally to **48px**:
     - GitHub seems to “cap” how large inline SVG icons really appear in README.
     - Visually, the 48px setting plus markdown spacing now feels right at a glance.

4. **Spacing after icons**

   - Increased spacing in \README.md\ so the persona icons breathe:
     - Ensured an extra space after sequences like:
       - \![Steward](icons/persona-steward.svg)  \
   - Net effect: cleaner separation between icon and label text.

## BPOE takeaways

- **Avoid blind regex surgery on SVG.**
  - It is easy to accidentally corrupt SVG structure when replacing attributes inline.
  - Prefer:
    - Rebuilding simple, well-formed SVGs, or
    - Editing one icon by hand, testing, then applying a controlled transform.

- **Use a known-good commit as baseline.**
  - When visual regressions appear, it is often faster and safer to:
    - Identify a “last known working” commit.
    - Restore only the affected files onto a fresh branch.
    - Then iterate from there.

- **Treat GitHub’s README renderer as a target environment.**
  - SVG behavior and apparent sizes are influenced by:
    - GitHub’s markdown rendering.
    - Dark/light mode.
  - Always verify a UI change in the actual GitHub preview, not just locally.

- **Prefer small, named branches for each micro-wave.**
  - Example branches used in this wave:
    - \docs/hub-persona-icons-rebuild-*\
    - \docs/hub-persona-icons-size24px-*\
    - \docs/hub-persona-icons-size48px-spacing-*\
  - This keeps each visual tweak:
    - Atomic,
    - Easy to review / revert,
    - Easy to document in CoBloat/CoSync logs.

- **Use branch-name merges when PR numbers are ambiguous.**
  - \gh pr merge <branchName> --squash --delete-branch\ avoids guessing PR numbers.
  - Especially useful when multiple icon PRs exist at once.

## Future patterns

- For other repos (CoSteward, CoAgent, CoArena, etc.) when tuning badges or micro-icons:
  - Start with simple SVGs using:
    - Solid background,
    - Minimal strokes,
    - One or two core shapes per persona/role.
  - Iterate sizes in small waves (e.g., 24px → 36px → 48px) and confirm in the target UI.
  - Capture a short “micro-wave note” when the final state feels right.

## CoBloat heartbeat for this wave

- CU: OK – Git history clean, micro-wave documented.
- PU: OK – Changes scoped to hub README + icons.
- HU: OK – Visual output now readable and on-brand.
- WT: SOFT – Small note, low overhead, but valuable trail for future stewards.
