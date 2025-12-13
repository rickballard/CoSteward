param(
  [Parameter(Mandatory = $true)][string]$OutFile,
  [Parameter(Mandatory = $true)][string[]]$Inputs
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

if (-not (Get-Command '7z' -ErrorAction SilentlyContinue)) {
  throw '7z not found on PATH. Install 7-Zip or ensure 7z.exe is available.'
}

# AES-256 + header encryption (file names) for 7z
& 7z a $OutFile @Inputs '-mhe=on' -p | Out-Host

if (-not (Test-Path -LiteralPath $OutFile)) {
  throw ("Expected output archive not found: {0}" -f $OutFile)
}

# Sidecar sha256 receipt
$hash = (Get-FileHash -Algorithm SHA256 -LiteralPath $OutFile).Hash.ToLowerInvariant()
"{0}  *{1}" -f $hash,[IO.Path]::GetFileName($OutFile) | Set-Content -LiteralPath ("{0}.sha256" -f $OutFile) -Encoding ascii

Write-Host ("OK: {0}" -f $OutFile)
Write-Host ("OK: {0}.sha256" -f $OutFile)
