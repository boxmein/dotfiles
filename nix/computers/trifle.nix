{ config, lib, pkgs, ... }: {
  networking.hostName = "trifle";


  imports = [
    # Include the results of the hardware scan.
    ./trifle-hardware-configuration.nix
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.johannes = {
    isNormalUser = true;
    description = "johannes";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      (google-cloud-sdk.withExtraComponents [ google-cloud-sdk.components.gke-gcloud-auth-plugin ])
      _1password-gui
      alacritty
      ansible
      autoconf
      automake
      awscli2
      bat
      calc
      ccls
      clang
      cmake
      dig
      discord
      element-desktop
      exa
      exfat
      fcrackzip
      fd
      ffmpeg
      ffuf
      file
      firefox
      fzf
      gcc
      git-lfs
      git-secret
      github-cli
      gnumake
      gnupg
      go_1_19
      google-chrome
      gptfdisk
      htop
      infracost
      ipcalc
      iperf
      ipfs
      jetbrains-mono
      jq
      just
      k3s
      k6
      k9s
      killall
      kubectl
      kubernetes-helm
      kubetail
      lazydocker
      libclang
      libstdcxx5
      libtool
      lnav
      mitmproxy
      ngrok
      ninja
      nixpkgs-fmt
      nmap
      nodejs-18_x
      obsidian
      openvpn
      p7zip
      packer
      pandoc
      pass
      perl
      pinentry
      pinentry-qt
      pkgconfig
      poetry
      postgresql_15
      pv
      python310
      qemu
      rclone
      remmina
      rename
      ripgrep
      rnix-lsp
      rsync
      rustup
      rustup
      screen
      skaffold
      slack
      socat
      stack
      steam
      steampipe
      syncthing
      tcpdump
      terraform
      thefuck
      tor
      transmission
      transmission-qt
      tree
      unzip
      up
      usbutils
      vscode
      watch
      weechat
      wget
      wireguard-tools
      wireshark
      yarn
      z3
    ];
  };

  home-manager.users.johannes = import ../homemanager/home.nix;

  # environment.systemPath = [ ... ];
  environment.shellAliases = {
    "renix" = "sudo nixos-rebuild switch --flake ~/.dotfiles";
  };
  # environment.profiles  ???;
  # environment.launchDaemons
  # environment.launchAgents
  # environment.variables = { EDITOR = "nvim" };
  # programs.gpg


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-d51cea4e-b12a-46a1-8f7d-3ea03dcd70e5".device = "/dev/disk/by-uuid/d51cea4e-b12a-46a1-8f7d-3ea03dcd70e5";
  boot.initrd.luks.devices."luks-d51cea4e-b12a-46a1-8f7d-3ea03dcd70e5".keyFile = "/crypto_keyfile.bin";

  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Tallinn";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "et_EE.UTF-8";
    LC_IDENTIFICATION = "et_EE.UTF-8";
    LC_MEASUREMENT = "et_EE.UTF-8";
    LC_MONETARY = "et_EE.UTF-8";
    LC_NAME = "et_EE.UTF-8";
    LC_NUMERIC = "et_EE.UTF-8";
    LC_PAPER = "et_EE.UTF-8";
    LC_TELEPHONE = "et_EE.UTF-8";
    LC_TIME = "et_EE.UTF-8";
  };


  # Configure console keymap
  console.keyMap = "et";


  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
  ];

  services = {
    printing.enable = true;
    tailscale.enable = true;
    openssh.enable = true;
    flatpak.enable = true;
    fprintd = {
      enable = true;
      tod.enable = true;
      tod.driver = pkgs.libfprint-2-tod1-vfs0090;
    };
    weechat.enable = true;

    emacs = {
      enable = true;
      defaultEditor = true;
      # TODO: spacemacs
    };
    xserver = {
      layout = "ee";
      xkbVariant = "";
      enable = true;
      displayManager.sddm.enable = true;
      desktopManager.plasma5.enable = true;
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

  };

  programs = {
    tmux.enable = true;
    # TODO: my tmux config
    mtr.enable = true;
    git.enable = true;
    zsh.enable = true;
    neovim.enable = true;
    # TODO: spacenvim
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryFlavor = "qt";
    };
  };

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    22 # SSH
    6443
  ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  networking.firewall.checkReversePath = "loose";

  networking.extraHosts = ''
    127.0.0.1 cc.smartvent.test cc-api.smartvent.test api.smartvent.test smartvent.test id.smartvent.test
  '';

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

  hardware.bluetooth.enable = true;
  # https://github.com/NixOS/nixpkgs/issues/180175
  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
  systemd.services.systemd-networkd-wait-online.enable = lib.mkForce false;

  # This is required so that pod can reach the API server (running on port 6443 by default)
  services.k3s.enable = false;
  services.k3s.role = "server";
  services.k3s.extraFlags = toString [
    # "--kubelet-arg=v=4" # Optionally add additional args to k3s
  ];

  virtualisation.docker = {
    enable = true;
  };
}
