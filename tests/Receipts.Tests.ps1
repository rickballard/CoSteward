Describe "Receipts sanity" {
  It "has required header + marker" {
    $md = Get-Content -Raw -Encoding UTF8 "RECEIPTS.md"
    $md | Should -Match "# Violet Receipts"
    $md | Should -Match "<!-- vio:append -->"
    $md | Should -Match "\| date \(UTC\) \| repo \| area \| action \| pr \| sha \| note \|"
  }
  It "has well-formed row(s) if any rows exist" {
    $rows = (Get-Content -Encoding UTF8 "RECEIPTS.md") |
      Where-Object { $_ -match '^\|\s*\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z\s*\|' }
    if($rows.Count -gt 0){
      $rows | ForEach-Object { $_ | Should -Match '^\|\s*\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z\s*\|[^|]+\|[^|]+\|[^|]+\|[^|]+\|[^|]+\|[^|]+\|$' }
    }
  }
}
