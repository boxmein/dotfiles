#!/bin/sh
set -e

has_command() {
  command -v $1 >/dev/null 2>/dev/null
  return $?
}

if ! has_command nix && [[ ! -d /run/current-system ]]; then
    sh <(curl -L https://nixos.org/nix/install) --daemon
fi

if [[ `uname -s` == "Linux" ]]; then
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
fi

rustup default stable

# copy GPG key to x.pem
# gpg --import-keys ./x.pem

if [[ ! -d ~/.dotfiles ]]; then
	git clone git@github.com:boxmein/dotfiles.git $HOME/.dotfiles
fi

if [[ ! -d ~/.dotfiles-private ]]; then
	git clone git@github.com:boxmein/dotfiles-private.git $HOME/.dotfiles-private
fi

ln -sf $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -sf $HOME/.dotfiles/.zshenv $HOME/.zshenv
ln -sf $HOME/.dotfiles-private/.pgpass $HOME/.pgpass
ln -sf $HOME/.dotfiles-private/.serverlessrc $HOME/.serverlessrc
ln -sf $HOME/.dotfiles-private/.aws $HOME/.aws
ln -sf $HOME/.dotfiles-private/.config/fish $HOME/.config/fish
ln -sf $HOME/.dotfiles-private/.config/weechat $HOME/.config/weechat
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
ln -sf $HOME/.dotfiles/.emacs.d $HOME/.emacs.d
ln -sf $HOME/.dotfiles/.spacemacs $HOME/.spacemacs

if [[ ! -d ~/.SpaceVim.d ]]; then
  curl -sLf https://spacevim.org/install.sh | bash
  ln -sf $HOME/.dotfiles-private/.SpaceVim.d ~/.SpaceVim.d
fi

# sudo usermod -aG docker $(whoami)

if ! has_command tilt; then
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
