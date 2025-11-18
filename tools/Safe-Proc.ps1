param([Parameter(Mandatory)][string]$File,[Parameter(Mandatory)][string[]]$Args,[int]$TimeoutSec=120)
$ErrorActionPreference="Stop"
$psi=[System.Diagnostics.ProcessStartInfo]::new()
$psi.FileName=$File
foreach($a in $Args){[void]$psi.ArgumentList.Add($a)}
$psi.RedirectStandardOutput=$true; $psi.RedirectStandardError=$true
$psi.UseShellExecute=$false; $psi.CreateNoWindow=$true
$p=[System.Diagnostics.Process]::new(); $p.StartInfo=$psi
if(-not $p.Start()){ throw "failed to start: $File" }
if(-not $p.WaitForExit($TimeoutSec*1000)){ try{$p.Kill($true)}catch{}; throw "timeout: $File ($TimeoutSec s)" }
$so=$p.StandardOutput.ReadToEnd(); $se=$p.StandardError.ReadToEnd()
if($p.ExitCode -ne 0){ throw ("{0} exit {1}: {2}" -f $File,$p.ExitCode,$se.Trim()) }
$so
