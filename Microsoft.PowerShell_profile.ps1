# boxmein's powershell config 
# ps core 7.2.2 || microsoft ps 5.0 something

chcp 65001

#region Environment add-ons

$env:PYTHONIOENCODING = "utf-8"
$env:EDITOR = "code.cmd"
$env:VISUAL = "code.cmd"
$env:ALTERNATIVE_EDITOR = "notepad"
$env:PGCLIENTENCODING = "utf-8"

#endregion

${function:~} = { Set-Location ~ }

#region Aliases
# Dot dot
${function:Set-ParentLocation} = { Set-Location .. }; 
Set-Alias ".." Set-ParentLocation
${function:...} = { Set-Location ..\.. }
${function:....} = { Set-Location ..\..\.. }
${function:.....} = { Set-Location ..\..\..\.. }
${function:......} = { Set-Location ..\..\..\..\.. }


Set-Alias -Option AllScope -Name cat        -Value get-content
Set-Alias -Option AllScope -Name cd         -Value set-location
Set-Alias -Option AllScope -Name clear      -Value clear-host
Set-Alias -Option AllScope -Name cp         -Value copy-item
Set-Alias -Option AllScope -Name h          -Value get-history
Set-Alias -Option AllScope -Name history    -Value get-history
Set-Alias -Option AllScope -Name kill       -Value stop-process
Set-Alias -Option AllScope -Name lp         -Value out-printer
Set-Alias -Option AllScope -Name mount      -Value new-mshdrive
Set-Alias -Option AllScope -Name mv         -Value move-item
Set-Alias -Option AllScope -Name popd       -Value pop-location
Set-Alias -Option AllScope -Name ps         -Value get-process
Set-Alias -Option AllScope -Name pushd      -Value push-location
Set-Alias -Option AllScope -Name pwd        -Value get-location
Set-Alias -Option AllScope -Name r          -Value invoke-history
Set-Alias -Option AllScope -Name rm         -Value remove-item
Set-Alias -Option AllScope -Name rmdir      -Value remove-item
Set-Alias -Option AllScope -Name echo       -Value write-output
Set-Alias -Option AllScope -Name rd         -Value remove-item
Set-Alias -Option AllScope -Name set        -Value set-variable
Set-Alias -Option AllScope -Name nslookup   -Value Resolve-DnsName

Set-Alias time Measure-Command
${function:sv} = { Set-Location D:\Projects\Calidity\ }
${function:svctl} = { Set-Location D:\Projects\Calidity\controller }
${function:svdev} = { Set-Location D:\Projects\Calidity\dev }
${function:svsf} = { Set-Location D:\Projects\Calidity\dev\frontend }
${function:dl} = { Set-Location ~\Downloads }
#endregion

##region MORE COMPLEX ALIASES

function dig {
  Resolve-DnsName -Type $args[0] -Name $args[1]
}

function settings {
  code.cmd "$env:USERPROFILE\dotfiles\Microsoft.PowerShell_profile.ps1"
}

function help {
  get-help $args[0] | out-host -paging
}

function mkdir {
  new-item -type directory -path $args
}

function md {
  new-item -type directory -path $args
}

function prompt {
  "PS " + $(get-location) + "> "
}

function gs {
  git status $args
}

function ga {
  git add $args
}

function gc {
  git commit $args
}

function gp {
  git push $args
}

function which($name) { 
  Get-Command $name -ErrorAction SilentlyContinue | Select-Object Definition
}
function touch($file) {
  "" | Out-File $file -Encoding ASCII
}

function dbc {
  $env:PGPASSWORD = "postgres"
  psql -U postgres -h localhost -d postgres 
}

# Sudo
function sudo() {
  if ($args.Length -eq 1) {
    start-process $args[0] -verb "runAs"
  }
  if ($args.Length -gt 1) {
    start-process $args[0] -ArgumentList $args[1..$args.Length] -verb "runAs"
  }
}


#endregion

