# Shared path management
paths=(
  /run/current-system/sw/bin
  /usr/local/bin
  /usr/local/sbin
  $HOME/bin
  $HOME/.local/bin
  /sbin
  /bin
  /usr/bin
  /usr/sbin
)

# potential install site for snapcraft
if [[ -d "/snap/bin" ]]; then
  paths+=(
    /snap/bin
  )
fi

# potential install site for Metasploit Framework
if [[ -d "/opt/metasploit-framework/bin" ]]; then
  paths+=(
    /opt/metasploit-framework/bin
  )
fi

if [[ -d "$HOME/Programs/emsdk" ]]; then
  paths+=(
    $HOME/Programs/emsdk
  )
fi

if [[ -d "$HOME/Programs/ctf-tools/bin" ]]; then
  paths+=(
    $HOME/Programs/ctf-tools/bin
  )
fi

if [[ -d ~/Programs/flutter/bin ]]; then
  paths+=(~/Programs/flutter/bin)
fi

if [[ -d ~/Documents/Projects/ctf-tools/bin ]]; then
  paths+=(~/Documents/Projects/ctf-tools/bin)
fi

if [[ -d ~/.cargo/bin ]]; then
  paths+=(~/.cargo/bin)
fi

if [[ -d ~/.nix-profile/bin ]]; then 
  paths+=(~/.nix-profile/bin)
fi

# Add AVR tools to path
if [[ -d /Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/ ]]; then
  paths+=(/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin)
fi

# Add x-to-john tools to path
if [[ -d /usr/local/Cellar/john-jumbo/1.9.0/share/john ]]; then
  paths+=(/usr/local/Cellar/john-jumbo/1.9.0/share/john)
fi

export PATH="${(j/:/)paths}:$PATH"
