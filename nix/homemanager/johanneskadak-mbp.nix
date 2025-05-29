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

  home.packages = with pkgs; [
    angle-grinder
    pre-commit
    uv
    neofetch
    just
    zip
    gnused
    git-branchless
    nmap
    gitui
    nano
    calc
    yq
    k6
    redis
    tldr
    toilet
    pass
    wget
    bottom
    parallel
    pv
    rsync
    tree
    up
    screen
    viddy
    sshpass
  ];


  home.file = {
  };
}
