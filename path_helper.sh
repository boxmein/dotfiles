#!/usr/bin/env zsh
set -e 

# calculate PATH

slurp_path() {
  local paths=()

  if [[ -f /etc/paths ]]; then 
    paths+=("${(@f)"$(</etc/paths)"}")
  fi

  if [[ -d /etc/paths.d ]]; then 
    for f in /etc/paths.d/*; do 
      paths+=("${(@f)"$(<$f)"}")
    done 
  fi

  echo "export PATH=${(j/:/)paths}"
}


slurp_manpath() {
  local paths=()

  if [[ -f /etc/manpaths ]]; then 
    paths+=("${(@f)"$(</etc/manpaths)"}")
  fi

  if [[ -d /etc/manpaths.d ]]; then 
    for f in /etc/manpaths.d/*; do 
      paths+=("${(@f)"$(<$f)"}")
    done 
  fi

  echo "export MANPATH=${(j/:/)manpaths}"
}

slurp_path
slurp_manpath

