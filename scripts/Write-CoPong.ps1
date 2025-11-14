function Write-CoPong {
    param(
        [string]$SessionLabel,
        [int]   $MWDone,
        [int]   $MWPlan,
        [int]   $MWBudget,
        [string]$CU,
        [string]$PU,
        [string]$HU,
        [string]$WT,
        [string]$NoteRelPath,
        [string]$ZipPath,
        [string]$ZipHash
    )

    # Write-CoPong — merged CoStatus + receipt, single line, small magenta "button".

    # --- helpers -------------------------------------------------------------
    function Get-TierColor {
        param([string]$Tier)
        switch ($Tier.ToUpper()) {
            'OK'    { 'Green' }
            'SOFT'  { 'Yellow' }
            'HARD'  { 'DarkYellow' }
            'FATAL' { 'Red' }
            default { 'DarkGray' }
        }
    }

    function Write-Tier {
        param(
            [string]$Label,
            [string]$Tier
        )
        $diskColor = Get-TierColor -Tier $Tier
        Write-Host ("{0}:" -f $Label) -ForegroundColor Cyan -NoNewline
        Write-Host "●" -ForegroundColor $diskColor -NoNewline
        Write-Host (" {0} " -f $Tier) -ForegroundColor Cyan -NoNewline
    }

    # --- drift & bar ---------------------------------------------------------
    $drift  = $MWDone - $MWPlan
    $slots  = 5
    $offset = [Math]::Max([Math]::Min($drift + 2, $slots), 0)
    $bar    = ''
    for ($i = 0; $i -lt $slots; $i++) {
        if ($i -lt $offset) { $bar += '▮' } else { $bar += '▯' }
    }

    # --- zip + hash text -----------------------------------------------------
    $zipShort = if ([string]::IsNullOrWhiteSpace($ZipPath)) {
        '<none>'
    } else {
        [System.IO.Path]::GetFileName($ZipPath)
    }

    $hashText = if ([string]::IsNullOrWhiteSpace($ZipHash)) {
        '<none>'
    } else {
        $ZipHash
    }

    # --- render (single logical line, no width math) -------------------------
    Write-Host "████ " -ForegroundColor Magenta -NoNewline
    Write-Host "CoPong: " -ForegroundColor Magenta -NoNewline

    Write-Host ("[MW {0}/{1}/{2} | drift: {3} ({4})] " -f $MWDone, $MWPlan, $MWBudget, $bar, $drift) `
        -ForegroundColor Yellow -NoNewline

    Write-Host "[" -ForegroundColor Cyan -NoNewline
    Write-Tier -Label 'CU' -Tier $CU
    Write-Tier -Label 'PU' -Tier $PU
    Write-Tier -Label 'HU' -Tier $HU
    Write-Tier -Label 'WT' -Tier $WT
    Write-Host "] " -ForegroundColor Cyan -NoNewline

    Write-Host ("[Session:{0}] " -f $SessionLabel) -ForegroundColor Green -NoNewline
    Write-Host ("[Note:{0}] " -f $NoteRelPath) -ForegroundColor DarkCyan -NoNewline
    Write-Host ("[Zip:{0}] " -f $zipShort) -ForegroundColor DarkMagenta -NoNewline
    Write-Host ("[SHA256:{0}]" -f $hashText) -ForegroundColor DarkGray -NoNewline

    # tiny tail, not a carpet
    Write-Host " ████" -ForegroundColor Magenta
}
