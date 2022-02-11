# dotfiles

## install
- [tmux](https://github.com/tmux/tmux)
- [zsh](https://ohmyz.sh/)
- [iterm2](https://iterm2.com/)
- [neovim](https://neovim.io/)
- [fzf](https://github.com/junegunn/fzf)
- [fd-find](https://github.com/sharkdp/fd)
- [ripgrep](https://github.com/BurntSushi/ripgrep)

## clone
```bash
mkdir ~/self
git clone https://github.com/bercly0b/dotfiles.git ~/self/dotfiles
```

## configure
~/.config/nvim/init.vim
```bash
set runtimepath^=~/.vim
set runtimepath+=~/self/dotfiles/snippets
set runtimepath+=~/self/dotfiles
set runtimepath+=~/.vim/after
let &packpath=&runtimepath
lua require('init')
```

~/.tmux.conf
```bash
source-file ~/self/dotfiles/.tmux.conf
```

~/.zsh.rc
```bash
source ~/self/dotfiles/.zshrc
```

## TODO
- install script
