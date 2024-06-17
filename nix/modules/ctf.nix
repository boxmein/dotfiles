{ config, pkgs, ... }: {
  home-manager.users.johannes.home.packages = with pkgs; [
    radare2
    tor
    python310
    python310Packages.pip
    python310Packages.setuptools

    websocat
    socat
    z3
    parallel
    powershell
    fcrackzip
    qrencode 
    testdisk
    ipcalc
    ffuf
    steampipe
    binwalk
    foremost
    unicorn
    yajl
    xz
    # ngrok
    gobuster
    dirb
    nikto
  ];
}
