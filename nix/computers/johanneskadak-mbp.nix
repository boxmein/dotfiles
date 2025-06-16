{ config, lib, pkgs, ... }: {
  system.stateVersion = 5;
  networking.hostName = "johanneskadak-mbp";
  networking.computerName = "johanneskadak-mbp";
  users.users.johannes = {
    shell = pkgs.zsh;
    home = "/Users/johannes";
  };
  home-manager.users.johannes = import ../homemanager/home.nix;
}
