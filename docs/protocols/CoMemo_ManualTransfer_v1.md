# CoMemo – manual cross-session transfer pattern (v1)

UTS seed: 20251127T181037Z

## 1. Purpose

CoMemo is a small, structured memo that humans can copy and paste between chat sessions.

Until sessions can see and address each other directly:

- CoMemos are the safest way to move intent, scope, and quotes.
- They reduce copy–paste confusion and “who is Benedict here?” drift.
- They leave a clear audit trail in repositories when saved as notes.

## 2. CoMemo header template

When manually transferring content between sessions, prepend a header like:

\\\
[Digital CoMemo – manual cross-session transfer]

FromSessionLabel: <SourceSessionLabelOrNickname>
FromSessionURL:   <FullChatURLIfAvailableOrN/A>

ToSessionLabels:  <TargetSessionLabel1>, <TargetSessionLabel2>, ...
ToSessionURLs:    <OptionalFullChatURLsOrN/A>

Subject:          <Short handle for what this memo is about>
Intent:           <Why this is being shared; what help is requested>

Priority:         normal | high | low
ScopeTags:        <comma-separated tags, e.g. CoPortal, CoIndex, CoBus, CoCivia>
\\\

After this header, paste the body (quotes, plans, links, etc).

### 2.1 Examples

Minimal example:

\\\
[Digital CoMemo – manual cross-session transfer]

FromSessionLabel: Benedict
FromSessionURL:   N/A

ToSessionLabels:  CoPrime20251128
ToSessionURLs:    N/A

Subject:          CoBrowser / CoPortals addendum
Intent:           Clarify that Benedict’s CoBrowser/CoPortal framing is additive,
                  not canonical, and must be blended with existing CoPortal / GIBindex work.

Priority:         normal
ScopeTags:        CoPortal, CoBrowser, CoBus

Body:
<quoted text or summary here>
\\\

## 3. Benedict / alias drift note

If multiple sessions start claiming related roles (for example several “Benedict” waves):

- Always include the *full* FromSessionLabel as you used it at the time.
- When in doubt, add a one-line note in the Intent, such as:
  - “This is one of several Benedict-related sessions; treat this as advisory, not canonical.”

Later CoBus / CoSessionRegistry patterns can interpret these hints more formally.

## 4. Repo usage

Recommended:

- Store important CoMemos in:
  - CoSteward: \docs/intent/bus/CoMemo_*.md\
  - CoCache:   inside AdviceBomb notes when they carry multi-session context
- Add a short footer to saved CoMemos:

\\\
[CoMemoSaved]
Repo:    <repo-name>
Path:    <relative/path>
UTS:     <uts>
Session: <local session label at save-time>
\\\

## 5. Future evolution

Later versions may:

- add a JSON representation for machine parsing;
- link CoMemos to CoSessionRegistry entries;
- be generated automatically by tools instead of manual copy–paste.
