{ config, lib, pkgs, ... }: {
  networking.hostName = "tethys";
  networking.computerName = "tethys";
  users.users.johannes = {
    shell = pkgs.zsh;
    home = "/Users/johannes";
  };
  home-manager.users.johannes = import ../homemanager/home.nix;
  environment.systemPackages = with pkgs; [
    discord
  ];

  # environment.systemPath = [ ... ];
  # environment.shellAliases = { ... };
  # environment.profiles  ???;
  # environment.launchDaemons
  # environment.launchAgents
  environment.variables = {
    JAVA_HOME = "${pkgs.openjdk11.outputPath}";
  };

  # programs.gpg
  # services
  system.defaults.dock = {
    autohide = true;
    show-recents = false;
    orientation = "bottom";
  };

  system.defaults.finder = {
    AppleShowAllExtensions = true;
    AppleShowAllFiles = true;
  };

  services.emacs.enable = true;
}
