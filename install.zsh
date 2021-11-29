#!/bin/zsh
set -eu

if [[ ! -d ~/.dotfiles ]]; then 
	echo "No ~/.dotfiles, cloning..."
	git clone --recurse-submodules git@github.com:boxmein/dotfiles.git ~/.dotfiles
fi

if [[ ! -d ~/.dotfiles-private ]]; then  
	echo "No ~/.dotfiles-private, cloning..."
	git clone --recurse-submodules git@github.com:boxmein/dotfiles-private.git ~/.dotfiles-private
fi

project_root=~/.dotfiles
cd $project_root

if [[ ! -f ./.emacs.d/LICENSE ]]; then 
	echo "updating submodules..."
	git submodule update --init 
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
