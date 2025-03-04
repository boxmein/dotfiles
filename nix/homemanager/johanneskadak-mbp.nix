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
  ];


  home.file = {
  };
}
