{ config, lib, pkgs, ... }: {
  system.stateVersion = 5;
  users.users.johannes = {
    shell = pkgs.zsh;
    home = "/Users/johannes";
  };
  home-manager.users.johannes = import ../homemanager/home.nix;
  environment.systemPackages = with pkgs; [
    discord
    pinentry_mac
  ];

  # files to map:
  # environment.etc = { "hosts" = { source = ./hosts; }; };
  
  # shell commands:
  # environment.extraInit = ""; # global env initialization
  # environment.extraSetup = ""; # after system environment created
  # environment.loginShellInit = ""; # login shell init
  # environment.interactiveShellInit = ""; # during interactive shell initialization
  # environment.shellInit = ""; # shell init

  # configuration:
  # environment.systemPath = [ ... ];
  # environment.shellAliases = { ... };
  # environment.profiles  ???;
  # environment.launchDaemons
  # environment.launchAgents
  # environment.userLaunchAgents = { name = { enable = true; source = ./a; } };
  environment.variables = {
    JAVA_HOME = "${pkgs.openjdk11.out}";
  };

  # programs.gpg
  # services
  # fonts.packages = [ pkgs.dejavu_fonts ];

  # defaults write
  system.defaults = {
    dock = {
      autohide = true;
      show-recents = false;
      orientation = "bottom";
      mru-spaces = false;
    };

    finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
    };

    NSGlobalDomain = {
      "com.apple.swipescrolldirection" = false;
    };

    loginwindow = {
      GuestEnabled = true;
    };
  };

  # homebrew.enable = false;

  networking = {
    hostName = "styx";
    computerName = "styx";
    applicationFirewall.enable = true;

    # fqdn = "";
    # dns = [];
    # wakeOnLan.enable

    # wg-quick.interfaces.wg0
  };  
}
