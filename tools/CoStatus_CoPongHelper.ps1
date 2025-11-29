param(
    [Parameter(Mandatory = $true)][string] $Session,
    [Parameter(Mandatory = $true)][string] $Repo,
    [string] $Branch = '',
    [string] $Blocks = '',
    [ValidateSet('OK','SOFT','HARD','FATAL')][string] $CU = 'OK',
    [ValidateSet('OK','SOFT','HARD','FATAL')][string] $PU = 'OK',
    [ValidateSet('OK','SOFT','HARD','FATAL')][string] $HU = 'OK',
    [ValidateSet('OK','SOFT','HARD','FATAL')][string] $WT = 'OK',
    [ValidateSet('OK','SOFT','HARD','FATAL')][string] $LagFeel = 'OK',
    [string] $Brand = 'CoCivium',
    [string] $Note = ''
)

# First segment: health + brand
$prefix = "[VIOLET][CU:$CU][PU:$PU][HU:$HU][WT:$WT][$Brand]"

# Second segment: context
$ctxParts = @("[${Session}]","[${Repo}]")
if($Branch){ $ctxParts += "[$Branch]" }
if($Blocks){ $ctxParts += "[$Blocks]" }
$ctx = ($ctxParts -join '')

# All segments on one logical line, diamond separated
$segments = @($prefix, $ctx)
if($Note){ $segments += $Note }

$line = ($segments -join ' ◆ ')
Write-Host $line