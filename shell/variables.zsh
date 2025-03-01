export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export HISTCONTROL=ignoredups:ignorespace
fpath=(
  $HOME/.dotfiles/shell/zsh-completions
  $fpath
)

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

