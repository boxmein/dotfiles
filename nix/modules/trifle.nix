{ config, lib, pkgs, ... }: {
  networking.hostName = "trifle";
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.johannes = {
    isNormalUser = true;
    description = "johannes";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      usbutils
      discord
      firefox
      _1password-gui
      gnupg
      pinentry
      pinentry-qt
      exa
      google-cloud-sdk
      alacritty
      rustup
      google-chrome

      rustup
      clang
      gcc

      stack

      python310

      autoconf
      automake
      libtool
      cmake
      ninja
      ccls
      pkgconfig

      perl

      terraform
      k9s
      lazydocker
      skaffold
      kubectl
      kubernetes-helm
      kubetail
      packer

      vscode

      git-secret
      bat
      calc
      jq
      k6
      pandoc
      iperf
      socat
      fd
      ffmpeg
      fzf
      github-cli
      git-lfs

      qemu
      openvpn
      pass
      thefuck

      tor
      transmission
      unzip
      p7zip
      watch
      wget
      pv
      rename
      ripgrep
      rsync
      tree
      up
      screen
      ngrok
      rclone
      syncthing
      htop
      killall

      z3
      fcrackzip
      mitmproxy
      ipcalc
      ffuf

      asdf-vm
      steampipe
      awscli2

      rnix-lsp
      nixpkgs-fmt

      jetbrains-mono
    ];
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
}
