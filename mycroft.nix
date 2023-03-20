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
    ];

    casks = [
	"google-cloud-sdk"
    ];

    taps = [];

    # masApps = [...]; (Installing from Mac App Store)
  };

  networking.hostName = "mycroft";
  networking.computerName = "mycroft";


  # programs.gpg


  # services
  services.emacs.enable = true;
}
