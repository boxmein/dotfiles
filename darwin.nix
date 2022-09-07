{ pkgs, inputs, ... }:
let
  inherit (inputs) home-manager;
in
{
  nix.useDaemon = true;
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.johannes = import ./home.nix { pkgs = pkgs; };
  programs.zsh.enable = true;

  environment.darwinConfig = "$HOME/.dotfiles/darwin.nix";

  nixpkgs.overlays = import ./overlays.nix;
  nixpkgs.config.allowUnfree = true;

  services.nix-daemon.enable = true;
  nix.package = pkgs.nixFlakes;
  nix.gc.automatic = true;
  nix.useSandbox = false;
  nix.extraOptions = ''
  auto-optimise-store = true
  experimental-features = nix-command flakes
  '';

  environment.systemPackages = [
    
  ];
}
