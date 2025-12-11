# CoSteward tools

This directory holds local operator scripts and DO blocks that help steer
the CoSuite. Scripts here are meant to be safe, repeatable, and described
briefly for future stewards.

## CoVibe tools

- `DO_CoVibe_GlobalRetrofit_AllRepos_v1.ps1`  
  Global CoVibe retrofit for `wave_notes.md` files across all local git repos
  under `$HOME\Documents\GitHub`, with optional `-DryRun` and automatic CoBus
  report into `docs/intent/advice/notes/YYYYMMDD/`.

