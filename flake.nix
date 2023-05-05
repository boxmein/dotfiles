# SETTING UP A MACOS COMPUTER WITH NIX
# (flake edition)
# Stage 1: Getting nix
#
# sh <(curl -L https://nixos.org/nix/install) --daemon
#
# Stage 2: Getting nix-darwin 
#
# Install nix-darwin:
# 
#   $ nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
#   $ ./result/bin/darwin-installer
# 
# Stage 3: bootstrap
#  
#   $ nix build ~/.dotfiles\#darwinConfigurations.nyx.system
#   $ ./result/sw/bin/darwin-rebuild switch --flake ~/.dotfiles 
# 
# DONE!
# Now, every time you change the nix config:
# 
#   $ darwin-rebuild switch --flake ~/.dotfiles
# 
# And every now and then, update deps:
# 
#   $ nix flake update
#   $ nix flake lock --update-input <xyz>


{
  description = "boxmein darwin flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-22.11-darwin";
    # nixpkgsUnstable.url = "github:nixos/nixpkgs/unstable";
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    #flake-utils.url = "github:numtide/flake-utils";
    home-manager.url = "github:nix-community/home-manager/release-22.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    #impermanence.url = "github:nix-community/impermanence/master";
    #nixos-generators.url = "github:nix-community/nixos-generators";
    # nixos-generators.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, darwin, home-manager, ... }@inputs:
    let
      importPkgs = system: import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
      configuration = { pkgs, ... }: {
        nix.package = pkgs.nixFlakes;
        nix.registry.nixpkgs.flake = nixpkgs;
        nix.extraOptions = ''
          experimental-features = nix-command flakes
        '';
        services.nix-daemon.enable = true;
      };

    in
    {
      nixosConfigurations = {
        trifle = nixpkgs.lib.nixosSystem
          rec {
            system = "x86_64-linux";
            modules = [
              configuration
              ./nix/modules/trifle.nix
            ];
            specialArgs = inputs // rec {
              pkgs = importPkgs system;
            };
          };
      };
      darwinConfigurations = {
        nyx = darwin.lib.darwinSystem rec {
          system = "x86_64-darwin";
          modules = [
            configuration
            home-manager.darwinModules.home-manager
            ./nix/modules/mac.nix
            ./nix/modules/nyx.nix
          ];
          specialArgs = inputs // rec {
            pkgs = importPkgs system;
          };
        };
        mycroft = darwin.lib.darwinSystem rec {
          system = "x86_64-darwin";
          modules = [
            home-manager.darwinModules.home-manager
            ./nix/modules/mac.nix
            ./nix/modules/mycroft.nix
          ];
          specialArgs = inputs // rec {
            pkgs = importPkgs system;
          };
        };
      };
    };
}
