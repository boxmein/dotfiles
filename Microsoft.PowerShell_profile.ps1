# boxmein's powershell config 
# ps core 7.2.2 || microsoft ps 5.0 something

#region Environment add-ons

$env:PYTHONIOENCODING = "utf-8"

#endregion

#region ALIASES

set-alias -Option AllScope -Name cat        -Value get-content
set-alias -Option AllScope -Name cd         -Value set-location
set-alias -Option AllScope -Name clear      -Value clear-host
set-alias -Option AllScope -Name cp         -Value copy-item
set-alias -Option AllScope -Name h          -Value get-history
set-alias -Option AllScope -Name history    -Value get-history
set-alias -Option AllScope -Name kill       -Value stop-process
set-alias -Option AllScope -Name lp         -Value out-printer
set-alias -Option AllScope -Name mount      -Value new-mshdrive
set-alias -Option AllScope -Name mv         -Value move-item
set-alias -Option AllScope -Name popd       -Value pop-location
set-alias -Option AllScope -Name ps         -Value get-process
set-alias -Option AllScope -Name pushd      -Value push-location
set-alias -Option AllScope -Name pwd        -Value get-location
set-alias -Option AllScope -Name r          -Value invoke-history
set-alias -Option AllScope -Name rm         -Value remove-item
set-alias -Option AllScope -Name rmdir      -Value remove-item
set-alias -Option AllScope -Name echo       -Value write-output
set-alias -Option AllScope -Name rd         -Value remove-item
set-alias -Option AllScope -Name set        -Value set-variable

#endregion

##region MORE COMPLEX ALIASES


function settings {
  notepad "$env:USERPROFILE\dotfiles\Microsoft.PowerShell_profile.ps1"
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
$env:PATH += ";$env:LOCALAPPDATA\Programs\oh-my-posh\bin\"
oh-my-posh init pwsh --config $env:LOCALAPPDATA\Programs\oh-my-posh\themes\powerlevel10k_lean.omp.json | Invoke-Expression
#endregion

#region Fuck setup
iex "$(thefuck --alias)"
#endregion