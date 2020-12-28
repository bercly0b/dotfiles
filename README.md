install
- tmux
- zsh
- iterm2
- neovim
- fzf

how to
```
mkdir ~/self
git clone link ~/self
mkdir ~/self/dotfiles/.vim/plugged
```

~/.vimrc
```
set runtimepath+=~/self/dotfiles/.vim
source ~/self/dotfiles/.vimrc
```

~/.tmux.conf
```
source-file ~/self/dotfiles/.tmux.conf
```

~/.zsh.rc
```
source ~/self/dotfiles/.zshrc
```