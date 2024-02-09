{ config, lib, pkgs, pkgsUnstable, ... }: {
  networking.hostName = "johanneskadak-mbp";
  networking.computerName = "johanneskadak-mbp";
  users.users.johannes = {
    shell = pkgs.zsh;
    home = "/Users/johannes";
  };
  home-manager.users.johannes = import ../homemanager/home.nix;
  environment.systemPackages = with pkgs; [
    discord
    pinentry_mac
  ];

  # environment.systemPath = [ ... ];
  # environment.shellAliases = { ... };
  # environment.profiles  ???;
  # environment.launchDaemons
  # environment.launchAgents
  environment.variables = {
  };

  # programs.gpg
  # services
  system.defaults.dock = {
    autohide = true;
    show-recents = false;
    orientation = "bottom";
    mru-spaces = false;
  };

  system.defaults.finder = {
    AppleShowAllExtensions = true;
    AppleShowAllFiles = true;
  };

  system.defaults.NSGlobalDomain = {
    "com.apple.swipescrolldirection" = false;
  };
}
