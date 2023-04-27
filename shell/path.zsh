# Shared path management

if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi

paths=(
  /run/current-system/sw/bin
  $HOME/.nix-profile/bin
  $HOME/.asdf/shims
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

if [[ -d ~/Documents/Projects/ctf-tools/bin ]]; then
  paths+=(~/Documents/Projects/ctf-tools/bin)
fi

if [[ -d ~/.cargo/bin ]]; then
  paths+=(~/.cargo/bin)
fi

# Add AVR tools to path
if [[ -d /Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/ ]]; then
  paths+=(/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin)
fi

# Add x-to-john tools to path
if [[ -d /usr/local/Cellar/john-jumbo/1.9.0/share/john ]]; then
  paths+=(/usr/local/Cellar/john-jumbo/1.9.0/share/john)
fi

if [[ -d ~/Documents/Projects/small-programs ]]; then
  paths+=("$HOME/Documents/Projects/small-programs")
fi

if [[ -d /usr/local/go/bin ]]; then
  paths+=(/usr/local/go/bin)
fi

if [[ -d "$HOME/perl5/bin" ]]; then 
  paths+=($HOME/perl5/bin)
fi

if [[ -d "$GOPATH/bin" ]]; then
  paths+=($GOPATH/bin)
fi

if [[ -d "/opt/asdf-vm/bin" ]]; then
  paths+=(/opt/asdf-vm/bin)
fi

if [[ -d "$HOME/.cargo/bin" ]]; then 
  paths+=("$HOME/.cargo/bin")
fi

export PATH="$PATH:${(j/:/)paths}"

