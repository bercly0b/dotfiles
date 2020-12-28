# dotfiles


## install
- tmux
- zsh
- iterm2
- neovim
- fzf

## clone
```bash
mkdir ~/self
git clone link ~/self
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