#region bla
function Edit-Hosts {
  Invoke-Expression "sudo $(if($null -ne $env:EDITOR) { $env:EDITOR } else { 'notepad' }) $env:windir\system32\drivers\etc\hosts"
}
function Edit-Profile {
  Invoke-Expression "$(if($null -ne $env:EDITOR)  {$env:EDITOR } else { 'notepad' }) $profile"
}
function Restart-Powershell {
  $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
  $newProcess.Arguments = "-nologo";
  [System.Diagnostics.Process]::Start($newProcess);
  exit
}
# Sound Volume
function Get-SoundVolume {
  <#
  .SYNOPSIS
  Get audio output volume.
  .DESCRIPTION
  The Get-SoundVolume cmdlet gets the current master volume of the default audio output device. The returned value is an integer between 0 and 100.
  .LINK
  Set-SoundVolume
  .LINK
  Set-SoundMute
  .LINK
  Set-SoundUnmute
  .LINK
  https://github.com/jayharris/dotfiles-windows/
  #>
  [math]::Round([Audio]::Volume * 100)
}
function Set-SoundVolume([Parameter(mandatory = $true)][Int32] $Volume) {
  <#
  .SYNOPSIS
  Set audio output volume.
  .DESCRIPTION
  The Set-SoundVolume cmdlet sets the current master volume of the default audio output device to a value between 0 and 100.
  .PARAMETER Volume
  An integer between 0 and 100.
  .EXAMPLE
  Set-SoundVolume 65
  Sets the master volume to 65%.
  .EXAMPLE
  Set-SoundVolume -Volume 100
  Sets the master volume to a maximum 100%.
  .LINK
  Get-SoundVolume
  .LINK
  Set-SoundMute
  .LINK
  Set-SoundUnmute
  .LINK
  https://github.com/jayharris/dotfiles-windows/
  #>
  [Audio]::Volume = ($Volume / 100)
}
function Set-SoundMute {
  <#
  .SYNOPSIS
  Mote audio output.
  .DESCRIPTION
  The Set-SoundMute cmdlet mutes the default audio output device.
  .LINK
  Get-SoundVolume
  .LINK
  Set-SoundVolume
  .LINK
  Set-SoundUnmute
  .LINK
  https://github.com/jayharris/dotfiles-windows/
  #>
  [Audio]::Mute = $true
}
function Set-SoundUnmute {
  <#
  .SYNOPSIS
  Unmote audio output.
  .DESCRIPTION
  The Set-SoundUnmute cmdlet unmutes the default audio output device.
  .LINK
  Get-SoundVolume
  .LINK
  Set-SoundVolume
  .LINK
  Set-SoundMute
  .LINK
  https://github.com/jayharris/dotfiles-windows/
  #>
  [Audio]::Mute = $false
}

# Reload the $env object from the registry
function Restore-Environment {
  $locations = 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
  'HKCU:\Environment'

  $locations | ForEach-Object {
    $k = Get-Item $_
    $k.GetValueNames() | ForEach-Object {
      $name = $_
      $value = $k.GetValue($_)
      Set-Item -Path Env:\$name -Value $value
    }
  }

  $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
}

# Set a permanent Environment variable, and reload it into $env
function Set-SystemEnvironment([String] $variable, [String] $value) {
  Set-ItemProperty "HKCU:\Environment" $variable $value
  # Manually setting Registry entry. SetEnvironmentVariable is too slow because of blocking HWND_BROADCAST
  #[System.Environment]::SetEnvironmentVariable("$variable", "$value","User")
  Invoke-Expression "`$env:${variable} = `"$value`""
}

function Prepend-EnvPath([String]$path) { $env:PATH = $env:PATH + ";$path" }
function Prepend-EnvPathIfExists([String]$path) { if (Test-Path $path) { Prepend-EnvPath $path } }
function Append-EnvPath([String]$path) { $env:PATH = $env:PATH + ";$path" }
function Append-EnvPathIfExists([String]$path) { if (Test-Path $path) { Append-EnvPath $path } }

#endregion


#region Plugins

Import-Module ZLocation

#endregion


#region Chocolatey setup
# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
#endregion

#region Prompt setup
#
# prompt: oh-my-posh
# 
Append-EnvPathIfExists "$env:LOCALAPPDATA\Programs\oh-my-posh\bin\"
oh-my-posh init pwsh --config $env:LOCALAPPDATA\Programs\oh-my-posh\themes\powerlevel10k_lean.omp.json | Invoke-Expression
#endregion

#region Fuck setup
iex "$(thefuck --alias)"
#endregion