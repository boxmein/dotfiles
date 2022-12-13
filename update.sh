#!/bin/zsh
set -eu
cd "$(dirname $0)"

has_command() {
    command -v $1 2>/dev/null >/dev/null
    return $?
}


if has_command brew; then
    brew upgrade
fi

if has_command apt; then
    apt upgrade
fi

if has_command yay; then
    yay -Syu
fi

if has_command nix; then
    nix flake update
    nix flake lock

    if has_command darwin-rebuild; then
        darwin-rebuild switch --flake ~/.dotfiles
    fi
fi

