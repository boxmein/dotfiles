#!/bin/zsh
set -eu

project_root=$(git rev-parse --show-toplevel)
cd $project_root 

if [[ "$project_root" != "$HOME/.dotfiles" ]]; then 
	echo "Please clone me to ~/.dotfiles/! A lot of scripts rely on this!"
	exit 1
fi

common_dotfiles=(
	.asdfrc
	.bash_profile
	.bashrc
	.fzf.zsh
	.gitconfig 
	.gitignore 
	.inputrc
	.p10k.zsh
	.psqlrc
	.selected_editor
	.spacemacs
	.tmux.conf
	.zshenv 
	.zshrc
	antigen.zsh
	iterm2-shell-integration.zsh
)

function install_files {
	for f in "${1[@]}"; do 
		echo "$f => ~/$f"
		ln -s "$project_root/$f" "~/$f"
	done
}

install_files $common_dotfiles

if [[ "$(uname -s)" == "Linux" ]]; then 
	additional_dotfiles=(
		.alacritty.yml
		.conkyrc
		.gtkrc.mine 
		.xbindkeysrc
		.Xdefaults
		.xinitrc
		.Xresources
		.xscreensaver
	)

	install_files $additional_dotfiles

	ln -s /etc/pacman.conf $project_root/pacman.conf
fi

echo "Done! Computer assimilated."
echo "Remember to:"
echo "- Install the GPG secret key"
echo "- Install pass and the password store"
echo "- Run the brewfile?"
if [[ `uname -s` == "Darwin" ]]; then
	echo "- Disable Ctrl+Up/Left/Down/Right handlers in System Preferences"
	echo "- Select 'Natural Text Editing' in iTerm2 > Profiles > default > Keys"
fi
