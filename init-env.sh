#!/bin/bash

set -e

_print () {
    if [[ $(command -v tput) ]]; then
        echo "$(tput setaf 2)### $1$(tput sgr0)"
    else
        echo "### $1"
    fi
}

_print "Updating packages information"
sudo apt update

_print "Installing dependencies"
sudo apt install -y tmux fd-find ripgrep htop
sudo ln -s $(which fdfind) /bin/fd

# nvim
_print "Installing Neovim"
curl -LO -s https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
sudo apt install -y ./nvim-linux64.deb
rm ./nvim-linux64.deb

# packer
_print "Installing Packer"
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# tmux tmp
_print "Installing tmux plugin manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# zsh-syntax-highlighting
_print "Installing zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git\
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# fzf
_print "Installing fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install

# eslint_d
if [[ $(command -v npm) ]]; then
    _print "Installing esling_d"
    sudo npm install -g eslint_d
fi

# flake8
if [[ $(command -v pip3) ]]; then
    _print "Installing flake8"
    pip3 install flake8
fi

# set vim as git editor
git config --global core.editor "nvim"

mkdir ~/self
mkdir -p ~/.config/nvim

_print "Applying configs"
git clone https://github.com/bercly0b/dotfiles.git ~/self/dotfiles

ln -s ~/self/dotfiles/lua ~/.config/nvim/lua
ln -s ~/self/dotfiles/snippets ~/.config/nvim/snippets

echo "require('init')" > ~/.config/nvim/init.lua
echo "source-file ~/self/dotfiles/.tmux.conf" > ~/.tmux.conf
echo "source ~/self/dotfiles/.zshrc" > ~/.zshrc

_print "Done!"
