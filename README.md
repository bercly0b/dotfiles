# dotfiles

Configuration files for zsh, tmux and neovim

## Installation
```bash
sudo apt update && sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# next script will overwrite your zsh, neovim and tmux config files in home dir. be careful
bash -c "$(curl -fsSL https://raw.githubusercontent.com/bercly0b/dotfiles/master/init-env.sh)"
source ~/.zshrc
```

## Manual installation

First install dependencies

### dependencies
- [neovim](https://neovim.io/)
- [packer.nvim](https://github.com/wbthomason/packer.nvim)
- [tmux](https://github.com/tmux/tmux)
- [tpm](https://github.com/tmux-plugins/tpm)
- [zsh](https://ohmyz.sh/)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)
- [fzf](https://github.com/junegunn/fzf)
- [fd-find](https://github.com/sharkdp/fd)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [iterm2](https://iterm2.com/)

Next clone and init this repository

```bash
mkdir ~/self
git clone https://github.com/bercly0b/dotfiles.git ~/self/dotfiles

ln -s ~/self/dotfiles/lua ~/.config/nvim/lua
ln -s ~/self/dotfiles/snippets ~/.config/nvim/snippets

# next commands will overwrite your zsh, neovim and tmux config files in home dir. be careful
echo "require('init')" > ~/.config/nvim/init.lua
echo "source-file ~/self/dotfiles/.tmux.conf" > ~/.tmux.conf
echo "source ~/self/dotfiles/.zshrc" > ~/.zshrc
rm ~/.config/nvim/init.vim
```
