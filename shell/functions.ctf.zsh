#!/bin/bash


printf "\x1b[32m"
cat <<"EOF"
                 uuuuuuu
             uu$$$$$$$$$$$uu
          uu$$$$$$$$$$$$$$$$$uu
         u$$$$$$$$$$$$$$$$$$$$$u
        u$$$$$$$$$$$$$$$$$$$$$$$u
       u$$$$$$$$$$$$$$$$$$$$$$$$$u
       u$$$$$$$$$$$$$$$$$$$$$$$$$u
       u$$$$$$"   "$$$"   "$$$$$$u
       "$$$$"      u$u       $$$$"
        $$$u       u$u       u$$$
        $$$u      u$$$u      u$$$
         "$$$$uu$$$   $$$uu$$$$"
          "$$$$$$$"   "$$$$$$$"
            u$$$$$$$u$$$$$$$u
             u$"$"$"$"$"$"$u
  uuu        $$u$ $ $ $ $u$$       uuu
 u$$$$        $$$$$u$u$u$$$       u$$$$
  $$$$$uu      "$$$$$$$$$"     uu$$$$$$
u$$$$$$$$$$$uu    """""    uuuu$$$$$$$$$$
$$$$"""$$$$$$$$$$uuu   uu$$$$$$$$$"""$$$"
 """      ""$$$$$$$$$$$uu ""$"""
           uuuu ""$$$$$$$$$$uuu
  u$$$uuu$$$$$$$$$uu ""$$$$$$$$$$$uuu$$$
  $$$$$$$$$$""""           ""$$$$$$$$$$$"
   "$$$$$"                      ""$$$$""
     $$$"                         $$$$"


     H A C K E R M O D E
     E N A B L E D

     $ ctf-list
EOF
printf "\x1b[0m"

## CTF ALIASES!
alias ctf-start-php="docker run -p 7124:80 -v $(pwd):/app  -it webdevops/php-nginx-dev"
alias ctf-start-stego="docker run -it -v '$(pwd):/data' dominicbreuker/stego-toolkit /bin/bash"
alias ctf-tools="docker run -it -v '$(pwd):/data' ctf-tools"
alias ctf-kali="cd ~/Programs/Kali/ && ./run.sh"
alias ctf-nmap="nmap -T4 -v -sV --script=vuln -o nmap-vuln.txt"
alias ctf-docker="docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -v "$(pwd):/source" -it ubuntu:latest bash"


# radare2 binary analysis tool
alias strings="rabin2 -z"
alias rot13="tr 'A-Za-z' 'N-ZA-Mn-za-m'"

if type -f disable_autoswitch_virtualenv 2>/dev/null >/dev/null; then
  disable_autoswitch_virtualenv
fi

# ==================================================================================================================================================
# HASH CRACKING TOOLS
# ==================================================================================================================================================


crackzip() {
  zip2john $1 > $TMPDIR/zip.hash
  hashcat -w 3 -a 3 -m 13000 $TMPDIR/zip.hash ${@:2}
}

crackrar() {
  zip2john $1 > $TMPDIR/rar.hash
  hashcat -w 3 -a 3 -m 13000 $TMPDIR/rar.hash ${@:2}
}

cracksshprivkey() {
  openssl2john $1 > $TMPDIR/key.hash
  hashcat -w 3 -a 3 -m 13000 $TMPDIR/key.hash ${@:2}
}


source ctf-tools-venv-activate
