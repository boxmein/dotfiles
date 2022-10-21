# ############################################################################ #
#
# Aliases
#
# ############################################################################ #

. ~/.dotfiles/shell/aliases.kubernetes.zsh
. ~/.dotfiles/shell/aliases.git.zsh

alias vim="nvim"
alias ec="emacsclient"
alias renix="darwin-rebuild switch --flake ~/.dotfiles"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias l='exa'
alias sl='exa'       # choo choo
alias ls='exa'
alias ll='exa -hal'
alias la='exa -A'
alias eit='exit'     # this happens too often
alias ös='exa'       # this too
alias rm='rm -v'

alias nets='ping 8.8.8.8'
alias st='speedtest'
alias lzd="lazydocker"

# fuzzy-filter through processes, kill the selected ones
alias ctf-enable="source ~/.dotfiles/shell/functions.ctf.zsh"

alias cd..="cd .." # my space key is iffy
alias lanip="ifconfig | awk '/inet/ { print $2 }'"

# easier management
alias dotfiles="pushd ~/.dotfiles"

alias dredd="docker run -it -v \$PWD:/api -w /api apiaryio/dredd dredd"

alias gil="gh issue list -a @me"
alias ec="emacsclient"

# fzf-powered aliases
alias look="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias rgi="run-interactive-ripgrep"
