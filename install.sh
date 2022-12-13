#!/bin/sh
set -e

has_command() {
  command -v $1 >/dev/null 2>/dev/null
  return $?
}

if ! has_command yay; then
  sudo pacman -S --needed \
    yay
fi

yay -S --needed \
	wireguard-tools tailscale openvpn \
	steam runescape \
	neovim emacs visual-studio-code-bin intellij-idea-ce-eap \
	google-chrome \
	python python-poetry python-pip python-virtualenv \
	stack \
	clojure kotlin leiningen \
	python-cfn-lint ansible \
	asdf-vm \
	rustup \
	make cmake ninja gcc clang openssl-1.1 qemu-user-binfmt valgrind rr pkgconf \
	ctop terraform k9s skaffold kubectl cmctl krew-bin stern aws-vault aws-cli-v2 packer k6-bin \
	bc cloc ncdu tealdeer screen tmux fd fzf upcmd zip unzip time bind \
	iperf mtr iproute2 socat \
	docker \
	fish zsh \
	github-cli git git-lfs git-secret \
	qemu-full \
	1password pass \
	discord telegram-desktop weechat element-desktop slack-desktop \
	wget curl htop rsync ngrok syncthing rclone \
	python-z3-solver \
	nerd-fonts-jetbrains-mono ttf-jetbrains-mono nerd-fonts-ibm-plex-mono ttf-ibm-plex ttf-apple-emoji tor-browser \
	linux-headers xone-dkms xone-dongle-firmware


asdf plugin add nodejs; asdf install nodejs 16.18.0; asdf install nodejs 16.15.0; asdf global nodejs 16.18.0
asdf plugin add yarn; asdf install yarn 1.22.10; asdf global yarn 1.22.10
asdf plugin add gradle; asdf install gradle 7.6; asdf global gradle 7.6
asdf plugin add java; asdf install java openjdk-19; asdf global java openjdk-19
asdf plugin add kotlin; asdf install kotlin 1.7.22; asdf global kotlin 1.7.22
# asdf plugin add python; asdf install python 3.10.0; asdf global python 3.10.0
asdf plugin add golang; asdf install golang 1.19; asdf global golang 1.19
asdf plugin add ruby; asdf install ruby 2.6.3; asdf global ruby 2.6.3

rustup default stable

# copy GPG key to x.pem
# gpg --import-keys ./x.pem

if [[ ! -d ~/.dotfiles ]]; then
	git clone git@github.com:boxmein/dotfiles.git $HOME/.dotfiles
fi

if [[ ! -d ~/.dotfiles-private ]]; then
	git clone git@github.com:boxmein/dotfiles-private.git $HOME/.dotfiles-private
fi


ln -sf $HOME/.dotfiles/.zshrc ./.zshrc
ln -sf $HOME/.dotfiles/.zshenv ./.zshenv
ln -sf $HOME/.dotfiles-private/.pgpass ./.pgpass
ln -sf $HOME/.dotfiles-private/.serverlessrc ./.serverlessrc
ln -sf $HOME/.dotfiles-private/.aws ./.aws
ln -sf $HOME/.dotfiles-private/.config/fish ./.config/fish
ln -sf $HOME/.dotfiles-private/.config/weechat ./.config/weechat
ln -sf $HOME/.dotfiles/.asdrc ./.asdfrc
ln -sf $HOME/.dotfiles/.alacritty.yml ./.alacritty.yml
ln -sf $HOME/.dotfiles/antigen.zsh ./antigen.zsh
ln -sf $HOME/.dotfiles/.gitconfig ./.gitconfig
ln -sf $HOME/.dotfiles/.gitignore ./.gitignore
ln -sf $HOME/.dotfiles/.p10k.zsh ./.p10k.zsh
ln -sf $HOME/.dotfiles/.psqlrc ./.psqlrc
ln -sf $HOME/.dotfiles/.tmux.conf ./.tmux.conf
ln -sf $HOME/.dotfiles-private/.gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf
ln -sf $HOME/.dotfiles-private/.gnupg/gpg.conf ~/.gnupg/gpg.conf
ln -sf $HOME/.dotfiles-private/.gnupg/sshcontrol ~/.gnupg/sshcontrol
ln -sf $HOME/.dotfiles/.emacs ~/.emacs
ln -sf $HOME/.dotfiles/.spacemacs ~/.spacemacs

curl -sLf https://spacevim.org/install.sh | bash
ln -sf $HOME/.dotfiles-private/.SpaceVim.d ~/.SpaceVim.d

sudo usermod -aG docker $(whoami)

curl -fsSL https://raw.githubusercontent.com/tilt-dev/tilt/master/scripts/install.sh | bash

# template and insert the wireguard config
# set up tailscale
# tailscale up --allow-dns --allow-routes --shields-up

gcloud auth login
gcloud config set project calidity-prod
gcloud auth configure-docker
gcloud container clusters get-credentials falcon --region europe-north1 --internal-ip

flatpak install com.slack.Slack

# todo: Google Drive fs mount, iCloud fs mount, fuse smb client, fuse sftp client
