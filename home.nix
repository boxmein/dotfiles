{ pkgs, ... }:

let username = "johannes"; in
{
  imports = [];

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
  # programs.zsh.enable = true
  # programs.zsh.shellAliases = { "ga" = "git add"; }
  # programs.zsh.plugins = ...
  home.username = username;
  home.stateVersion = "22.05";

  # environment.variables = { X = "Y"; };
  # environment.shellAliases = { ll = "ls -l"; };
  # environment.systemPath = ["${home}/bin"];
  # environment.shells = ["/bin/zsh"];

  # time.timeZone = "Europe/Tallinn";

  # system.defaults.dock = { autohide = true; }

  programs.exa = {
    enable = true;
    enableAliases = true;
  };

  programs.bat.enable = true;

  home.packages = with pkgs; [
    # GPG + SSH setup
    pinentry_mac

    # Python
    python310
    python310Packages.pip
    python310Packages.setuptools
    python310Packages.cfn-lint
    # python310Packages.psycopg
    python310Packages.pyyaml
    poetry

    # Java, Clojure, Kotlin
    clojure
    gradle
    bazel_5
    kotlin
    ktlint
    leiningen
    # adoptopenjdk-hotspot-bin-11

    # Ruby
    ruby

    # Rust
    rustup

    # Go
    # go1_19
    dbmate

    # Node.js
    nodejs-18_x
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
    ctop
    terraform
    k9s
    lazydocker
    skaffold
    kubectl
    kubernetes-helm
    kubetail
    google-cloud-sdk
    ctop
    dnsmasq
    # docbook5
    # podman
    gvproxy # implicit dependency of podman
    pstree

    # Editors
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
    # olm
    exa
    act
    bat
    bats
    calc
    coreutils
    yq
    jq
    cloc
    k6
    gnupg
    pandoc
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
    pinentry_mac
    openvpn
    pass
    _1password
    browserpass
    SDL2
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
    scour
    postgresql_14
    pv
    rename
    ripgrep
    rsync
    tree
    up
    screen
    ngrok
    # powershell
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
    mitmproxy
    qrencode
    testdisk
    # binwalk
    fcrackzip

    # To consider:
    # https://github.com/oxalica/rust-overlay
    # Firefox
    # iTerm2
    # google-chrome
    ipcalc
    # skhd
    # yabai
    openssl
    viddy
  ];
}
