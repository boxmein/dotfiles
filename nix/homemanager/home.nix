{ pkgs, ... }:

let username = "johannes"; in
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

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
    gitui
    # GPG + SSH setup
    pinentry_mac # graphical pinentry

    # Python
    # python310                         # Python
    # python310Packages.pip
    # python310Packages.setuptools
    python310Packages.cfn-lint # cloudformation linter
    python310Packages.angr
    # python310Packages.pyyaml
    # poetry                            # python package manager

    # Java, Clojure, Kotlin
    openjdk11
    clojure
    gradle # build tool
    bazelisk
    kotlin
    ktlint
    leiningen # clojure build tool

    # Ruby
    ruby

    # Rust
    rustup

    # Go
    dbmate # database migration tool

    # Node.js

    # Haskell
    stack

    # OCaml / ReasonML
    opam

    # C, C++
    autoconf
    automake
    libtool
    cmake
    binaryen # c++ to wasm
    ninja # build tool
    ccls # c++ lsp server
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
    ctop # top(1) but for containers
    terraform # infra as code
    k9s # kubernetes htop
    lazydocker # multi panel dashboard for local docker
    skaffold # tooling for kubernetes
    kubectl # kubernetes cli
    kubernetes-helm # kubernetes tooling
    kubetail # kubernetes log viewing helper
    dnsmasq # local DNS 
    pstree # ps aux, except treeview

    # Editors
    emacs
    vscode
    neovim
    nano

    # Chat
    weechat

    # Git stuff
    git-secret

    # Stuff
    vips
    imagemagick # image manipulation
    # olm
    exa # ls(1) replacement
    act # github actions local emulator
    bat # cat with syntax highlighting
    bats # bash-based integration testing system
    calc # cli calculator
    coreutils
    yq # jq(1) for yaml
    jq # essential json manipulation cli
    cloc # count project lines of code
    k6 # load tester
    gnupg # digital signing + web of trust
    pandoc # convert between document file formats
    iperf # IP link performance testing tool
    mtr # my traceroute, combination of traceroute+ping
    redis
    socat # useful data plumbing tool (netcat on steroids)
    tldr # alternative manpages
    tmux # multipane terminal manager
    toilet # funny ascii text art
    websocat # websocket version of netcat
    fd # find file by name, fast version of `find . -name ...`
    ffmpeg # convert between media formats
    fish # alternative shell
    fswatch # cli to interact with fsevents / inotify
    fzf # fuzzy searcher terminal ui
    github-cli
    git-lfs
    graphviz # dot(1)
    qemu
    pinentry_mac
    openvpn
    pass # gpg-based password manager cli
    SDL2
    sqlite
    thefuck # fuck, i misspelled my last command
    tree-sitter # parser generator
    tor # network
    transmission # torrent
    unbound # dns server
    unzip
    p7zip # 7z(1)
    watch
    wget
    zsh
    htop
    bottom # current system load monitor
    parallel # gnu tool to parallelize commands
    z3 # symbolic execution tool
    scour # svg optimizer
    postgresql_14
    pv # cat BIGFILE.tar | pv | nc ... -- show a progress bar
    rename # pattern based renaming
    ripgrep # find file by content, `rg`
    rsync
    tree
    up # fancy version of pv
    screen
    ngrok # expose ports publicly
    # powershell
    syncthing # self hosted dropbox
    rclone # cli tool to copy files between s3, drive, icloud ...
    vips
    xz
    yajl
    unicorn
    fcrackzip
    mitmproxy # view, edit, and replay browser requests, really useful for web dev
    qrencode
    testdisk
    ipcalc # ip range calculator 
    openssl
    viddy # magic version of watch(1)
    asdf-vm # software version manager, supports per-directory versions
    packer # vm image builder
    lima # linux vm manager
    colima
    ffuf
    rnix-lsp # useful for writing nix
    nixpkgs-fmt
    powershell
    steampipe
    awscli2
    nodePackages."@angular/cli"
    fastlane
  ];
}
