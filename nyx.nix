{ config, lib, pkgs, ... }: {
  home-manager.users.johannes = import ./home.nix;
}
