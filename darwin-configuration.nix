{ config, pkgs, ... }:

{
  imports = [
    <home-manager/nix-darwin>
  ];
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    python3
    python39Packages.pip
    pipenv
    neovim
    vim
    emacs
    pandoc
    # pg_top
    weechat
    yajl
    yq
    unicorn
    packer
    gradle
    bazel
    rustup
    stack
    ruby
    kubeval
    clojure
    terraform
    k9s
    opam
    # swift
    cmake
    kotlin
    ktlint
    git-secret
    act
    bat
    bats
    binaryen
    fcrackzip
    # foremost
    # hashcat
    httpie
    hugo
    iperf
    john
    kubespy
    lazydocker
    luajit
    mitmproxy
    mtr
    ncdu
    ninja
    perl
    qrencode
    # radare2
    redis
    socat
    tldr
    tmux
    toilet
    testdisk
    binwalk
    # checksec
    skaffold
    kubernetes-helm
    kubetail
    websocat
    R
    swiProlog
    leiningen
    adoptopenjdk-hotspot-bin-11
    nodejs
    google-cloud-sdk
    go
  ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  home-manager.useGlobalPkgs = true;

  home-manager.users.johannes = { config, pkgs, ... }: {
    programs.home-manager.enable = true;
    programs.command-not-found.enable = true;
    home.packages = with pkgs; [
      neovim
    ];
  };

  users.users.johannes.home = "/Users/johannes";
}

