# RepoDrop / CoDrop – Phone-to-Repo Deliverable Transfer (v1 Concept)

## 1. Purpose

RepoDrop (CoDrop inside CoSuite) is a small mobile app that turns phone-created deliverables into **proper repo inbox artifacts** with minimal effort.

It is designed for scenarios where:
- Most thinking and drafting happens in phone-based AI/chat sessions.
- The canonical source of truth is one or more Git repositories.
- The user wants **frictionless transfer** from phone downloads to repo inboxes, ideally guided by simple tags in filenames.

RepoDrop is **generic**: any user with any Git-based repo host (GitHub, GitLab, Bitbucket, etc.) can use it. CoSuite users get additional conventions (e.g., `advice/inbox/`, `.sha256`, `INBOX_LOG.md`, CoAdvice workflows).


## 2. Primary user stories

### 2.1 Tagged download -> repo inbox

1. The user downloads a file on their phone, for example:
   - `AdviceBomb_Strategy_20251118@inbox.zip`
   - `MeetingNotes_VC@cache.md`
2. RepoDrop notices the tag suffix (e.g., `@inbox`, `@cache`) when the user:
   - Shares the file to RepoDrop, or
   - Saves it into a watched folder that RepoDrop can access.
3. RepoDrop parses the tag and:
   - Identifies the target host (e.g. GitHub),
   - The target repo (e.g. `owner/CoCache`),
   - The target path (e.g. `advice/inbox/`),
   based on user-configured mapping.
4. RepoDrop uploads the file to that repo and path, optionally as:
   - A direct commit to `main`, or
   - A branch + PR (e.g., `inbox/20251118T173500Z`).
5. The app logs the delivery and (optionally) deletes the local copy from the phone.

The user’s experience: *“Download file, one tap, it’s in the repo inbox”*.


### 2.2 Share from any app to RepoDrop

1. From any app (browser, chat, email), the user chooses **Share** → **RepoDrop**.
2. RepoDrop reads the filename and proposes a target based on:
   - Tags in the name, or
   - Previously used routes.
3. The user confirms or adjusts:
   - Which repo,
   - Which inbox path,
   - Whether to rename the file.
4. RepoDrop uploads and logs the delivery.

The user’s experience: *“Share → RepoDrop → Done.”*


### 2.3 Generic dev user: simple repo inbox

For non-CoSuite users, RepoDrop can be as simple as:

- One default host (e.g. GitHub),
- One default repo,
- One default inbox path (e.g., `inbox/`),
- Simple tags like `@inbox`, `@log`, `@attachments`.

The app becomes a generic *“send this file to my repo inbox”* tool.


### 2.4 CoSuite / Co1 user: CoAdvice-aware inbox

For CoSuite, CoDrop can provide richer flows:

- Default repo: `CoCache` (or as configured).
- Default path: `advice/inbox/`.
- Additional CoAdvice behaviors (via a PC or server-side agent):
  - Generate `.sha256` sidecars,
  - Append entries to `advice/INBOX_LOG.md`,
  - Trigger `.CoVerify.ps1` or similar verification scripts,
  - Optionally open a PR for each AdviceBomb or batch of deliverables.


## 3. Tagging model (high level)

RepoDrop relies on **delivery tags** embedded in filenames or chosen in the app.

Examples:

- `AdviceBomb_CoSteward_20251118@inbox.zip`
- `CoTheory_V3@cache.md`
- `CoAudit_Notes@gh:rickballard/CoAudit#advice/inbox/notes.md`

See the companion document `RepoDrop_Tagging_Spec_v1.md` for the detailed mini-language.


## 4. Repo integration modes

### 4.1 Direct-to-repo (no helper)

RepoDrop connects straight to Git hosts using:

- Personal Access Tokens (PATs), or
- OAuth where supported.

For each delivery, it:

1. Fetches the current branch HEAD (default: `main`).
2. Builds a commit adding the file at the target path.
3. Pushes to:
   - `main`, or
   - a short-lived branch + PR.

This mode is enough for most users and gives an immediate, visible artifact in the repo.


### 4.2 With RepoDrop Agent (optional helper)

Some users and systems (like CoSuite) want extra logic that is better run off-phone:

- Running scripts (e.g., `.CoVerify.ps1`),
- Generating `.sha256` sidecars,
- Updating logs (`INBOX_LOG.md`),
- Applying naming or archival rules.

For that, RepoDrop can talk to an **optional Agent**, which runs on:

- A PC (developer workstation), or
- A small server/VM.

Flow:

