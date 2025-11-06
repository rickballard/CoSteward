

## BPOE: Prefer existing helpers; evolve before you add {#bpoe-helper-evolution}

**Why**  
Fragmented one-off scripts drift. A single aggregation layer keeps behavior consistent across sessions, CI, and DO blocks.

**Do this**  
- Import the repo’s helper module (e.g., `tools/CoOps.psm1`) and call `Invoke-*` / `*-Rulesets` functions.  
- If a helper *almost* does what you need, evolve it in-place (add a parameter / fallback) instead of creating a new script.  
- If you must add a new helper, wire it into the aggregation module and docs in the same PR.

**Guardrails**  
- PRs that add standalone scripts **must** also:  
  1) export them via the aggregation module,  
  2) add a minimal CoTip example, and  
  3) reference them in CI from the module, not directly.

**CoSync**  
Every session that touches helpers:  
- `git switch main && git pull --ff-only`  
- run the inbox guard (`advice/inbox/.CoVerify.ps1`) if present  
- leave a CoSync note with paths + PR links

**Review checklist**  
- [ ] Calls go through `CoOps.psm1` (or designated aggregator)  
- [ ] No duplicate helper for an existing capability  
- [ ] Any new helper is exported + documented + used by CI  
- [ ] CoSync note added

