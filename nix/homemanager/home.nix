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
  programs.htop.enable = true;

  programs.git = {
    enable = true;
    lfs.enable = true;
  };
  programs.gh.enable = true;

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
      format = "$username$hostname$directory$git_branch$git_state$git_status$cmd_duration$character";
      directory.style = "blue";
      character = {
        success_symbol = "[❯](purple)";
        error_symbol = "[❯](red)";
        vimcmd_symbol = "[❮](green)";
      };
      git_branch = {
        format = "[$branch]($style)";
        style = "bright-black";
      };
      git_status = {
        format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](218) ($ahead_behind$stashed)]($style)";
        style = "cyan";
        conflicted = "​";
        untracked = "​";
        modified = "​";
        staged = "​";
        renamed = "​";
        deleted = "​";
        stashed = "≡";
      };
      git_state = {
        format = "\\([$state( $progress_current/$progress_total)]($style)\\) ";
        style = "bright-black";
      };
      cmd_duration = {
        format = "[$duration]($style) ";
        style = "yellow";
      };
    };
  };

  home.packages = with pkgs; [
    angle-grinder
    pre-commit
    neofetch
    colima
    direnv
    uv
    wireguard-tools
    opentofu
    hcloud
    ipmitool
    lnav
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
    _1password-cli
    gitui
    zip
    dbmate
    emacs30
    neovim
    nano
    weechat
    imagemagick # image manipulation
    calc # cli calculator
    yq # jq(1) for yaml
    jq # essential json manipulation cli
    cloc # count project lines of code
    k6 # load tester
    gnupg # digital signing + web of trust
    redis
    tmux # multipane terminal manager
    toilet # funny ascii text art
    fd # find file by name, fast version of `find . -name ...`
    fzf # fuzzy searcher terminal ui
    github-cli
    git-lfs
    graphviz # dot(1)
    qemu
    openvpn
    pass # gpg-based password manager cli
    unzip
    p7zip
    watch
    wget
    htop
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
    git-machete
    grype
    syft
    (google-cloud-sdk.withExtraComponents([
      google-cloud-sdk.components.gke-gcloud-auth-plugin
    ]))
    ispell
    kubectl
    ncdu
    pinentry_mac
    pipx
    pkgconf
    terraform-docs
    tflint
    tfsec
    trivy
    yadm
    pack
    fluxcd
    powerpipe
    steampipe
    clickhouse
    emacs
    docker
    docker-compose
    docker-buildx
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
