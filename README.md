# dotfiles

@boxmein's personal dotfiles

- Be inspired from them
- Steal shell aliases from the shell/ folder
- Steal custom shell functions from shell/fpath folder (look at .zshrc to see how the folder is wired up)
- Steal the spacemacs config if you want 🪐

## How to adopt it 

On a completely clean computer:

- Add gpg setup or ssh key
- Install zsh if not already present
- Run these commands
- Restart shell: `exec zsh`
- 💥 boom you're done

```shell
git clone --recurse-submodules git@github.com:boxmein/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.zsh 
```