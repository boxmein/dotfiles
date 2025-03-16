# NOTE: don't echo in this file
export PAGER=less
export HISTFILE=~/.histfile
export HISTSIZE=50000
export SAVEHIST=10000
export UNAME=`uname`
export SRCDIR=~/.dotfiles
export SRCDIR_PRIVATE=~/.dotfiles-private
export GO111MODULE=on
export GOPATH=$HOME/gopath/
export LANG=en_US.UTF-8
export EDITOR=nvim
export C_HOST=http://10.0.37.8:8099
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"$HOME/perl5\""
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"

# OMZ
export DISABLE_UNTRACKED_FILES_DIRTY=true

# ZSH Autosuggest
export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#31d970"

# Path
. ~/.dotfiles/shell/path.zsh

# nix stuff
[[ -f /etc/static/zshenv ]] && . /etc/static/zshenv

. ~/.dotfiles/shell/agent.zsh
[[ -f ~/.dotfiles-private/.zshenv ]] && . ~/.dotfiles-private/.zshenv

export ASDF_GOLANG_MOD_VERSION_ENABLED=true
