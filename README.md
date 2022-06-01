# dotfiles

Configuration files for zsh, tmux and neovim

## deps
- [packer.nvim](https://github.com/wbthomason/packer.nvim)
- [tmux](https://github.com/tmux/tmux)
- [zsh](https://ohmyz.sh/)
- [iterm2](https://iterm2.com/)
- [neovim](https://neovim.io/)
- [fzf](https://github.com/junegunn/fzf)
- [fd-find](https://github.com/sharkdp/fd)
- [ripgrep](https://github.com/BurntSushi/ripgrep)

## install
```bash
mkdir ~/self
git clone https://github.com/bercly0b/dotfiles.git ~/self/dotfiles

ln -s ~/self/dotfiles/lua ~/.config/nvim/lua
ln -s ~/self/dotfiles/snippets ~/.config/nvim/snippets

# next commands will overwrite your config files. be careful
echo "require('init')" > ~/.config/nvim/init.lua
echo "source-file ~/self/dotfiles/.tmux.conf" > ~/.tmux.conf
echo "source ~/self/dotfiles/.zshrc" > ~/.zsh.rc
rm ~/.config/nvim/init.vim
```

## TODO
- install script
