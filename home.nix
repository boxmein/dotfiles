{ pkgs, ... }:

let username = "johannes"; in
{
  imports = [];

  programs.home-manager.enable = true;
  home.username = username;
  home.stateVersion = "22.05";
  home.packages = [
    # user packages
  ];
}
