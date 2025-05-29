{ config, pkgs, ... }: {
  home-manager.users.johannes.home.packages = with pkgs; [
    lazydocker
    ctop
    terraform
    k9s
    kubectl 
    skaffold 
    kubernetes-helm
    kubetail

    awscli2 
    packer
    rclone
  ];
}
