# CoBPOE – Browser Behaviour For Heavy CoWork (v1)

Status: CoStaged_v1  
LastUpdatedUTS: 20251206T183728Z  

---

## 1. Intent

This note captures Best Practice Operating Environment (BPOE) guidance for
web browsers used for heavy CoCivium / CoSuite work, especially ChatGPT
and multi-tab workflows.

Main goals:

- reduce browser memory pressure during long CoWaves  
- keep download links alive long enough to CoLand assets cleanly  
- give future stewards a baseline for debugging CoBadLand behaviour

---

## 2. Chrome memory guidance

For any Chrome shortcut used for CoCivium / CoSuite / ChatGPT work:

- Prefer launching Chrome with:

  --max_old_space_size=4096

- Set this in the shortcut "Target" or via scripted "Arguments" updates.
- There is no clean global setting that forces this for every possible
  chrome.exe invocation, so the practical BPOE is:

  - patch the shortcuts that are actually used for CoWork,
  - use those for CoWork sessions,
  - avoid launching Chrome for CoWork from unpatched paths.

This is a performance and stability hint, not a guarantee.

---

## 3. CoGoodLand vs CoBadLand link behaviour

Empirical observations from CoSteward operations:

- Some sandbox download links expire very quickly.  
- Some links remain valid for many minutes, especially if the tab remains
  open and in focus.  
- Links in tabs that are not in focus sometimes stay valid much longer.

Operational heuristics:

- Provide **duplicate download links** at both the **top** and **bottom**
  of each MegaWave output, with the second set clearly labelled as
  duplicates.  
- This increases the chance that at least one link is still live when the
  user scrolls back or returns from a short distraction.
- When CoBadLand link failures occur, prefer regenerating the asset
  rather than reusing a possibly stale link.

Future work:

- instrument and log how long typical links stay alive  
- explore browser and tab-state patterns that maximise CoGoodLand windows

---

## 4. Session habits for CoStewards

Recommended CoSteward behaviour:

- Keep a **dedicated browser profile or shortcut** for CoCivium work.  
- Close obviously stale tabs between MegaWaves to reduce confusion.  
- When a link fails:
  - treat that as a data point for CoBPOE evolution, not as user error  
  - note time since generation, tab state, and rough memory usage

---

## 5. BPOE TODOs

Future CoBPOE browser tasks:

- cross-repo note in CoIndex / CoCache with the same core guidance  
- optional scripts to discover actual chrome.exe paths in use  
- documentation of behaviour for other browsers (Edge, Brave, etc.)

---

<!--
CoIntentCloud v1
CoRole: CoBPOE_Browser
CoSeed: CoBPOE_Browser_v1
CoAssetAmbitions:
  - "Capture real-world CoGoodLand vs CoBadLand browser behaviour."
  - "Give future sessions a stable baseline for browser tuning."
CoCTA:
  - "Use this as the default browser guidance for heavy CoSuite / ChatGPT work."
GIBindexKeys:
  - "CoBPOE_Browser"
  - "CoGoodLand"
  - "CoBadLand"
Status: CoStaged_v1
LastUpdatedUTS: 20251206T183728Z
-->