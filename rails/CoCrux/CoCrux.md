# CoCrux v0.1
Compact rail deck for CoPre and CoCrux orchestration.

This file is the human facing view of the CoCrux rails. The machine facing
view is in CoCrux.gib and CoCruxDeck.json. CoPre headers can stay thin and
still carry full behavior by referencing these terms and their GIB tokens.

## Core CoCrux terms

- **CoRepoFirst** (`rf`)
  - Repo is source of truth. Evidence beats memory or guesswork.

- **CoAssumeNotLanded** (`anl`)
  - Assume work has not landed, especially to main, unless there is explicit
    evidence such as commits, PRs, hashes, or artifacts.

- **CoAutoFirst** (`af`)
  - Prefer PS7 DO blocks and scripts before manual edits when automation is
    feasible.

- **CoZipReady** (`zr`)
  - Outputs should be ready for zip and repo ingestion.

- **CoMegaWaveOnly** (`mw`)
  - MegaWave or nothing for real work. Free form talk is allowed only around
    the rails, not instead of them.

- **CoSyncOrStop** (`cs`)
  - If not CoSynced to BPOE rails, slow or stop and repair before more work.

- **CoWaveDiscipline** (`wd`)
  - Count waves, summarise intent, repos, assets, and done versus doing.

- **CoBloatBeat** (`bb`)
  - Report CU, PU, HU, WT. Suggest hygiene and rotate when levels are high.

- **CoSessionHygiene** (`sg`)
  - Use local reload and purge tools when sessions are sticky or feel off
    rails.

- **CoControlPhrases** (`cp`)
  - Control phrases like "CoSync to BPOE rails now" and "MegaWave or nothing"
    override other context and must be honoured.

- **CoTense** (`tt`)
  - Past is verified, present is active, future is planned. Only past tense
    items count as done.

- **CoNoHandEdit** (`nh`)
  - No hand edits where scripts or updater tools can own the change.

- **CoGuardGLUKEY** (`glk-`)
  - Do not surface GLUKEY or crown jewels into unsafe channels.

- **CoStealthDefault** (`st`)
  - Use a quiet posture with sensitive content. Share only what is needed.

- **CoASCIIMode** (`am`)
  - Use ASCII friendly punctuation as the default. Fancy glyphs are optional
    and should be used sparingly.

- **CoSprint** (`sp`)
  - Short, concrete, low token responses. DO blocks first when work is real.

- **CoDriftGuard** (`dr`)
  - Treat "session feels off rails" as a health event and repair first.

- **CoEvidenceBeforeAction** (`eb`)
  - Check for concrete evidence before building on prior state.

- **CoPRFlow** (`pf`)
  - Branch to PR to squash for repo changes. Main stays clean and verified.

- **CoShadowMode** (`sm`)
  - Be aware that machine rails can be thicker than the human view. Keep
    headers thin while respecting hidden rails.
