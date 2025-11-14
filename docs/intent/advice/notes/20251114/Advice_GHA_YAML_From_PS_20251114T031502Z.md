# Advice for Co1 — Keep GitHub Actions expressions literal when writing YAML from PowerShell

Context: PowerShell parses $ + {; avoid it when emitting ${{ … }}.

Recommendations (BPOE additions; no protocol changes):
1) Build lines via concatenation:
       if: ${{ github.event_name == "pull_request" }}
2) Prefer array-of-lines with Set-Content; avoid here-strings when ${{ … }} is present.
3) If templating, assemble as parts: ${{ github.event_name == "pull_request" }}
4) CI smoke: echo the YAML; grep for ${{ to confirm literal retention.
