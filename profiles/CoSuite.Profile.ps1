# CoSuite standard interactive profile (safe defaults for PSReadLine)
$ErrorActionPreference = "Stop"
Import-Module PSReadLine -ErrorAction SilentlyContinue
try{ Set-PSReadLineOption -EditMode Windows -PredictionSource History -BellStyle None -HistorySaveStyle SaveNothing -ErrorAction SilentlyContinue }catch{}
try{ Set-PSReadLineKeyHandler -Key Ctrl+v -Function Paste -ErrorAction SilentlyContinue }catch{}
# Tip: for automation/paste blocks always use:  pwsh -NoProfile
