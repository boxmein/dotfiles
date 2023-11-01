{ config, pkgs, ... }: {
  home-manager.users.johannes.home.packages = with pkgs; [
    earthly 
    bazel
    bazelisk
  ];
}
