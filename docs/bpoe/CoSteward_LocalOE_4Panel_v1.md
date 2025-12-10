# CoSteward local OE reference layout (four panel CoTabBoot grid) v1

The reference local BPOE layout for CoSteward uses a four panel grid driven by PowerToys FancyZones.
The goal is to keep CoAgents, browsers, and shells predictable and easy to CoTabBoot when sessions get heavy.

![CoSteward local OE four panel layout](img/CoSteward_LocalOE_4Panel_v1.png)

## Panel layout

- Top left: primary browser 1 (usually Chrome) for ChatGPT and CoSuite web artefacts.
- Bottom left: PS7 shell aligned with browser 1 for CoSteward, CoCache and related repos.
- Top right: secondary browser 2 (usually Edge) for parallel sessions, research, and overflow CoAgents.
- Bottom right: PS7 or CMD shell aligned with browser 2 for CoContrib, CoIndex and project specific work.

Panels are locked to this grid with PowerToys FancyWindows / FancyZones so that window moves are cheap and repeatable.

## CoTabBoot and DOM hygiene

- Browsers can accumulate heavy DOM state over time.
- Use the following pattern as a local CoTabBoot:
  - Ctrl+W closes the current tab.
  - Ctrl+Shift+T reopens the last closed tab with a fresh DOM.
- Apply this whenever a tab feels sluggish, visual glitches appear, or CoBloat signals are rising.

Retirement rule:

- Sessions live three to four days at most.
- Three days is preferred.
- Past four days is treated as a bloat risk and the session should hand off via CoSync and be retired.

## Shell visibility and vibe

- Command prompts use a yellow foreground colour so PS7 and CMD shells are visually distinct at a glance.
- The cursor is set to the largest available size to make focus obvious when moving quickly in CoSprint mode.
- PS7 output uses “microprint” font sizing:
  - Vibe coders see a scrolling pulse trail instead of full teaching content.
  - Focus is on motion and non red output as a health signal.
  - Deep inspection is still possible when needed by zooming in or opening files in an editor.

## BPOE intent

- This layout is not mandatory for all contributors, but it is the reference configuration for CoSteward.
- Other layouts should preserve the same ideas:
  - Clear pairing between browsers and shells.
  - Fast CoTabBoot paths for heavy tabs.
  - Visual cues for focus and health (colour, cursor size, scrolling pulse).
- When capturing new screenshots for local OE, update this section and replace the reference image so the repo stays the source of truth.
