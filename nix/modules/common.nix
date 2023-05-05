{ config, lib, pkgs, ... }: {

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.package = pkgs.nixFlakes;
  nix.registry.nixpkgs.flake = pkgs;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  services.nix-daemon.enable = true;
}
