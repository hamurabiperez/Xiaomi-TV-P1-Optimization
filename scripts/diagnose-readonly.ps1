# Read-only Android TV baseline. Results may contain PRIVATE identifiers.
# Usage: .\diagnose-readonly.ps1 -Target <TV_IP>:5555 -AdbPath "C:\path\to\adb.exe" -OutputDir "C:\private\xiaomi-audit"
param(
    [Parameter(Mandatory=$true)][string]$Target,
    [Parameter(Mandatory=$true)][string]$AdbPath,
    [Parameter(Mandatory=$true)][string]$OutputDir
)
$ErrorActionPreference = 'Stop'
if ($Target -notmatch '^(?:\d{1,3}\.){3}\d{1,3}:\d{1,5}$') { throw 'Use a local IPv4:port target; check the TV IP in its settings.' }
$ip,$port=$Target.Split(':')
$bytes=$ip.Split('.') | ForEach-Object {[int]$_}
if ((@($bytes | Where-Object {$_ -lt 0 -or $_ -gt 255})).Count -gt 0) { throw 'Invalid IP octet.' }
if ([int]$port -lt 1 -or [int]$port -gt 65535) { throw 'Invalid port.' }
if (-not (($bytes[0] -eq 10) -or ($bytes[0] -eq 192 -and $bytes[1] -eq 168) -or ($bytes[0] -eq 172 -and $bytes[1] -ge 16 -and $bytes[1] -le 31))) { throw 'Only RFC1918 private IPs allowed.' }
if (-not (Test-Path -LiteralPath $AdbPath -PathType Leaf)) { throw 'ADB executable not found.' }
if (-not (Test-Path -LiteralPath $OutputDir)) { New-Item -ItemType Directory -Path $OutputDir -Force | Out-Null }
$OutputDir=(Resolve-Path -LiteralPath $OutputDir).Path
if ($OutputDir -match '(?i)[\\/](?:git|github|Xiaomi-TV-P1-GitHub-DRAFT)[\\/]') { Write-Warning 'Make sure local diagnostics are OUTSIDE your Git repository.' }
& $AdbPath connect $Target | Out-Null
$deviceState=(& $AdbPath -s $Target get-state 2>&1 | Out-String).Trim()
if($deviceState -ne 'device') {throw 'TV not authorized. Confirm ADB prompt on the TV and retry.'}
$commands = @{
 'android-version.txt'=@('shell','getprop','ro.build.version.release');
 'firmware.txt'=@('shell','getprop','ro.build.display.id');
 'current-user.txt'=@('shell','am','get-current-user');
 'home.txt'=@('shell','cmd','package','resolve-activity','--brief','-a','android.intent.action.MAIN','-c','android.intent.category.HOME');
 'packages-disabled.txt'=@('shell','pm','list','packages','-d');
 'packages.txt'=@('shell','pm','list','packages');
 'disk.txt'=@('shell','df','-k','/data');
 'memory.txt'=@('shell','cat','/proc/meminfo');
 'uptime.txt'=@('shell','cat','/proc/uptime')
}
foreach($name in ($commands.Keys | Sort-Object)) {
  $adbArgs = $commands[$name]
  & $AdbPath -s $Target @adbArgs 2>&1 | Out-File -LiteralPath (Join-Path $OutputDir $name) -Encoding utf8
  if($LASTEXITCODE -ne 0) { Write-Warning "Unable to complete $name" }
}
Write-Host 'Diagnostic saved LOCALLY. These files may include device identifiers. DO NOT publish the output folder.'
