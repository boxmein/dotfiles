# NOTE: nothing useful should go in here!
export GO111MODULE=on
export GOPATH=$HOME/gopath/
export LANG=en_US.UTF-8
export EDITOR=emacsclient
export AWS_VAULT_BACKEND=pass

export boxGOOGLE_CLOUD_INSTALL_DIR=$HOME/.asdf/installs/gcloud/321.0.0/

. ~/.dotfiles/shell/path.zsh
[[ -f ~/.dotfiles-private/.zshenv ]] && . ~/.dotfiles-private/.zshenv

if [[ -z "$SSH_AUTH_SOCK" || "$SSH_AUTH_SOCK" == *com.apple.launchd* ]]; then
	export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
fi
# nix stuff
[[ -f /etc/static/zshenv ]] && . /etc/static/zshenv
