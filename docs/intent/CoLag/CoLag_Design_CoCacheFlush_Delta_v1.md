# CoLag Design Delta: CoCacheFlush Pattern (v1)

_This file is a suggested delta/snippet to merge into
`docs/intent/CoLag/CoLag_Design_v1.md` in CoSteward._

## New subsection: CoCacheFlush (browser cache / tab hygiene)

Add under the OE-related guidance:

### CoCacheFlush (browser cache / tab hygiene)

In practice, many "laggy session" reports turn out to be **browser and tab
bloat issues**, not model or conversation-age problems.

CoLag should treat **CoCacheFlush** as a named pattern:

- Situation:
  - Multiple heavy sessions all feel slow.
  - Browser RAM usage and tab counts are high.
  - A browser restart + cache clear dramatically improves responsiveness.
- Classification:
  - CoLag will typically return `CoLag-OE`.
- Recommended remediation:
  - reduce the number of open tabs/windows
  - restart the browser
  - perform a cache/cookie clear for the CoSuite profile if needed
  - consider a dedicated, "clean" browser profile for CoSuite work

CoLag scripts MAY:

- Ask a simple question such as:
  - "When did you last restart your browser or clear cache for this profile?"
- Surface a gentle **CoNag** when:
  - repeated `CoLag-OE` events occur without a recent CoCacheFlush-style hygiene.

Reference: see GIBindex term **CoCacheFlush**.

