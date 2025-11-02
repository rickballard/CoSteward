# (reset) intentionally blank; customize later  [Operations Manual](docs/ops/MANUAL/INDEX.md) · [Vision](docs/intent/VISION.md) · [Mission](docs/intent/MISSION.md)
function cosync {
  param([Parameter(Position=0)][string]$Mode="auto", [string]$ZipPath)
  try {
    $repo = git rev-parse --show-toplevel 2>$null
    if (-not $repo) { $repo = Join-Path $HOME "CoPolitic" }
    if (-not (Test-Path $repo)) { throw "Repo not found at $repo" }
    $script = Join-Path $repo "scripts\CoSync.ps1"
    if (-not (Test-Path $script)) { throw "Missing $script" }
    $argsList = @("-File", $script, "-Mode", $Mode)
    if ($ZipPath) { $argsList += @("-ZipPath", $ZipPath) }
    pwsh @argsList
  } catch { Write-Host "cosync error: $($_.Exception.Message)" -ForegroundColor Red }
}

. "C:\Users\Chris\Documents\PowerShell\Profile.BPOE.HereStrings.ps1"

## Active Ops

- Live CoSync Feed → [docs/ops/LIVE.md](docs/ops/LIVE.md)
- Current Session Plan → [docs/intent/advice/plan/LATEST.md](docs/intent/advice/plan/LATEST.md)
- CoBus Status → [docs/ops/COBUS_STATUS.md](docs/ops/COBUS_STATUS.md)

## Crown Jewels

- Megascroll Hub → [docs/hp/MEGASCROLLS.md](docs/hp/MEGASCROLLS.md)
- BPOE Quicklist → [docs/bpoe/INDEX.md](docs/bpoe/INDEX.md)

## Active Ops

- Live CoSync Feed → [docs/ops/LIVE.md](docs/ops/LIVE.md)
- Current Session Plan → [docs/intent/advice/plan/LATEST.md](docs/intent/advice/plan/LATEST.md)
- CoBus Status → [docs/ops/COBUS_STATUS.md](docs/ops/COBUS_STATUS.md)

## Crown Jewels

- Megascroll Hub → [docs/hp/MEGASCROLLS.md](docs/hp/MEGASCROLLS.md)
- BPOE Quicklist → [docs/bpoe/INDEX.md](docs/bpoe/INDEX.md)

> - Auto-CoSync (opt-in): set `docs/ops/COSYNC_POLICY.json` → `"enabled": true` and enable the local task `CoSteward-AutoCoSync`.

## Active Ops

- Live CoSync Feed → [docs/ops/LIVE.md](docs/ops/LIVE.md)
- Current Session Plan → [docs/intent/advice/plan/LATEST.md](docs/intent/advice/plan/LATEST.md)
- CoBus Status → [docs/ops/COBUS_STATUS.md](docs/ops/COBUS_STATUS.md)

## Crown Jewels

- Megascroll Hub → [docs/hp/MEGASCROLLS.md](docs/hp/MEGASCROLLS.md)
- BPOE Quicklist → [docs/bpoe/INDEX.md](docs/bpoe/INDEX.md)




> Quick setup? See **[Profiles Catalog](docs/bpoe/Profiles.Catalog.md)** and **[Violet Receipts](docs/ops/RECEIPTS.md)**.

> VIOLET quick refs: **[Receipts](docs/ops/RECEIPTS.md)** · **[Handoffs](docs/ops/HANDOFFS.md)** · **[Companion](docs/bpoe/VIOLET.Companion.md)**.

> Live status: **[Open Sessions →](docs/ops/SESSIONS.md#open-sessions)** · **[CoSync Handshakes →](docs/ops/COSYNC.md#entries)**

> **GIBindex — Terms:** see [docs/intent/gibindex/TERMS.md](docs/intent/gibindex/TERMS.md)

GIBindex — Sets

> **GIBindex — Sets:** see [TERMS.md#set](docs/intent/gibindex/TERMS.md#set)


> Re-emit helper: **scripts/reemit.ps1** (calls tools/ReEmit-SetVioletIfHeadChanged.ps1).

## CoCache Dashboards
- CoSteward Aggregate: https://github.com/rickballard/CoCache/blob/main/advice/index/AGG_DASH_CO_STEWARD.md
- CoContrib Microtasks: https://github.com/rickballard/CoCache/blob/main/advice/index/AGG_DASH_CO_CONTRIB.md
