# Shared path management

if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi

function _local_paths() {
  local possiblepaths=(
    $HOME/bin
    $HOME/.local/bin
    /snap/bin
    /opt/metasploit-framework/bin
    $HOME/Programs/emsdk
    $HOME/.cargo/bin
    /Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/
    /usr/local/Cellar/john-jumbo/1.9.0/share/john
    $HOME/Documents/Projects/small-programs
    /usr/local/go/bin
    $HOME/perl5/bin
    $GOPATH/bin
    /opt/asdf-vm/bin
    $HOME/.guard/bin
  )

  local paths=()

  for i in $possiblepaths; do 
    if [[ -d $i ]]; then 
      paths+=($i)
    fi 
  done

  export PATH="${(j/:/)paths}:$PATH"
  typeset -U PATH path
}

_local_paths
