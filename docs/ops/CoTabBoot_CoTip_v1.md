# CoTabBoot CoTip v1

CoTabBoot is a lightweight browser tab reset pattern for laggy AI sessions.
It is part of CoSessionHygiene alongside SessionPurge and CoReload.

## Why CoTabBoot exists

- CoSteward and CoAgent workflows drive very heavy DOM and memory patterns.
- Multi panel layouts, long transcripts, and large code blocks stress legacy browsers.
- When a tab carrying an AI session gets sticky, slow, or fails to render updates,
  a full browser or system reboot is overkill. CoTabBoot provides a smaller reset.

CoTabBoot tries to refresh the tab level event loop and memory state while keeping
the conversation alive by using the browser's "reopen last closed tab" feature.

## Canonical CoTabBoot sequence (keyboard driven)

With the laggy AI tab in focus:

1. Close the current tab:
   - On Windows: press Ctrl+W.
   - On macOS: press Cmd+W.
2. Immediately reopen the last closed tab in the same window:
   - On Windows: press Ctrl+Shift+T.
   - On macOS: press Cmd+Shift+T.

If the browser behaves, the same chat session should reappear in a fresh tab instance
with slightly different internal state. Often this is enough to clear subtle lag.

## Safety notes and failure modes

- Make sure the correct tab has focus before pressing Ctrl+W or Cmd+W.
- Do not close the entire window unless you are comfortable restoring it.
- Some browsers or corporate builds may disable Ctrl+Shift+T or session restore.
- If the tab does not restore cleanly, fall back to SessionPurge + CoReload patterns.

CoTabBoot is not a guarantee. It is a fast, low friction attempt to refresh a
single working context without restarting the whole browser or machine.

## Relation to CoSessionHygiene

CoTabBoot sits between "do nothing" and "restart everything":

- **Lightweight:** Single tab reset using keyboard shortcuts.
- **Medium:** Run SessionPurgePrep and act on its guidance.
- **Heavy:** Use CoReloadRunner guidance plus new sessions and CoSync notes.

When CoBloat heartbeat reports SOFT or early HARD in HU or WT, CoTabBoot is often a
reasonable first move before heavier disruption.

## Documentation references

- CoSteward Ops Manual: link this CoTip as the primary CoTabBoot definition.
- User Guides: include simplified CoTabBoot instructions for regular contributors.
- GIBIndex: record CoTabBoot as a CoTerm pointing back to this document.

_Seeded by CoSteward_CoTabBoot_Docs_v2.ps1 at UTS 
20251210T023411Z
_.