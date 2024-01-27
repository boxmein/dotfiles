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

    python310Packages.cfn-lint

    awscli2 
    packer
    rclone
  ];
}
