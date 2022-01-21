# dotfiles

## install
- tmux
- zsh
- iterm2
- neovim
- fzf
- the_silver_searcher
- fd-find

## clone
```bash
mkdir ~/self
git clone https://github.com/bercly0b/dotfiles.git ~/self/dotfiles
mkdir ~/self/dotfiles/.vim/plugged
```

## configure
~/.config/nvim/init.vim
```bash
set runtimepath^=~/.vim
set runtimepath+=~/self/dotfiles/.vim
set runtimepath+=~/self/dotfiles
set runtimepath+=~/.vim/after

let &packpath=&runtimepath

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

## TODO
- install script
