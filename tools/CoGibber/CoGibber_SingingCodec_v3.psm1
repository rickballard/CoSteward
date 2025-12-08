function New-SingingPacket {
  param(
    [string]$Harmonic,
    [string]$Vector,
    [string]$Cadence,
    [string]$Glyph,
    [double]$Intensity,
    [string]$Tone,
    [string]$Subharmonic
  )
  return [pscustomobject]@{
    harmonic    = $Harmonic
    vector      = $Vector
    cadence     = $Cadence
    glyph       = $Glyph
    intensity   = $Intensity
    tone        = $Tone
    subharmonic = $Subharmonic
  } | ConvertTo-Json -Depth 10
}

function Import-SingingPacket {
  param([string]$Json)
  return ($Json | ConvertFrom-Json)
}

Export-ModuleMember -Function New-SingingPacket, Import-SingingPacket