1. RepoDrop sends the file and metadata to the Agent over HTTPS.
2. The Agent:
   - Writes the file into a local working copy of the repo,
   - Runs the necessary scripts,
   - Commits and pushes,
   - Returns status to the phone.

This gives CoSuite users the full “advice inbox ritual” while keeping the phone code minimal and robust.


## 5. Platforms and UX

### 5.1 Cross-platform core

For both Android and iOS:

- RepoDrop is a standard app and a **Share target**.
- User flows:
  - “Share → RepoDrop → Confirm target → Deliver”,
  - “Open RepoDrop → Import from Files / Downloads → Deliver”.

The app maintains a simple **delivery log**:

- Timestamp,
- Source filename,
- Target host, repo, path,
- Status (success, error),
- Optional link to the repo location.


### 5.2 Android specifics

Where allowed by platform constraints, Android can additionally:

- Request permission to read chosen folders (e.g., `Downloads` or a specific directory).
- Periodically scan those for files matching configured patterns and tags.
- Auto-suggest or auto-trigger deliveries.

This can get close to “download and forget” for power users who want high automation.


### 5.3 iOS specifics

iOS is stricter with background file access. For iOS, RepoDrop focuses on:

- Being a share target.
- Integrating with the Files app:
  - Users can create a “RepoDrop Inbox” folder.
  - Moving files into that folder makes them easy for RepoDrop to consume.
- Using Shortcuts for semi-automatic workflows, like:
  - “Send all files in this folder to RepoDrop with tag @inbox”.


## 6. Security and permissions

RepoDrop must be explicit and transparent about:

- Which repos it can write to.
- Which paths inside those repos are targeted.
- What authentication tokens it holds.

Security principles:

1. **Least privilege**:  
   - Encourage using repo-scoped or org-scoped tokens rather than broad account-wide tokens.
2. **Visibility**:  
   - Every delivery shows the exact URL and path where the file was written.
3. **Local control**:  
   - The user can revoke access and clear stored tokens at any time.
4. **No surprise edits**:  
   - Default behavior is additive:
     - New files in designated inbox paths,
     - No modifications to other parts of the repo unless explicitly configured.


## 7. CoSuite-specific considerations

For CoSuite and Co1/CoPrime-type orchestrators, RepoDrop (CoDrop) should:

- Prefer writing to `advice/inbox/` and similar well-defined inbox directories.
- Use filenames that preserve:
  - Source session identity,
  - Timestamp,
  - Version hints (`v1`, `v2`, etc.).
- Optionally include a small JSON or YAML metadata sidecar (future extension) to carry:
  - Session ID,
  - Device ID,
  - Tag(s),
  - Notes or summary, if provided by the phone-side assistant.

This makes it easier for the Co1 session to cluster and ingest batches of deliverables.


## 8. Risks and design flaws to watch for

1. **Over-automation / accidental commits**  
   - Risk: user accidentally commits sensitive files to the wrong repo.  
   - Mitigation:
     - Clear confirmation screens,
     - Per-repo / per-path checkboxes,
     - Strong visual clues about where files are going.

2. **Token security**  
   - Risk: PATs stored on the device get compromised.  
   - Mitigation:
     - Use platform keychains (iOS Keychain, Android Keystore),
     - Encourage narrow-scope tokens,
     - Allow instant revocation and local wipe.

3. **Platform background limits**  
   - Risk: over-reliance on automatic background scans that may be unreliable.  
   - Mitigation:
     - Treat **Share → RepoDrop** as the primary flow,
     - Offer background scans only as a “best-effort” advanced feature.

4. **Filename tag complexity**  
   - Risk: tags become too complex or fragile.  
   - Mitigation:
     - Keep the delivery tag language minimal and robust,
     - Prefer aliases (`@cache`, `@steward`) over long inline host/repo/path tags,
     - Provide a good in-app route picker and history.

5. **Conflict with existing workflows**  
   - Risk: organizations with strict Git workflows may be wary of phone-origin commits.  
   - Mitigation:
     - Default to branch + PR mode in “enterprise” configuration,
     - Let admins lock down paths and require review.


## 9. Summary

RepoDrop (CoDrop) is a small, focused product that:

- Bridges the gap between **phone-era thinking** and **repo-era canonical storage**.
- Uses a simple tagging model to convert filenames into routing instructions.
- Works generically for any Git user, while being deeply compatible with CoSuite’s inbox and advice patterns.
- Can start as a thin, phone-only client, and later gain a more sophisticated agent for advanced workflows.

This document should be read alongside `RepoDrop_Tagging_Spec_v1.md` and any CoSuite-specific quickstart advisory for Co1/CoPrime.
