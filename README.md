# dotfiles

## install
- tmux
- zsh
- iterm2
- neovim
- fzf
- the_silver_searcher

## clone
```bash
mkdir ~/self
git clone https://github.com/bercly0b/dotfiles.git ~/self/dotfiles
mkdir ~/self/dotfiles/.vim/plugged
```

## configure
~/.vimrc
```bash
set runtimepath+=~/self/dotfiles/.vim
source ~/self/dotfiles/.vimrc
```

~/.tmux.conf
```bash
source-file ~/self/dotfiles/.tmux.conf
```

~/.zsh.rc
```bash
source ~/self/dotfiles/.zshrc
```

~/.config/nvim/init.vim
```bash
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
```

## TODO
- path no node in vimrc
