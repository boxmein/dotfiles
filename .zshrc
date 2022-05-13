# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Shell config!
export SHELL=/bin/zsh

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
UNAME=`uname`
SRCDIR=~/.dotfiles
SRCDIR_PRIVATE=~/.dotfiles-private

set -o notify
set -o noclobber
set -o ignoreeof

setopt appendhistory autocd extendedglob notify
unsetopt beep

bindkey -e

bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

zstyle :compinstall filename '~/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

autoload -Uz compinit
compinit

## configure autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history)

## Antigen setup
#


# echo "Setting up antigen..."

source ~/.dotfiles/antigen.zsh

antigen use oh-my-zsh
antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle djui/alias-tips

antigen theme romkatv/powerlevel10k

antigen apply

# echo "Setting up aliases/vars/functions..."

. $SRCDIR/shell/aliases.zsh
. $SRCDIR/shell/variables.zsh

[[ -f $SRCDIR_PRIVATE/.zshrc ]] && . $SRCDIR_PRIVATE/.zshrc

# OS-specific changes

if [[ "$UNAME" == "Darwin" ]]; then
  . $SRCDIR/shell/aliases.macos.zsh
elif [[ "$UNAME" == "Linux" ]]; then
  . $SRCDIR/shell/aliases.linux.zsh
fi

# Load completion customization
# . $SRCDIR/shell/debug-completions.zsh
. $SRCDIR/shell/completions.zsh

# ############################################################################ #


####
#
# Program support
#
####

# echo "Setting up program support..."

### NodeJS
export NODE_PATH="/usr/local/lib/node_modules"

# Custom zsh functions

fpath+=(
  ~/.dotfiles/shell/fpath
  ~/.dotfiles-private/shell/fpath
)

# just all functions in fpath are loaded in
# * (.:t) - wildcard options
#    ^ . means only files
#     ^ :t means only filename
autoload -Uz ~/.dotfiles/shell/fpath/*(.:t)
autoload -Uz ~/.dotfiles-private/shell/fpath/*(.:t)

## Fuck
# echo "\tSetting up thefuck..."
command -v thefuck >/dev/null 2>/dev/null && source <(thefuck --alias)

## FZF (fuzzy finder - <C-r> and **<Tab>)
# echo "\tSetting up fzf..."
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# echo "\tSetting up powerline..."
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

if [[ -n "$ITERM_SESSION_ID" ]]; then
  # echo "\tSetting up iterm shell integration..."
  [[ -f ~/.dotfiles/iterm2-shell-integration.zsh ]] && source ~/.dotfiles/iterm2-shell-integration.zsh
fi

# echo "\tSetting up nix..."
# nix stuff
[[ -f /etc/static/zshrc ]] && . /etc/static/zshrc

####
#
# Header
#
####

# clear

# echo "You are logged onto $COMPUTER"
# echo "Uptime: " `uptime`

# [[ -f "$SRCDIR/shell/motd.txt" ]] && cat $SRCDIR/shell/motd.txt

### GPG setup
unset SSH_AGENT_PID
# zshenv has the rest

# https://unix.stackexchange.com/questions/608842/zshrc-export-gpg-tty-tty-says-not-a-tty
# 1) powerlevel10k instant prompt affects this
# 2) recommended solution is to not use tty command
export GPG_TTY="$TTY"
gpg-connect-agent updatestartuptty /bye >/dev/null 2>/dev/null

### GPG end


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
