{ config, lib, pkgs, ... }: {
  users.users.johannes = {
    shell = pkgs.zsh;
  };
  home-manager.users.johannes = import ./home.nix;
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    discord
  ];
}
