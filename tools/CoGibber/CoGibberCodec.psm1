function ConvertTo-CoGibber {
    param([Parameter(Mandatory=$true)]$InputObject)
    return ($InputObject | ConvertTo-Json -Depth 10)
}

function ConvertFrom-CoGibber {
    param([Parameter(Mandatory=$true)][string]$Json)
    return ($Json | ConvertFrom-Json)
}

Export-ModuleMember -Function ConvertTo-CoGibber, ConvertFrom-CoGibber
