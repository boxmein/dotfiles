{ config, lib, pkgs, ... }: {
  networking.hostName = "mycroft";
  networking.computerName = "mycroft";
  users.users.johannes = {
    shell = pkgs.zsh;
  };
  home-manager.users.johannes = import ../homemanager/home.nix;
  environment.systemPackages = with pkgs; [
    discord
  ];

  # environment.systemPath = [];
  # environment.profiles  ???;
  # environment.launchDaemons
  # environment.launchAgents
  # environment.variables = { EDITOR = "nvim" };

  # programs.gpg


  # services
  services.emacs.enable = true;
}
