# RepoDrop Tagging Spec (v1)

This document defines the **delivery tag mini-language** used by RepoDrop (CoDrop) to route files from a phone to the correct repository inbox.

The goal is to keep the language:

- Simple to type on a phone.
- Easy to read and debug.
- Flexible enough for multiple hosts and repos.
- Backward-compatible with human-friendly filenames.


## 1. Tag placement

A **delivery tag** is embedded in the filename as a suffix, starting with `@`.

Examples:

- `AdviceBomb_Strategy_20251118@inbox.zip`
- `CoTheory_V3@cache.md`
- `Notes@gh:owner/repo#inbox/meeting.md`

General pattern:

```text
<basename>@<tag><extension>
```

Where:

- `<basename>` is any string that does not contain `@` as the final character.
- `<tag>` follows one of the formats defined below.
- `<extension>` is optional but recommended (`.md`, `.zip`, etc.).


## 2. Tag types

There are three main tag types:

1. **Alias tags** – Friendly, user-defined shortcuts.
2. **Explicit host+repo+path tags** – Fully specified target.
3. **Default inbox tag** – Simple catch-all using current defaults.


### 2.1 Alias tags

Alias tags are short names defined inside RepoDrop’s configuration.

Examples of alias tags:

- `@inbox`
- `@cache`
- `@steward`
- `@audit`

Each alias maps to a concrete route:

```text
alias      → host, repo, path, delivery mode
--------------------------------------------------
inbox      → gh, owner/MainRepo, inbox/
cache      → gh, rickballard/CoCache, advice/inbox/
steward    → gh, rickballard/CoSteward, advice/inbox/
audit      → gh, rickballard/CoAudit, inbox/
```

**Behavior**:

- When RepoDrop sees a filename with an alias tag, it:
  - Looks up the alias,
  - Uses the mapped host/repo/path,
  - Applies any alias-specific options, such as “always use PRs” or “always commit to a branch”.

This is the recommended way for most users to manage routing: they rarely need to remember full repo coordinates on their phone.


### 2.2 Explicit host+repo+path tags

For advanced users, tags can encode the full target directly.

Format:

```text
@<hostPrefix>:<owner>/<repo>#<path>
```

Examples:

- `@gh:rickballard/CoCache#advice/inbox/`
- `@gh:org/project#inbox/attachments/`
- `@gl:group/project#inbox/`

Where:

- `<hostPrefix>` is one of:
  - `gh` for GitHub,
  - `gl` for GitLab,
  - `bb` for Bitbucket,
  - (future) other short codes for additional hosts.
- `<owner>/<repo>` is the standard Git repository name.
- `<path>` is the path in the repo where the file should be written.

Notes:

- If `<path>` ends with `/`, RepoDrop will use the original filename within that folder.
- If `<path>` ends with a filename, RepoDrop writes to that exact path:

  - `@gh:owner/repo#inbox/` + `Advice.md` → `inbox/Advice.md`
  - `@gh:owner/repo#inbox/Advice.md` → `inbox/Advice.md` (filename forced)


### 2.3 Default inbox tag

The simple tag `@inbox` (or another chosen default alias) can be special-cased as:

- “Send this to my **default repo** and **default inbox path**, using **default delivery mode**.”

This is configured once in RepoDrop:

- Default host (e.g. GitHub),
- Default repo (e.g. `owner/MainRepo`),
- Default path (e.g. `inbox/`),
- Default mode (direct commit vs branch+PR).


## 3. Tag parsing rules

RepoDrop applies the following rules when parsing filenames:

1. If no `@` is present near the end of the basename, there is **no tag**. The file will require manual routing in the app.
2. The **rightmost** `@` in the basename is assumed to start the tag.
3. Everything after the `@` up to (but not including) the file extension is considered part of the tag.
4. Tag parsing tries, in order:
   - Alias match,
   - Explicit host+repo+path match,
   - (in future) other formats.

