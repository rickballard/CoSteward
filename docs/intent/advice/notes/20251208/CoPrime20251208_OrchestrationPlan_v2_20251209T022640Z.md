# CoPrime20251208 – Co1 Orchestration Plan v2

UTS: 20251209T022640Z  
Session: CoPrime20251208 (Co1 successor)  

Prior Co1 is still handing off and may continue to add CoBus notices and intent
notes over multiple cycles. This plan is v2 and is expected to evolve as new
CoBus material lands on main.

## 1. Co1 Role + Tenure

- Co1 is the orchestration brain across CoSuite repos (not a single repo agent).
- Tenure rules:
  - Optimal: about 3 days; hard max: 4 days.
  - Co1 is responsible for planning its own rotation and writing a final CoSync note.
- Repo first:
  - All durable intent must land on GitHub (or explicit vault references).
  - Branch → PR → squash merge only; no direct writes to main.

## 2. Current Inputs (v2)

- Handoff note from prior Co1:
  - CoSteward docs/intent/advice/notes/*/CoSync_CoPrime20251208_Handoff_v1_*.md
- CoBus survey summary:
  - CoSteward docs/intent/advice/notes/*/CoPrime20251208_CoBusSurvey_Summary_v1_*.md
- CoSessionHygiene baseline:
  - CoIndex tools/ps7/Invoke-CoSessionHygiene_v1.ps1 (run as needed).
- Additional inputs expected:
  - New CoBus notices from prior Co1 as it finishes handoff.
  - Outreaches / CoVault advisories for GLU adjacent and stealth content.

## 3. High level phase plan (draft)

### Phase A – Stabilize and hygiene

- Keep main branches fast forwarded across key CoSuite repos.
- Normalise use of CoSessionHygiene:
  - Run before big waves and when CoFrontLagVector or CoWaveStall symptoms appear.
- Ensure CoFrontEnd stress and hygiene docs in CoSteward are discoverable and linked
  from CoIndex term clusters.

### Phase B – CoAgent browser shell MVP

- Read: docs/intent/browser-shell/CoAgent_BrowserShell_Design_v0_*.md
- Draft PS7 tooling for:
  - New session window orchestration (multiple CoSessions, clearly labelled).
  - Refresh session (safe manual refresh and tab close patterns).
- Keep any low level dethrottling experiments in vault only advisories
  (no raw tricks on GitHub).

### Phase C – Multi site constellation alignment

- Track multi site constellation seeded by the Sites session:
  - CoScendence, CoEvoTheory, CoPolitic, InSeed, Opename, GroupBuild, EntMent, BeAxa.
- For each site:
  - Confirm human facing site/index.html.
  - Confirm AI facing cogbx/site/index.html (CoGbx facade v1).
- Maintain stealth:
  - No central link leaks.
  - Only safe, context appropriate previews exposed.

### Phase D – GLU adjacent and vault aware work

- Treat GLUKEY and crown jewel material as vault resident.
- On repo guidance should only capture:
  - Patterns and operational hygiene.
  - Redacted references to vault artefacts.
  - Non sensitive framing around risk vectors such as browser behaviour.

## 4. Next actions for Co1 (short list)

1. Use the CoBus survey snapshot below as a map of recent notices.
2. Identify three to five high leverage CoBus threads for immediate action
   (browser shell, hygiene, multi site, GLU adjacent).
3. For each chosen thread:
   - Create a small named DO block script or note in the relevant repo.
   - Keep scopes narrow and PR ready.

## 5. CoBus survey snapshot (embedded)

---8<--- begin embedded CoBus survey (CoPrime20251208) ---8<---


---8<--- end embedded CoBus survey (CoPrime20251208) ---8<---

