# CoSteward Desktop Workflow Layout (v1)

Generated: 20251206T154708Z

This screenshot shows one recommended CoSteward BPOE layout:

- Left: **MS Edge** with Co1 + other session tabs.
- Middle left: **PS1** (shared panel).
- Middle right: **PS2** (shared panel).
- Right: **Chrome** with Co2 + other session tabs.

> Tip: open this image at 100% zoom in your viewer to read the fine text
> and the Core Principles panel on the right.

![CoSteward desktop workflow layout](./assets/CoSteward_DesktopLayout_v1.png)

Future waves:

- Link this page from the Ops Manual overview and from CoBPOE_CoreRules_v1.
- Add annotations or callouts once the layout stabilises.

## Cross-platform setup (BPOE hint)

The intent of this layout is **four logical vertical panes**:

1. Left: MS Edge (Co1 + other session tabs).
2. Mid-left: PS1 (shared PS7 panel, multi-tab).
3. Mid-right: PS2 (shared PS7 panel, multi-tab).
4. Right: Chrome (Co2 + other session tabs).

Any local setup that achieves this behaviour is acceptable, but the
following are RECOMMENDED per platform.

### Windows (RECOMMENDED)

- Install the official \"PowerToys\" package from Microsoft.
- In PowerToys, enable **FancyZones**.
- Create a custom layout (for example called \CoSteward_4Pane\) with
  four vertical columns sized for:
  - Narrow Edge panel (left).
  - Two medium PS7 panels (center).
  - Narrow Chrome panel (right).
- Save the layout, then:
  - Assign Edge to the left zone.
  - Assign Windows Terminal / PS7 (PS1) to zone 2.
  - Assign Windows Terminal / PS7 (PS2) to zone 3.
  - Assign Chrome to the right zone.

This avoids manual drag/snap gaps and gives stewards a single Win+drag
gesture to restore the layout after reboots.

### macOS (RECOMMENDED)

- Install a tiling/snap tool such as **Rectangle**, **Amethyst**, or
  **BetterSnapTool**.
- Define a four-column layout (or keybindings) that lets you place:
  - Primary browser (Co1) left,
  - Two terminal windows in the center,
  - Secondary browser (Co2) right.
- Save these as presets so CoStewards can restore the layout in one or
  two keystrokes after login.

### Linux (RECOMMENDED)

- Prefer a tiling window manager (for example i3, sway, awesome) or
  tiling extensions for KDE/GNOME.
- Configure a workspace with four vertical tiles mapped to:
  Edge/Chromium (Co1), PS1, PS2, and Chrome/Firefox (Co2).
- Store the WM config in dotfiles so it can be reproduced or shared.

### Font & cursor (Windows Terminal example)

On Windows, CoSteward sessions SHOULD:

- Use a readable but compact font size in Windows Terminal.
- Use a **solid block cursor** with a bright colour (for example yellow)
  to remain visible at small sizes.
- Use a distinctive prompt colour for PS7 (for example yellow) so stewards
  can quickly recognise PS-mode panels.

Future waves can ship a Windows Terminal \settings.json\ snippet in this
handbook, but BPOE only requires that the above *behaviour* is achieved,
not any specific font family.

