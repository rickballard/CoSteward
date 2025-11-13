function Show-CoStatus {
    param(
        [string]$CU    = 'OK',
        [string]$PU    = 'OK',
        [string]$HU    = 'OK',
        [string]$WT    = 'OK',
        [string]$MW    = '',
        [double]$Drift = 0.0,
        [string]$Focus = ''
    )

    $colorMap = @{
        'OK'    = 'Green'
        'SOFT'  = 'Yellow'
        'HARD'  = 'Red'
        'FATAL' = 'Magenta'
    }

    function Write-Seg {
        param([string]$Label, [string]$Value)
        $val = $Value.ToUpper()
        $color = $colorMap[$val]
        if (-not $color) { $color = 'Gray' }
        Write-Host "[" -NoNewline
        Write-Host $Label -NoNewline -ForegroundColor DarkGray
        Write-Host " " -NoNewline
        Write-Host $val -NoNewline -ForegroundColor $color
        Write-Host "] " -NoNewline
    }

    Write-Host "CoStatus: " -NoNewline -ForegroundColor Cyan
    Write-Seg -Label 'CU' -Value $CU
    Write-Seg -Label 'PU' -Value $PU
    Write-Seg -Label 'HU' -Value $HU
    Write-Seg -Label 'WT' -Value $WT

    if ($MW) {
        Write-Host "| MW=$MW " -NoNewline -ForegroundColor DarkCyan
    }

    Write-Host ("| drift≈{0:N2} " -f $Drift) -NoNewline -ForegroundColor DarkGray

    if ($Focus) {
        Write-Host "| " -NoNewline
        Write-Host $Focus -ForegroundColor Gray
    } else {
        Write-Host ""
    }
}
