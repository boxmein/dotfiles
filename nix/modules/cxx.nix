{ config, pkgs, ... }: {
  home-manager.users.johannes.home.packages = with pkgs; [
    autoconf
    automake
    cmake
    binaryen
    ninja
    ccls
    pkg-config
  ];
}
