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
antigen bundle 1password
antigen bundle aws
antigen bundle colored-man-pages
antigen bundle command-not-found
antigen bundle copyfile
antigen bundle emacs
antigen bundle fzf
antigen bundle gcloud
antigen bundle git
antigen bundle helm
antigen bundle invoke
antigen bundle kubectl
antigen bundle ssh
antigen bundle tailscale
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
# Must be the last thing to register ZLE related stuff!
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

. $SRCDIR/shell/aliases.zsh
. $SRCDIR/shell/variables.zsh

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

# https://unix.stackexchange.com/questions/608842/zshrc-export-gpg-tty-tty-says-not-a-tty
# 1) powerlevel10k instant prompt affects this
# 2) recommended solution is to not use tty command
export GPG_TTY="$TTY"
gpg-connect-agent updatestartuptty /bye >/dev/null 2>/dev/null

# https://github.com/alacritty/alacritty/issues/2950#issuecomment-706610878
printf "\e[?1042l"

