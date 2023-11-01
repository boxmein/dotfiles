{ config, pkgs, ... }: {
  home-manager.users.johannes = {
    home.file = {
      ".gitconfig".source = ../../.gitconfig;
    };
    home.packages = with pkgs; [
      git
      git-lfs 
      git-branchless 
      gitui
      git-secret
    ];
  };
}
