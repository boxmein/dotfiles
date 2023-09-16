{ config, pkgs, ... }: {
  services.nix-daemon.enable = true;
  homebrew = {
    enable = true;

    brews = [];
    casks = [];
    taps = [];

    masApps = {
#	"Magnet" = 441258766;
    };

    # masApps = [...]; (Installing from Mac App Store)
  };
}
