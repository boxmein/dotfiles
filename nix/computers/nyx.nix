{ config, lib, pkgs, ... }: {
  networking.hostName = "nyx";
  networking.computerName = "nyx";
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
  # environment.variables = { EDITOR = "nvim" };

  # programs.gpg
  # services
  services.emacs.enable = true;
}
