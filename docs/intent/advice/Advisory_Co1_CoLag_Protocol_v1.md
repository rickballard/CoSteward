# Advisory: Co1 Lag Protocol – Use CoLag Before Session Handoff (v1)

## Context

This advisory tells Co1 (and any successor sessions) how to treat lag complaints:

- Do **not** assume that perceived slowness means the session is too old.
- Use the **CoLag** helper in the CoSteward repo to classify lag first.
- Only recommend a full session handoff when CoLag says the problem is the chat itself.

CoLag lives at:

- `helpers/CoLag/CoLag_Run_v1.ps1`
- `helpers/CoLag/CoOE_TabBloat_QuickCheck_v1.ps1`
- `helpers/CoLag/helper.manifest.yml`
- Design: `docs/intent/CoLag/CoLag_Design_v1.md`

## CoLag classifications

CoLag currently emits three coarse classes:

- `CoLag-Chat`  
  - Lag is likely tied to this specific ChatGPT conversation.
- `CoLag-OE`  
  - Lag is likely related to local operating environment / browser tab bloat.
- `CoLag-Net/Platform-or-Other`  
  - Lag may be related to network or platform behavior, not just this chat or local OE.

Example datapoint (2025-12-03, SessionId=Co1):

- Classification: `CoLag-OE`
- BrowserRAMMB: ~10905 MB
- BrowserCount: 37

This suggests heavy browser/tab load, not a “Co1 is too old” issue.

## Protocol for Co1 when lag is reported

When the human reports lag (or Co1 detects slow interaction):

1. **Ask the human to run CoLag locally**

   - PS7 on the CoSteward host:

     ```powershell
     cd "$HOME\Documents\GitHub\CoSteward"
     .\helpers\CoLag\CoLag_Run_v1.ps1 -SessionId 'Co1'
     ```

   - The script will ask whether lag is only in this chat (Y/N), run an OE snapshot, and write an advisory:

     - `C:\Users\Chris\Documents\CoLagLogs\CoLag_Advisory_Co1_<UTC>.md`

2. **Request the classification**

   - Co1 should ask the human to share the CoLag classification:
     - `CoLag-Chat`
     - `CoLag-OE`
     - `CoLag-Net/Platform-or-Other`

3. **Follow the branch based on classification**

   - **If `CoLag-Chat`:**
     - Treat this as chat-age / conversation bloat.
     - Recommend:
       - Summarise the session into a compact handoff note (intent, state, active tasks).
       - Start a fresh session seeded with that summary.
     - Do **not** blame local OE.

   - **If `CoLag-OE`:**
     - Treat lag as an OE / browser issue.
     - Recommend:
       - Close heavy/unused tabs and even whole browser instances.
       - Restart a preferred browser with minimal tabs (e.g. Co1 + essentials only).
       - Consider a dedicated clean browser profile for CoSuite work.
     - Co1 should **not** recommend session termination purely because of age.

   - **If `CoLag-Net/Platform-or-Other`:**
     - Treat lag as a network or platform phenomenon.
     - Recommend:
       - Testing from a clean browser profile or alternate browser.
       - Checking network (Wi-Fi, VPN, filters, etc.).
       - If persistent across devices and networks, preparing a minimal reproducible description and timestamps for a platform report.

## Expectations for Co1 and future sessions

- Co1 should treat **CoLag as the canonical lag helper**.
- When lag is discussed:
  - First step: ask for a CoLag run and classification.
  - Second step: apply the protocol above.
- Only when **CoLag-Chat** is returned should Co1 recommend a new CoSession purely on the basis of lag.

---

## Transparency Footer

**Asset name:** Advisory_Co1_CoLag_Protocol_v1  
**Context:** CoCivium / CoSuite / CoSteward / Co1

**Intent options:**

- Instruct Co1 to use CoLag before recommending session handoff due to lag.
- Reduce unnecessary loss of long-running, high-value CoSessions.
- Tie lag diagnosis to repo-based helpers and local OE metrics.

**Ambitions:**

- Make lag handling repeatable and transparent across sessions.
- Accumulate CoLag advisories as a source of data for CoAudit / CoIndex.
- Tighten BPOE guidance for browsers, tabs, and profiles used in CoSuite workflows.

**Evolutionary pressure vectors / CTAs:**

- As more CoLag advisories are created:
  - Derive better thresholds and patterns for lag causes.
  - Inform future CoOE sentinels and watcher automation.
- Encourage future sessions to:
  - Extend CoLag’s logic rather than re-invent ad-hoc lag handling.
  - Keep CoLag’s manifest and design documents up to date with each iteration.
