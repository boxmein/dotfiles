# NOTE: nothing useful should go in here!
export GO111MODULE=on
export GOPATH=$HOME/gopath/
export LANG=en_US.UTF-8
export EDITOR=nvim
export AWS_VAULT_BACKEND=pass

export boxGOOGLE_CLOUD_INSTALL_DIR=$HOME/.asdf/installs/gcloud/321.0.0/

. ~/.dotfiles/shell/path.zsh

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# nix stuff
[[ -f /etc/static/zshenv ]] && . /etc/static/zshenv
