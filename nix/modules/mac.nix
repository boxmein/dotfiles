{ config, pkgs, ... }: {
  services.nix-daemon.enable = true;
  homebrew = {
    enable = true;

    brews = [
      "cloudformation-guard"
      "semgrep"
      "tilt"
      "ctop"
      "radare2"
      "just"
      "calc"

      "pinentry-mac"
      # "qemu"
      "podman"
      "protobuf"
      "wireguard-tools"
      "semgrep"
      "tilt"
    ];

    casks = [
      "docker"
      "postman"
      # "google-chrome"
      "google-cloud-sdk"
      # "slack"
      # "telegram-desktop"
      "postman"
      # "sage"
    ];

    taps = [
      "boxmein/tap"
      "aws/tap"
      "aspect-build/aspect"
      "arthurk/virt-manager"
      "johanhaleby/kubetail"
    ];

    # masApps = [...]; (Installing from Mac App Store)
  };
}
