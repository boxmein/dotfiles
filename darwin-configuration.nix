# SETTING UP A MACOS COMPUTER WITH NIX
#
# Stage 1: Getting nix
#
# sh <(curl -L https://nixos.org/nix/install) --daemon
#
# Stage 2: Getting nix-darwin 
#
# Read: https://github.com/LnL7/nix-darwin
# TL;DR:
# nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
# ./result/bin/darwin-installer
# 
# Stage 3: Home manager
#
# nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
# nix-channel --update
#
# Stage 4: Rebuild
# nixos-rebuild switch -I $HOME/.dotfiles/darwin-configuration.nix
#
# Future stuff:
# - https://rycee.gitlab.io/home-manager/options.html
# - Add more packages to nix management
#
#
# Troubleshooting:
# Error: error: file 'darwin' was not found in the Nix search path (add it using $NIX_PATH or -I)
# Solution: Find file "darwin" in ~/.nix-defexpr/channels.
# If not present, nix-channel --update
# If still not present, remove all channels, update and re-add all channels:
# nix-channel --remove <name>
# sudo nix-channel --update && nix-channel --update
# nix-channel --add https://github.com/LnL7/nix-darwin/archive/master.tar.gz darwin
# nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
# nix-channel --add https://channels.nixos.org/nixpkgs-unstable nixpkgs
# nix-channel --update
#
# Error: error: file 'darwin-config' was not found in the Nix search path (add it using $NIX_PATH or -I), at /nix/store/f657vb8a4aqb7d1dln6wi4a1mh69s5ab-darwin/darwin/default.nix:2:19
# Solution: Remember to use -I to specify location:
# darwin-rebuild switch -I darwin-config=$HOME/.nixpkgs/darwin-configuration.nix
# 

{ config, pkgs, ... }:
let
  unstable = import <nixpkgs-unstable> { };
in
{
  imports = [
    <home-manager/nix-darwin>
  ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    # Python
    python3
    python39Packages.pip
    python39Packages.setuptools
    python39Packages.psycopg2
    python39Packages.setuptools
    pipenv
    poetry

    # Java, Clojure, Kotlin
    clojure
    gradle
    bazel_5
    kotlin
    ktlint
    leiningen
    adoptopenjdk-hotspot-bin-11

    # Ruby
    ruby

    # Rust
    rustup

    # Go
    go_1_17

    # Node.js
    nodejs
    yarn

    # Haskell
    stack

    # OCaml / ReasonML
    opam

    # C, C++
    autoconf
    automake
    libtool
    cmake
    binaryen
    ninja
    ccls
    pkgconfig
    # clang, llvm provided by macOS

    # Lua
    luajit

    # Perl
    perl

    # Prolog
    swiProlog

    # R
    R

    # Cloud tools 
    # packer (mark as broken)
    kubeval
    terraform
    k9s
    kubespy
    lazydocker
    skaffold
    kubectl
    kubernetes-helm
    kubetail
    google-cloud-sdk
    # ansible (beautifulsoup unit tests fail)
    # aws-sam-cli (beautifulsoup unit tests fail)
    # awscli2 (beautifulsoup unit tests fail)
    ctop
    dnsmasq
    docbook5
    podman
    gvproxy # implicit dependency of podman
    pstree
    mqttui

    # Editors
    # neovim (broken on nix flakes)
    # vim
    emacs
    vscode

    # Chat
    # slack
    # telegram-desktop
    # element-desktop
    # ms teams
    discord
    weechat

    # Git stuff
    git-secret

    # Stuff
    vips
    imagemagick
    libvirt
    exa
    act
    bat
    bats
    calc
    coreutils
    yq
    jq
    gnupg
    pandoc
    httpie
    hugo
    iperf
    mtr
    ncdu
    redis
    socat
    tldr
    tmux
    toilet
    websocat
    fd
    ffmpeg
    fish
    fswatch
    fzf
    github-cli
    git-lfs
    graphviz
    qemu
    libvirt
    pinentry_mac
    openvpn
    wireguard
    pass
    _1password
    browserpass
    # pg_top (unsupported system)
    SDL2
    # squid (unsupported)
    sqlite
    thefuck
    tree-sitter
    tor
    transmission
    unbound
    unzip
    p7zip
    watch
    wget
    zsh
    htop
    bottom
    parallel
    z3
    postgresql
    pv
    rename
    ripgrep
    rsync
    tree
    up
    screen
    ngrok
    powershell
    syncthing
    aws-vault
    rclone
    vips
    imagemagick
    xz

    # CTF tools
    yajl
    unicorn
    fcrackzip
    # foremost (unsupported)
    # hashcat (unsupported)
    john
    mitmproxy
    qrencode
    radare2
    testdisk
    binwalk
    # checksec (unsupported)
    fcrackzip
    # mysql-client (libressl-3.4.0 compile fails)
    # netcat (libressl-3.4.0)
    ncat
    # wireshark (collision between wireshark-cli and wireshark-qt)
    tshark
    # postman (unsupported)

    # To consider:
    # https://github.com/oxalica/rust-overlay
    # Firefox
    # iTerm2
    # google-chrome
    # ipcalc
    # ranger
    # kail
    # kops
    # kubernetes-helm
    # minikube
    # aws-sam-cli
    # skhd
    # yabai
    openssl
  ];

  # environment.variables = { X = "Y"; };
  # environment.shellAliases = { ll = "ls -l"; };
  # environment.systemPath = ["${home}/bin"];
  # environment.shells = ["/bin/zsh"];

  # time.timeZone = "Europe/Tallinn";

  # system.defaults.dock = { autohide = true; }

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  nixpkgs.config.allowUnfree = true;

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
      # neovim
    ];
  };

  users.users.johannes.home = "/Users/johannes";
}

