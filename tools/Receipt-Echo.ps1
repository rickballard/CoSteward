param()
$ErrorActionPreference='Stop'
$log = Join-Path $PSScriptRoot '..\STATUS\violets.log' | Resolve-Path -EA SilentlyContinue
if(-not $log){ return }
$last = Get-Content -Tail 1 -Encoding UTF8 $log
# transform "[violet] 2025-.. rest" -> "■[Receipt] 2025-.. rest"
if($last -match '^\[violet\]\s*(.+)$'){
  '■[Receipt] ' + $matches[1]
} else {
  # fallback: just prefix
  '■[Receipt] ' + $last
}
