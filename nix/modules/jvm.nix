{ config, pkgs, ... }: {
  home-manager.users.johannes.home.packages = with pkgs; [
    openjdk17 
    clojure
    gradle
    kotlin
    ktlint
    leiningen
  ];
}