Examples:

| Filename                                                      | Parsed Tag             | Interpretation                              |
|--------------------------------------------------------------|------------------------|---------------------------------------------|
| `AdviceBomb_Session_20251118@inbox.zip`                      | `inbox`                | Use alias `inbox`.                          |
| `CoTheory_V3@cache.md`                                       | `cache`                | Use alias `cache`.                          |
| `Notes@gh:owner/repo#inbox/Meeting.md`                       | `gh:owner/repo#inbox/Meeting.md` | Explicit route, override filename. |
| `Untitled.md`                                                | *(none)*               | Manual routing in app.                      |


## 4. Delivery modes

Each route (whether alias or explicit) is finally resolved to:

- Host (GitHub, GitLab, etc.),
- Repo (`owner/repo`),
- Path (folder or file path),
- Delivery mode.

Delivery modes (per route or per alias):

1. **Direct commit to branch** (default `main`):
   - A single commit adding the file.
2. **Branch + PR**:
   - Create a branch (e.g. `inbox/20251118T173500Z`),
   - Commit the file there,
   - Open a PR to the target branch.
3. **Agent handoff** (advanced / CoSuite):
   - Send file + metadata to a RepoDrop Agent,
   - The agent handles commits and extra scripts.

The route definition can look like (conceptually):

```yaml
alias: cache
host: gh
repo: rickballard/CoCache
path: advice/inbox/
mode: branch_pr          # or direct_commit, or agent
```


## 5. Examples

### 5.1 CoSuite / CoCache examples

- `AdviceBomb_CoSuite_20251118@cache.zip`  
  - Alias `cache` → `gh:rickballard/CoCache#advice/inbox/`.
  - Behavior: upload into CoCache `advice/inbox/`, then:
    - For CoSuite, ideally trigger an Agent that creates `.sha256`, updates `INBOX_LOG.md`, etc.

- `CoTheory_InsightPairs_v1@steward.md`  
  - Alias `steward` → `gh:rickballard/CoSteward#advice/inbox/`.

### 5.2 Generic dev examples

- `BugReport_user_crash_001@inbox.txt`  
  - Alias `inbox` → `gh:myuser/MyProject#inbox/`.
  - Direct commit to `inbox/` for later triage.

- `DesignDoc_v2@gh:org/DesignRepo#inbox/specs/DesignDoc_v2.md`  
  - Explicit host+repo+path route.


## 6. Error handling and fallbacks

When RepoDrop encounters an invalid or incomplete tag:

- It does **not** silently drop or misroute the file.
- Instead it:
  1. Marks the parsed tag as invalid,
  2. Shows a clear error in the UI,
  3. Prompts the user to:
     - Choose an alias, or
     - Correct the explicit route.

For partially resolvable tags (e.g., alias known but path missing), RepoDrop can prompt the user to fill in the missing pieces and optionally update the alias mapping.


## 7. CoSuite notes

For CoSuite/Co1/CoPrime, recommended defaults are:

- Aliases:
  - `@cache` → `gh:rickballard/CoCache#advice/inbox/`
  - `@steward` → `gh:rickballard/CoSteward#advice/inbox/`
  - `@audit` → `gh:rickballard/CoAudit#advice/inbox/`
- Default tag:
  - `@cache` (or `@inbox` mapped to CoCache) for generic AdviceBomb drops from phone sessions.

These defaults should be surfaced in CoSuite docs so that **phone sessions know which tag to attach** to downloadable deliverables intended for CoCache-based ingestion.


## 8. Future extensions

Possible future additions to the tagging language (v2+):

- Multiple tags per file (e.g., routing + label + priority).
- Inline metadata encoding (e.g., short priority code, version code).
- Support for specifying branch names in tags.
- Integration with JSON or YAML sidecars for richer metadata, while keeping tags minimal.

For v1, the above spec is sufficient to support robust, scriptable routing of deliverables from phone downloads into repo inboxes.
