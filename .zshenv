# NOTE: nothing useful should go in here!
export GO111MODULE=on
export GOPATH=$HOME/gopath/
export LANG=en_US.UTF-8
export EDITOR=nvim
export AWS_VAULT_BACKEND=pass
export C_HOST=http://10.0.37.8:8099
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export boxGOOGLE_CLOUD_INSTALL_DIR=$HOME/.asdf/installs/gcloud/321.0.0/
# Use 1password SSH agent for SSH support
export SSH_AUTH_SOCK=~/.1password/agent.sock

. ~/.dotfiles/shell/path.zsh
[[ -f ~/.dotfiles-private/.zshenv ]] && . ~/.dotfiles-private/.zshenv

# nix stuff
[[ -f /etc/static/zshenv ]] && . /etc/static/zshenv
