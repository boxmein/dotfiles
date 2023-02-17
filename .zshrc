# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt notify
setopt noclobber
setopt ignoreeof
setopt appendhistory
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups 
setopt hist_verify
setopt share_history
setopt autocd 
setopt extendedglob
setopt interactivecomments
unsetopt beep

bindkey -e

bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

zstyle :compinstall filename '~/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
autoload -Uz compinit
compinit -C

# 
## Antigen setup
#


# echo "Setting up antigen..."

source ~/.dotfiles/antigen.zsh

antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
# Must be the last thing to register ZLE related stuff!
antigen bundle zsh-users/zsh-syntax-highlighting
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

. $SRCDIR/shell/completions.zsh

# ############################################################################ #

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

command -v thefuck >/dev/null 2>/dev/null && source <(thefuck --alias)

[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

if [[ -n "$ITERM_SESSION_ID" ]]; then
  [[ -f ~/.dotfiles/iterm2-shell-integration.zsh ]] && source ~/.dotfiles/iterm2-shell-integration.zsh
fi

[[ -f /etc/static/zshrc ]] && . /etc/static/zshrc

unset SSH_AGENT_PID

# https://unix.stackexchange.com/questions/608842/zshrc-export-gpg-tty-tty-says-not-a-tty
# 1) powerlevel10k instant prompt affects this
# 2) recommended solution is to not use tty command
export GPG_TTY="$TTY"
gpg-connect-agent updatestartuptty /bye >/dev/null 2>/dev/null
