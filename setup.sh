#!/bin/zsh

## sh エミュレーションモード
emulate -R sh

## make .config dir
mkdir ~/.config

## install brew
if ! which brew > /dev/null; then
    echo "[INFO] install brew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
    echo "[INFO] brew is already installed"
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

## setup zsh
ln -nfs ~/dotfiles/.zshrc ~/.zshrc
source ~/.zshrc

## install alacritty
if ! which brew > /dev/null; then
    echo "[INFO] install alacritty"
    brew cask install alacritty
else
    echo "[INFO] alacritty is already installed"
fi

ln -nfs ~/dotfiles/alacritty ~/.config/alacritty

## install neovim
if ! which nvim > /dev/null; then
    echo "[INFO] install neovim"
    brew install neovim
else
    echo "[INFO] neovim is already installed"
fi

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

## install python
if ! which python3 > /dev/null; then
    echo "[INFO] install python"
    brew install python
    pip3 install neovim
else
    echo "[INFO] python is already installed"
fi

## install nvm & yarn
if ! which nvm > /dev/null; then
    echo "[INFO] install nvm"
    brew install nvm
    nvm install v10
    npm install -g yarn neovim
else
    echo "[INFO] nvm is already installed"
fi

