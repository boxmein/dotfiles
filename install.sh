#!/bin/zsh
set -e

has_command() {
  command -v $1 >/dev/null 2>/dev/null
  return $?
}

if ! has_command nix && [[ ! -d /run/current-system ]]; then
    echo "Installing nixpkgs..."
    sh <(curl -L https://nixos.org/nix/install) --daemon
fi

if [[ `uname -s` == "Linux" ]]; then
    if ! has_command yay; then
        echo "Installing yay..."
        sudo pacman -S --needed \
            yay
    fi
    echo "Installing packages..."
    yay -S --needed < ./arch-packages.txt 
fi

echo "Installing rust stable..."
rustup default stable

# copy GPG key to x.pem
# gpg --import-keys ./x.pem
if [[ ! -d ~/.dotfiles ]]; then
  echo "Cloning dotfiles..."
	git clone git@github.com:boxmein/dotfiles.git $HOME/.dotfiles
fi

if [[ ! -d ~/.dotfiles-private ]]; then
  echo "Cloning dotfiles-private..."
	git clone git@github.com:boxmein/dotfiles-private.git $HOME/.dotfiles-private
fi

echo "Linking..."
set -x
ln -sf $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -sf $HOME/.dotfiles/.zshenv $HOME/.zshenv
ln -sf $HOME/.dotfiles-private/.pgpass $HOME/.pgpass
ln -sf $HOME/.dotfiles-private/.serverlessrc $HOME/.serverlessrc
ln -sf $HOME/.dotfiles-private/.aws $HOME/.aws/
ln -sf $HOME/.dotfiles-private/.config/fish $HOME/.config/fish/
ln -sf $HOME/.dotfiles-private/.config/weechat $HOME/.config/weechat/
ln -sf $HOME/.dotfiles/.asdrc $HOME/.asdfrc
ln -sf $HOME/.dotfiles/.alacritty.yml $HOME/.alacritty.yml
ln -sf $HOME/.dotfiles/antigen.zsh $HOME/antigen.zsh
ln -sf $HOME/.dotfiles/.gitconfig $HOME/.gitconfig
ln -sf $HOME/.dotfiles/.gitignore $HOME/.gitignore
ln -sf $HOME/.dotfiles/.p10k.zsh $HOME/.p10k.zsh
ln -sf $HOME/.dotfiles/.psqlrc $HOME/.psqlrc
ln -sf $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf
ln -sf $HOME/.dotfiles-private/.gnupg/gpg-agent.conf $HOME/.gnupg/gpg-agent.conf
ln -sf $HOME/.dotfiles-private/.gnupg/gpg.conf $HOME/.gnupg/gpg.conf
ln -sf $HOME/.dotfiles-private/.gnupg/sshcontrol $HOME/.gnupg/sshcontrol
ln -sf $HOME/.dotfiles/.emacs $HOME/.emacs
ln -sf $HOME/.dotfiles/.emacs.d $HOME/.emacs.d/
ln -sf $HOME/.dotfiles/.spacemacs $HOME/.spacemacs

sudo ln -sf $HOME/.dotfiles/etc/zshrc /etc/zshrc
sudo ln -sf $HOME/.dotfiles/etc/zprofile /etc/zprofile
sudo ln -sf $HOME/.dotfiles/usr/local/share/zsh/ /usr/local/share/zsh/

mkdir -p $HOME/.config/polybar $HOME/.config/plasma-workspace/env/
ln -sf $HOME/.dotfiles/.config/polybar/config.ini $HOME/.config/polybar/config.ini
ln -sf $HOME/.dotfiles/.config/polybar/start.sh $HOME/.config/polybar/start.sh
ln -sf $HOME/.dotfiles/.config/polybar/start.sh $HOME/.config/plasma-workspace/env/polybar.sh

set +x

if [[ ! -d ~/.SpaceVim.d ]]; then
  echo "Installing SpaceVim..."
  curl -sLf https://spacevim.org/install.sh | bash
  ln -sf $HOME/.dotfiles-private/.SpaceVim.d ~/.SpaceVim.d
fi

# sudo usermod -aG docker $(whoami)

if ! has_command tilt; then
  echo "Installing tilt..."
  curl -fsSL https://raw.githubusercontent.com/tilt-dev/tilt/master/scripts/install.sh | bash
fi

# template and insert the wireguard config
# set up tailscale
# tailscale up --allow-dns --allow-routes --shields-up

# gcloud auth login
# gcloud config set project calidity-prod
# gcloud auth configure-docker
# gcloud container clusters get-credentials falcon --region europe-north1 --internal-ip

# flatpak install com.slack.Slack

# todo: Google Drive fs mount, iCloud fs mount, fuse smb client, fuse sftp client

