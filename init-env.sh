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
sudo apt install -y tmux fd-find ripgrep htop libffi-dev libcurl4-gnutls-dev librtmp-dev
sudo ln -s $(which fdfind) /bin/fd

# nvim
_print "Installing Neovim"
curl -LO -s https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz
tar -xf nvim-linux64.tar.gz
export PATH=/home/hh/nvim-linux64/bin:$PATH

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

# npm deps
_print "Installing npm deps"
sudo npm install -g typescript typescript-language-server eslint_d

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
