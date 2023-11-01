{ config, pkgs, ... }: {
  home-manager.users.johannes.home.packages = with pkgs; [
    python310
    python310Packages.pip
    python310Packages.setuptools
    poetry
  ];
}
