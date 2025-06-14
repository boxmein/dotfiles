{ pkgs, ... }:

let username = "johannes"; in
rec
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  home.username = username;
  home.stateVersion = "22.05";

  programs.eza = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.home-manager.enable = true;
  programs.bat.enable = true;
  programs.vscode.enable = false;

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      "renix" = "darwin-rebuild switch --flake ~/.dotfiles";
      "bazel" = "bazelisk";
    };
    initExtra = ''
      source ~/.dotfiles/.zshrc
    '';
    envExtra = ''
      source ~/.dotfiles/.zshenv
      source ~/.dotfiles/shell/path.zsh
      [[ -x /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
    '';
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      
    };
  };

  home.packages = with pkgs; [
    colima
    direnv
    uv
    wireguard-tools
    opentofu
    hcloud
    mosh
    ipmitool
    lnav
    mosquitto
    swi-prolog
    hashcat
    hashcat-utils
    gnuradio
    azure-cli
    nil
    just
    radare2
    zip
    tor
    protobuf
    mkcert
    gnused
    git-branchless
    nmap
    _1password
    gitui
    zip
    dbmate
    emacs30
    neovim
    nano
    weechat
    imagemagick # image manipulation
    bats # bash-based integration testing system
    calc # cli calculator
    yq # jq(1) for yaml
    jq # essential json manipulation cli
    cloc # count project lines of code
    k6 # load tester
    gnupg # digital signing + web of trust
    redis
    tldr # alternative manpages
    tmux # multipane terminal manager
    toilet # funny ascii text art
    fd # find file by name, fast version of `find . -name ...`
    fswatch # cli to interact with fsevents / inotify
    fzf # fuzzy searcher terminal ui
    github-cli
    git-lfs
    graphviz # dot(1)
    qemu
    openvpn
    pass # gpg-based password manager cli
    thefuck # fuck, i misspelled my last command
    unzip
    p7zip
    watch
    wget
    htop
    bottom # current system load monitor
    parallel # gnu tool to parallelize commands
    postgresql_16
    pv # cat BIGFILE.tar | pv | nc ... -- show a progress bar
    rename # pattern based renaming
    ripgrep # find file by content, `rg`
    rsync
    tree
    up # fancy version of pv
    screen
    viddy
    asdf-vm
    nixpkgs-fmt
    awscli2
    rustup
    sshpass
    (google-cloud-sdk.withExtraComponents([
	google-cloud-sdk.components.gke-gcloud-auth-plugin
    ]))
  ];


  home.file = {
    ".alacritty.toml".source = ../../.alacritty.toml;
    ".tmux.conf".source = ../../.tmux.conf;
    ".asdfrc".source = ../../.asdfrc;
    ".inputrc".source = ../../.inputrc;
    ".psqlrc".source = ../../.psqlrc;
    ".config/doom".source = ../../.config/doom;
  };
}
