{ config, lib, pkgs, ... }: {
  users.users.johannes = {
    shell = pkgs.zsh;
  };
  home-manager.users.johannes = import ./home.nix;
}
