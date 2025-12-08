# Advisory: CoIndex CoGbx / CoGibber migration of legacy “CoPortal” rails

Session: CoIndex20251128  
UTC span: work performed into 2025-11-30T04:xxZ  
Actor: CoIndex session (via Rick)  
Status: First pass migration of CoIndex’s “CoPortal” rails to **CoGbx / CoGibber**

---

## Current working assumptions (for you to confirm / refine)

**Naming split**

- **CoGbx** = “boxes / registries / views”
  - The *surface* where AIs and humans browse catalogs, registries, index views, etc.
- **CoGibber** = “language / URIs / vocabularies”
  - The *protocol + notation* used between AIs (and AI-aware tools), including
    `gib://…` URIs and namespace vocab files.

Under this scheme:

- CoIndex hosts a **CoGbx registry**, expressed in **CoGibber**.
- CoIndex’s JSON now explicitly encodes that distinction.

**Policy proposal**

- The term **“CoPortal” is now legacy / deprecated** across the CoSuite:
  - No new rails, files, views, or schemas should use “CoPortal” as a live label.
  - It may continue to exist only as:
    - Historical references
    - Migration notes
    - Prior schema names preserved for lineage

You can treat this advisory as the initial “deprecation notice” for CoPortal
inside CoIndex and related registries.

---

## What changed in CoIndex (implemented already)

### 1. Registry JSON (still legacy filename, new schema)

**File (unchanged name for now):**

- `exports/pointees/CoIndex_CoPortal_RegistrySeed_v1.json`

**Internal fields (updated):**

- `schema_version`  
  - **was:** `CoPortalRegistry_v1`  
  - **now:** `CoGibberRegistry_v1`

- `schema_extensions`  
  - **now includes:**
    - `CoPortalRegistry_Gibber_v1`  *(legacy extension, retained for lineage)*
    - `CoGibberRegistry_v1`         *(new canonical extension)*

- `gibber` block:
  - `gibber.stub`
    - **was:** `gib://coportal/registry?v=1`
    - **now:** `gib://cogibber/registry?v=1`
  - `gibber.namespace`
    - **now:** `cogibber.registry`
  - `gibber.style`
    - **now:** `gibber-v1-seed` (unchanged, or set where absent)

- `ai` block:
  - `ai.registry_role`
    - **now:** `cogbx-pointee-registry`
  - `ai.usage_modes`
    - now includes: `co1-orchestrator`, `assistant`, `indexer`, `cogbx-view`
  - `ai.gibber_ready`
    - **now:** `true`

- `futures` and `evo`:
  - `futures.evolution_lane` = `"registry-seed"` (if not set)
  - `futures.allows_new_kinds` = `true`
  - `futures.allows_new_lenses` = `true`
  - `evo.lineage` = `["seed","registry"]` (if missing)
  - `evo.next_waves`
    - any `"coportal-view"` entries rewritten as `"cogbx-view"`
    - defaulted to `["vocabulary-harvest","cogbx-view","cross-repo-index"]`
      if none existed

### 2. Per-pointee overlays (CoGibber URIs + CoGbx surfaces)

All existing pointees in the registry were updated:

- `gib` URIs:

  - **was:** `gib://coportal/pointee/<id>`  
  - **now:** `gib://cogibber/pointee/<id>`

  For example:

  - `gib://cogibber/pointee/codream.hp.rails`
  - `gib://cogibber/pointee/cocachelocal.pointers`
  - `gib://cogibber/pointee/pilot.academia-shock`
  - `gib://cogibber/pointee/hp57.advicebomb.index.v1`

- `ai_profile.surfaces`:

  - Any `'coportal'` entries replaced with `'cogbx'`.
  - Surfaces now look like:
    - `["cogbx","assistant"]`
    - (or similar, depending on role/prio)

The rest of each pointee (id, category, repo_root, rel_path, tags, notes,
future_hooks) remains as in the alienized registry version.

### 3. Human-facing view (title and wording only)

**File (name unchanged for now):**

- `exports/views/CoPortal_View_v1.md`

**Internal wording updated to CoGbx / CoGibber:**

- Title:
  - **was:** `# CoIndex CoPortal v1 - Gibber registry view`
  - **now:** `# CoIndex CoGbx v1 - CoGibber registry view`

