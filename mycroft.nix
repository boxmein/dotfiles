{ config, lib, pkgs, ... }: {
  users.users.johannes = {
    shell = pkgs.zsh;
  };
  home-manager.users.johannes = import ./home.nix;
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    discord
  ];

  # environment.systemPath = [ ... ];
  # environment.shellAliases = { ... };
  # environment.profiles  ???;
  # environment.launchDaemons
  # environment.launchAgents
  # environment.variables = { EDITOR = "nvim" };

  homebrew = {
    enable = true;

    brews = [
    	"qemu"
	"podman"
	"protobuf"
	"wireguard-tools"
	"semgrep"
	"tilt"
    ];

    casks = [
	"google-chrome"
	"google-cloud-sdk"
	"slack"
	"telegram-desktop"
	"postman"
	"sage"
    ];

    taps = [
	"boxmein/tap"
	"aws/tap"
	"aspect-build/aspect"
	"arthurk/virt-manager"
	"johanhaleby/kubetail"
    ];

    # masApps = [...]; (Installing from Mac App Store)
  };

  networking.hostName = "mycroft";
  networking.computerName = "mycroft";


  # programs.gpg


  # services
  services.emacs.enable = true;
}
