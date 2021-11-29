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
- Run the curl|zsh command (living on the edge)
- Restart shell: `exec zsh`
- 💥 boom you're done

```shell
curl https://raw.githubusercontent.com/boxmein/dotfiles/main/install.zsh | zsh
```