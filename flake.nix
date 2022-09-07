# SETTING UP A MACOS COMPUTER WITH NIX
# (flake edition)
{
  description = "boxmein flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    darwin.url = "github:lnl7/nix-darwin/master";
  flake-utils.url = "github:numtide/flake-utils";
    home-manager.url = "github:nix-community/home-manager/master";
    impermanence.url = "github:nix-community/impermanence/master";
    nixos-generators.url = "github:nix-community/nixos-generators";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-generators.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, darwin, flake-utils, home-manager, impermanence, ... }@inputs: {
    darwinConfigurations = {
      nyx = darwin.lib.darwinSystem rec {
        system = "x86_64-darwin";
        modules = [
          ./home.nix
        ];
      };
    };
  };
}
