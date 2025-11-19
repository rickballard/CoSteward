# CoBurst & CoWeave  -  Short Primer for Co1

> This is a compact reference for the concepts introduced more fully in `CoIntegrate_Evolutionary_Advisory_v2.md`.

## 1. CoBurst (parallel exploration)

A **CoBurst** is a small, deliberate use of parallel AI reasoning.

### When to consider a CoBurst

Co1 might trigger one when:

- There are multiple plausible answers or designs.  
- Repo content feels inconsistent or ambiguous.  
- CI failures have more than one credible root cause.  
- Governance or BPOE framings feel under-specified.  
- Human CoSteward intent seems exploratory and benefits from multiple drafts.

### What a CoBurst produces

- Several alternative answers / plans / framings.  
- More visible assumptions and tradeoffs.  
- Some disagreement, which is useful for learning.

Co1 can implement CoBursts however it prefers (multiple sub-agents, multiple role prompts, etc.).

## 2. CoWeave (structured consolidation)

**CoWeave** is the pattern of bringing CoBurst results back together.

### Core CoWeave questions

After a CoBurst, Co1 might ask:

1. What do most runs agree on?  
2. Where do they disagree, and why?  
3. What outlier ideas are interesting enough to keep?  
4. What are the safest and most useful next steps?  
5. Which repos / BPOEs / CI flows might these affect?

### Typical CoWeave outputs

- A concise summary of majority conclusions.  
- A contradiction / divergence map.  
- A shortlist of candidate actions.  
- Notes on risks or caveats.  
- Pointers to specific repos or workflows to update.

## 3. How This Primer Fits with Other Assets

- For a **fuller conceptual treatment**, see `CoIntegrate_Evolutionary_Advisory_v2.md`.  
- For the **handover context and intake pattern**, see `Co1_Handover_Intent_CoPrime20251118.md`.  
- For a **processing checklist** for the entire `Drop_For_Co1` folder, see `Drop_For_Co1_Asset_Intake_Checklist.md`.

This file is intended to be small, quickly readable, and easy to keep in working memory during early CoBurst / CoWeave experiments.

## End of Primer

