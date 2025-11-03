param(
  [Parameter(Mandatory)][string]$Set,
  [int]$Cycles=1,
  [int]$Do=0,
  [ValidateSet("ok","warn","fail")][string]$Status="ok",
  [string]$Schema="v1"
)
$vioPath = Join-Path (Join-Path (Split-Path $PSScriptRoot -Parent) "STATUS") "violets.log"

