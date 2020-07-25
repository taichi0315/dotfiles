#!/bin/zsh

## sh エミュレーションモード
emulate -R sh

# setup terminal
## set zsh config
ln -nfs ~/dotfiles/.zshrc ~/.zshrc
source ~/.zshrc

## install brew
if ! which brew > /dev/null; then
    echo "[INFO] install brew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
    echo "[INFO] brew is already installed"
fi

## make directory .config
mkdir ~/.config

## install alacritty
if ! which brew > /dev/null; then
    echo "[INFO] install alacritty"
    brew cask install alacritty
else
    echo "[INFO] alacritty is already installed"
fi

ln -nfs ~/dotfiles/alacritty ~/.config/alacritty

# setup editor
## install neovim
if ! which nvim > /dev/null; then
    echo "[INFO] install neovim"
    brew install neovim
else
    echo "[INFO] neovim is already installed"
fi

## set nvim config
ln -nfs ~/dotfiles/nvim ~/.config/nvim

## install dein.vim
if [ -d "~/.cache/dein" ]; then
    echo "[INFO] install dein.vim"
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ~/.cache/dein
    rm ./installer.sh
else
    echo "[INFO] dein.vim is already installed"
fi

## install fzf
if ! which fzf > /dev/null; then
    echo "[INFO] install fzf"
    brew install fzf
else
    echo "[INFO] fzf is already installed"
fi

## install ag
if ! which ag > /dev/null; then
    echo "[INFO] install ag"
    brew install the_silver_searcher
else
    echo "[INFO] ag is already installed"
fi

## install python & pip install neovim
if ! which python3 > /dev/null; then
    echo "[INFO] install python"
    brew install python
    pip3 install neovim
else
    echo "[INFO] python is already installed"
fi

## install node & npm install neovim
if ! which node > /dev/null; then
    echo "[INFO] install node"
    brew install nvm
    nvm install v10
    npm install -g yarn neovim
else
    echo "[INFO] node is already installed"
fi