- Body text:
  - Phrases like:
    - “CoPortal registry view” → **“CoGbx registry view”**
    - “CoPortal view”          → **“CoGbx view”**
    - “CoPortal registry”      → **“CoGibber registry”**
  - Any “CoPortal / CoGbx / CoGibber” triad is softened to:
    - “CoGbx / CoGibber”

This means: the user-facing lens is now explicitly described as a **CoGbx view
over a CoGibber registry**, even though the file name is still legacy.

### 4. CoSync note

There is a CoSync note on-repo that still uses “CoPortal” *in a historical way*:

- `docs/intent/advice/notes/20251129/CoSync_CoIndex20251129_CoPortalView_20251130T042949Z.md`

It documents the earlier “CoPortal registry view and aliens v1” wave and the
later CoGibber renames now in effect. For now this is being treated as a **history
artifact**, not a forward naming standard.

---

## Registry contents snapshot (as of this migration)

The pointees present in the registry at this stage:

- `codream.hp.rails`  
  *CoDream vs HP / HP57 rails manifesto*  
  - Manifesto describing public CoDream vs commercial HP / HP57 rails and how
    CoIndex should treat each.

- `cocachelocal.pointers`  
  *CoCacheLocal buckets map*  
  - Describes NAS layout such as `Z:\_AdviceBombs` and `Z:\_HP57` buckets for
    HP57-aware helpers.

- `pilot.academia-shock`  
  *AcademiaShock pilot pointees*  
  - Seed pointees for the AcademiaShock non-truth index pilot.

- `hp57.advicebomb.index.v1`  
  *HP57 AdviceBomb content index v1*  
  - JSONL index over HP57 AdviceBomb transcript files (lives only under HP57
    storage, not in repos).

All now carry `gib://cogibber/pointee/...` URIs and `ai_profile.surfaces` with
`cogbx` instead of `coportal`.

---

## Additional policy notes for Co1

1. **“CoPortal” deprecation policy**

   - Treat “CoPortal” as **legacy**:
     - Allowed in historical docs, commit messages, and schema lineage.
     - Disallowed for:
       - New schema_version names
       - New AI roles
       - New file names
       - New domain-facing brands
   - Treat `CoGbx` and `CoGibber` as the canonical successors.

2. **Gib URIs pattern**

   - Proposed canonical pattern for registries:
     - `gib://cogibber/pointee/<id>`
   - Open design choice:
     - Keep this flat with namespace `cogibber.registry`, or
     - Move to `gib://cogibber/registry/pointee/<id>` later.

3. **Namespace strategy**

   - Current CoIndex namespace: `cogibber.registry`
   - Possible expansions:
     - `cogibber.registry.index`
     - `cogibber.registry.hp57`
     - `cogibber.registry.cocivium`

4. **Schema split: CoGbx vs CoGibber**

   - Current state:
     - `schema_version = "CoGibberRegistry_v1"`
   - Future option:
     - `schema_version = "CoGbxRegistry_v1"` (box structure)
     - `gibber_schema = "CoGibberOverlay_v1"` (language overlay)

5. **Legacy file names vs new names**

   - Currently:
     - `CoIndex_CoPortal_RegistrySeed_v1.json`
     - `CoPortal_View_v1.md`
   - Future wave may rename to:
     - `CoIndex_CoGbx_RegistrySeed_v1.json`
     - `CoGbx_View_v1.md`

6. **Cross-repo strategy**

   - Open design choice:
     - Single CoIndex-hosted CoGbx registry, or
     - Per-repo CoGbx registries harvested into a cross-repo CoIndex view.

7. **Domain usage (CoGbx / CoGibber)**

   - CoGbx: “box / view” surface (registries, demos).
   - CoGibber: language spec, URIs, vocabularies.

8. **Gibber vocab files**

   - Proposed:
     - `exports/gibber/cogibber.registry.v1.gib.json`
     - Optional human-facing Trove mirror.

9. **HP57 lane treatment**

   - Keep explicit HP57 pointer for now, but consider abstracting path
     behind HP57-only rails while CoIndex only knows “HP57 index exists”.

---

## Suggested next waves

- Naming cleanup across CoIndex (CoPortal → CoGbx / CoGibber).
- Cross-repo CoGbx view expansion.
- CoGibber vocab seed files.
- HP57 lane refinement so HP57 paths live only in HP57 rails.
