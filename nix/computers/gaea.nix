{ config, lib, pkgs, ... }: {
  networking.hostName = "gaea";
  networking.computerName = "gaea";
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
    JAVA_HOME = "${pkgs.openjdk11.out}";
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

  system.defaults.loginwindow = {
    GuestEnabled = true;
  };

  services.emacs.enable = true;
}
