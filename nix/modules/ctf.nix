{ config, pkgs, ... }: {
  home-manager.users.johannes.home.packages = with pkgs; [
    radare2
    tor
    wpscan
    python310
    python310Packages.pip
    python310Packages.setuptools
    python310Packages.angr

    websocat
    socat
    z3
    parallel
    powershell
    fcrackzip
    mitmproxy
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

  ];
}
