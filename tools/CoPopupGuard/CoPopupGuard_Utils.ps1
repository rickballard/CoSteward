function Get-CoPopupGuardSummary {
    param(
        [int]$Minutes = 10,
        [string]$LogRoot = "$HOME\Documents\GitHub\CoSteward\logs\CoPopupGuard"
    )

    $cutoff = (Get-Date).ToUniversalTime().AddMinutes(-$Minutes)

    if (-not (Test-Path $LogRoot)) {
        Write-Verbose "LogRoot not found: $LogRoot"
        return
    }

    $files = Get-ChildItem $LogRoot -Filter 'CoPopupGuard_Events_*.jsonl' |
        Sort-Object Name -Descending |
        Select-Object -First 3

    if (-not $files) { return }

    $events = foreach ($f in $files) {
        Get-Content $f.FullName | ForEach-Object {
            if (-not $_) { return }
            $obj = $_ | ConvertFrom-Json -ErrorAction SilentlyContinue
            if ($null -eq $obj) { return }
            $ts = [datetime]::ParseExact($obj.UTS, 'yyyyMMddTHHmmssZ', $null)
            if ($ts -ge $cutoff) { $obj }
        }
    }

    if (-not $events) { return }

    $events |
        Group-Object ProcessName |
        Select-Object Name, Count
}
