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

source ~/.dotfiles/antigen.zsh
antigen use oh-my-zsh
antigen bundle asdf
antigen bundle aws
antigen bundle bazel
antigen bundle colored-man-pages
antigen bundle command-not-found
antigen bundle copyfile
antigen bundle docker
antigen bundle docker-compose
antigen bundle dotenv
antigen bundle fzf
antigen bundle gh
antigen bundle git
antigen bundle golang
antigen bundle gradle
antigen bundle helm
antigen bundle httpie
antigen bundle iterm2
antigen bundle kn
antigen bundle kubectl
antigen bundle minikube
antigen bundle thefuck
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
# Must be the last thing to register ZLE related stuff!
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme romkatv/powerlevel10k

antigen apply

. $SRCDIR/shell/aliases.zsh
. $SRCDIR/shell/variables.zsh

[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
[[ -f /etc/static/zshrc ]] && . /etc/static/zshrc
[[ -f $SRCDIR_PRIVATE/.zshrc ]] && . $SRCDIR_PRIVATE/.zshrc

# OS-specific changes

if [[ "$UNAME" == "Darwin" ]]; then
  . $SRCDIR/shell/aliases.macos.zsh
elif [[ "$UNAME" == "Linux" ]]; then
  . $SRCDIR/shell/aliases.linux.zsh
fi


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

[[ -n "$ITERM_SESSION_ID" ]] && [[ -f ~/.dotfiles/iterm2-shell-integration.zsh ]] && source ~/.dotfiles/iterm2-shell-integration.zsh

# https://unix.stackexchange.com/questions/608842/zshrc-export-gpg-tty-tty-says-not-a-tty
# 1) powerlevel10k instant prompt affects this
# 2) recommended solution is to not use tty command
export GPG_TTY="$TTY"
gpg-connect-agent updatestartuptty /bye >/dev/null 2>/dev/null
