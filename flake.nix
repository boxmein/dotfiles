# SETTING UP A MACOS COMPUTER WITH NIX
# (flake edition)
{
  description = "boxmein darwin flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-20.09-darwin";
    # nixpkgsUnstable.url = "github:nixos/nixpkgs/unstable";
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    #flake-utils.url = "github:numtide/flake-utils";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    #impermanence.url = "github:nix-community/impermanence/master";
    #nixos-generators.url = "github:nix-community/nixos-generators";
    # nixos-generators.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, darwin, home-manager, ... }@inputs:
    let configuration = { pkgs, ... }: {
        nix.package = pkgs.nixFlakes;
        services.nix-daemon.enable = true;
      };
    in
    {
    darwinConfigurations = {
      nyx = darwin.lib.darwinSystem rec {
        system = "x86_64-darwin";
        modules = [
          configuration
          home-manager.darwinModules.home-manager
          ./nyx.nix
        ];
      };
    };
  };
}
