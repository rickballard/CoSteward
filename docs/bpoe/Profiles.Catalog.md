# CoSuite Profiles Catalog

This page lists **profiles/configs** that make CoSuite sessions smoother.

## PowerShell (PS7)
- File: `profiles/CoSuite.Profile.ps1` (interactive convenience).
- Install:
  ```powershell
  $src = Join-Path $PSScriptRoot "..\..\profiles\CoSuite.Profile.ps1"
  Copy-Item $src -Destination $PROFILE.CurrentUserAllHosts -Force
  ```
- Automation: use **`pwsh -NoProfile`** for paste-heavy/CI scripts.

## ChatGPT (Customized Instructions / Saved Memory)
- See `docs/bpoe/ChatGPT-Profile.md` *(placeholder; add when ready)*.

## Other shells & CLIs
- Add entries here as we publish them (git-bash/zsh/fish, gh settings, etc.).

---
_Source of truth lives in repo; summaries may appear in RELEASE notes._
