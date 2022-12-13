#!/bin/zsh
set -eu
cd "$(dirname $0)"

has_command() {
    command -v $1 2>/dev/null >/dev/null
    return $?
}

if has_command brew; then
    echo "Running brew upgrade..."
    brew upgrade || true
fi

if has_command apt-get; then
    echo "Running apt-get upgrade..."
    sudo apt-get upgrade
fi

if has_command yay; then
    echo "Running yay -Syu..."
    yay -Syu
fi

if has_command nix; then
    echo "Running nix flake update..."
    nix flake update
    nix flake lock

    if has_command darwin-rebuild; then
        echo "Switching to latest version..."
        darwin-rebuild switch --flake ~/.dotfiles
    fi
fi

