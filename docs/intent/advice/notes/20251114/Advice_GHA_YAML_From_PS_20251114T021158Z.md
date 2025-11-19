# Advice for Co1  -  Writing GitHub Actions YAML from PowerShell safely

Context: PowerShell treats $ + '{' as expansion; literal GitHub Actions expressions must avoid PS parsing.

Recommendations (BPOE additions; no protocol changes):
1) Build lines via concatenation, e.g.:
   '    if: ' + '$' + '{{ github.event_name == "pull_request" }}'
2) Prefer array-of-lines with Set-Content; avoid here-strings when ${{ … }} is needed.
3) If templating, assemble as parts: 
   '$' + '{{ ' + 'github.event_name == "pull_request"' + ' }}'
4) CI smoke: echo the YAML and grep for the sequence to confirm it stayed literal.

