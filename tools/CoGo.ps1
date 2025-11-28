# CoGo.ps1 - central navigation helpers for CoSuite repos

# Central registry of CoSuite repos
# Edit this map as you add or remove repos.
$script:CoRepos = @{
    CoSteward  = (Join-Path $HOME 'Documents\GitHub\CoSteward')
    CoCache    = (Join-Path $HOME 'Documents\GitHub\CoCache')
    CoAgent    = (Join-Path $HOME 'Documents\GitHub\CoAgent')
    CoCivium   = (Join-Path $HOME 'Documents\GitHub\CoCivium')
    CoArena    = (Join-Path $HOME 'Documents\GitHub\CoArena')
    RickPublic = (Join-Path $HOME 'Documents\GitHub\RickPublic')
    # Add more here as needed, for example:
    # CoAudit    = (Join-Path $HOME 'Documents\GitHub\CoAudit')
    # CoCore     = (Join-Path $HOME 'Documents\GitHub\CoCore')
}

function Get-CoRepo {
    param(
        [Parameter(Mandatory)]
        [string]$Name
    )

    if (-not $script:CoRepos.ContainsKey($Name)) {
        throw "Repo '$Name' not registered in CoRepos."
    }

    $path = $script:CoRepos[$Name]
    return $path
}

function Go-Co {
    param(
        [Parameter(Mandatory)]
        [ValidateSet(
            'CoSteward',
            'CoCache',
            'CoAgent',
            'CoCivium',
            'CoArena',
            'RickPublic'
            # Add any new keys you add to $CoRepos here
        )]
        [string]$Name
    )

    $path = Get-CoRepo -Name $Name

    if (-not (Test-Path -LiteralPath $path)) {
        Write-Host ("Repo '{0}' not found at {1}" -f $Name, $path) -ForegroundColor Red
        return
    }

    Set-Location $path
    Write-Host ("Now at {0}: {1}" -f $Name, $path) -ForegroundColor Cyan

    $git = Get-Command git -ErrorAction SilentlyContinue
    if ($null -eq $git) {
        Write-Host "git not found in PATH; skipping status." -ForegroundColor Yellow
        return
    }

    try {
        git status
    }
    catch {
        Write-Host ("git status failed: {0}" -f $_.Exception.Message) -ForegroundColor DarkRed
    }
}

# Convenience wrappers
function Go-CoSteward  { Go-Co -Name 'CoSteward'  }
function Go-CoCache    { Go-Co -Name 'CoCache'    }
function Go-CoAgent    { Go-Co -Name 'CoAgent'    }
function Go-CoCivium   { Go-Co -Name 'CoCivium'   }
function Go-CoArena    { Go-Co -Name 'CoArena'    }
function Go-RickPublic { Go-Co -Name 'RickPublic' }
