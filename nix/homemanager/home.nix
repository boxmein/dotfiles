{ pkgs, ... }:

let username = "johannes"; in
rec
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # programs.zsh.plugins = ...
  home.username = username;
  home.stateVersion = "22.05";

  # environment.variables = { X = "Y"; };
  # environment.shellAliases = { ll = "ls -l"; };
  # environment.systemPath = ["${home}/bin"];
  # environment.shells = ["/bin/zsh"];

  # time.timeZone = "Europe/Tallinn";

  programs.exa = {
    enable = true;
    enableAliases = true;
  };

  programs.home-manager.enable = true;
  programs.bat.enable = true;
  # programs.tmux.enable = true;
  programs.vscode.enable = true;
  # programs.zsh.enable = true;

  programs.zsh = {
    enable = true;
    shellAliases = {
      "renix" = "darwin-rebuild switch --flake ~/.dotfiles";
    };
    initExtra = ''
      source ~/.dotfiles/.zshrc
    '';
    envExtra = ''
      source ~/.dotfiles/.zshenv
      source ~/.dotfiles/shell/path.zsh
    '';
  };

  home.packages = with pkgs; [
    # olm
    # poetry                            # python package manager
    # powershell
    # python310                         # Python
    # python310Packages.pip
    # python310Packages.pyyaml
    # python310Packages.setuptools
    (google-cloud-sdk.withExtraComponents [ google-cloud-sdk.components.gke-gcloud-auth-plugin ])
    R
    SDL2
    _1password-gui
    act # github actions local emulator
    ansible
    asdf-vm # software version manager, supports per-directory versions
    autoconf
    automake
    automake
    awscli2
    bat # cat with syntax highlighting
    bats # bash-based integration testing system
    bazelisk
    binaryen # c++ to wasm
    bottom # current system load monitor
    calc # cli calculator
    ccls # c++ lsp server
    clang
    cloc # count project lines of code
    clojure
    cmake
    colima
    coreutils
    ctop # top(1) but for containers
    dbmate # database migration tool
    dig
    discord
    dnsmasq # local DNS 
    element-desktop
    emacs
    exa # ls(1) replacement
    exfat
    fastlane
    fcrackzip
    fd # find file by name, fast version of `find . -name ...`
    ffmpeg # convert between media formats
    ffuf
    file
    firefox
    fish # alternative shell
    fswatch # cli to interact with fsevents / inotify
    fzf # fuzzy searcher terminal ui
    gcc
    git-branchless
    git-lfs
    git-secret
    github-cli
    gitui
    gnumake
    gnupg # digital signing + web of trust
    gnused
    go_1_19
    gptfdisk
    gradle # build tool
    graphviz # dot(1)
    htop
    imagemagick # image manipulation
    infracost
    ipcalc # ip range calculator 
    iperf # IP link performance testing tool
    ipfs
    jetbrains-mono
    jq # essential json manipulation cli
    just
    k3s
    k6 # load tester
    k9s # kubernetes htop
    killall
    kotlin
    ktlint
    kubectl # kubernetes cli
    kubernetes-helm # kubernetes tooling
    kubetail # kubernetes log viewing helper
    lazydocker # multi panel dashboard for local docker
    leiningen # clojure build tool
    libclang
    libstdcxx5
    libtool
    lima # linux vm manager
    lnav
    luajit
    minikube
    mitmproxy # view, edit, and replay browser requests, really useful for web dev
    mtr # my traceroute, combination of traceroute+ping
    nano
    neovim
    ngrok # expose ports publicly
    ninja # build tool
    nixpkgs-fmt
    nmap
    nodePackages."@angular/cli"
    nodejs-18_x
    opam
    openjdk11
    openvpn
    p7zip # 7z(1)
    packer # vm image builder
    pandoc # convert between document file formats
    parallel # gnu tool to parallelize commands
    pass # gpg-based password manager cli
    perl
    pinentry
    pinentry-qt
    pkgconfig
    poetry
    postgresql_15
    powershell
    pstree # ps aux, except treeview
    pv # cat BIGFILE.tar | pv | nc ... -- show a progress bar
    python310
    python310Packages.angr
    python310Packages.cfn-lint # cloudformation linter
    qemu
    qrencode
    rclone # cli tool to copy files between s3, drive, icloud ...
    redis
    remmina
    rename # pattern based renaming
    ripgrep # find file by content, `rg`
    rnix-lsp # useful for writing nix
    rsync
    ruby
    rustup
    scour # svg optimizer
    screen
    skaffold # tooling for kubernetes
    slack
    socat # useful data plumbing tool (netcat on steroids)
    sqlite
    stack
    steam
    steampipe
    syncthing # self hosted dropbox
    tcpdump
    terraform # infra as code
    testdisk
    thefuck # fuck, i misspelled my last command
    tldr # alternative manpages
    tmux # multipane terminal manager
    toilet # funny ascii text art
    tor # network
    transmission # torrent
    transmission-qt
    tree
    tree-sitter # parser generator
    unbound # dns server
    unicorn
    unzip
    up # fancy version of pv
    usbutils
    viddy # magic version of watch(1)
    vips    
    vscode
    watch
    websocat # websocket version of netcat
    weechat
    wget
    wireguard-tools
    wireshark
    wpscan
    xz
    yajl
    yarn
    yq # jq(1) for yaml
    z3 # symbolic execution tool
    zsh
  ];
}
