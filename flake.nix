# SETTING UP A MACOS COMPUTER WITH NIX
# (flake edition)
# Stage 1: Getting nix
#
#   $ sh <(curl -L https://nixos.org/nix/install) --daemon
#
# Stage 2: Getting nix-darwin & bootstrapping 
#
#   $ nix --extra-experimental-features nix-command --extra-experimental-features flakes run nix-darwin/nix-darwin-24.11\#darwin-rebuild -- switch --flake ~/.dotfiles
# 
# DONE!
# 
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
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgsDarwin.url = "github:nixos/nixpkgs/nixpkgs-24.11-darwin";
    nixpkgsUnstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:lnl7/nix-darwin/nix-darwin-24.11";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    #flake-utils.url = "github:numtide/flake-utils";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    #impermanence.url = "github:nix-community/impermanence/master";
    #nixos-generators.url = "github:nix-community/nixos-generators";
    # nixos-generators.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, darwin, home-manager, nixpkgsUnstable, ... }@inputs:
    let
      importPkgs = system: import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
      importUnstablePkgs = system: import nixpkgsUnstable {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
      configuration = { pkgs, ... }: {
        nix.package = pkgs.nixVersions.stable;
        nix.registry.nixpkgs.flake = nixpkgs;
        nix.extraOptions = ''
          experimental-features = nix-command flakes
        '';
        # services.nix-daemon.enable = true;
      };

    in
    {
      darwinConfigurations = {
        styx = darwin.lib.darwinSystem rec {
          system = "aarch64-darwin";
          modules = [
            configuration
            home-manager.darwinModules.home-manager
            ./nix/computers/styx.nix
            ./nix/modules/ctf.nix
            ./nix/modules/cxx.nix
            ./nix/modules/git.nix
            ./nix/modules/jvm.nix
            ./nix/modules/mac.nix
            ./nix/modules/python.nix
            ./nix/modules/sysadmin.nix
            ./nix/modules/tooling.nix
          ];
          specialArgs = inputs // rec {
            pkgs = importPkgs system;
            pkgsUnstable = importUnstablePkgs system;
          };
        };
	johanneskadak-mbp = darwin.lib.darwinSystem rec {
	  system = "aarch64-darwin";
	  modules = [
	    configuration
	    home-manager.darwinModules.home-manager
	    ./nix/computers/johanneskadak-mbp.nix
	  ];
	};
        mycroft = darwin.lib.darwinSystem rec {
          system = "x86_64-darwin";
          modules = [
	    configuration
            home-manager.darwinModules.home-manager
            ./nix/computers/mycroft.nix
            ./nix/modules/ctf.nix
            ./nix/modules/cxx.nix
            ./nix/modules/git.nix
            ./nix/modules/jvm.nix
            ./nix/modules/mac.nix
            ./nix/modules/python.nix
            ./nix/modules/sysadmin.nix
            ./nix/modules/tooling.nix
          ];
          specialArgs = inputs // rec {
            pkgs = importPkgs system;
            pkgsUnstable = importUnstablePkgs system;
          };
        };
      };
    };
}
