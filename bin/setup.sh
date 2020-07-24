#!/bin/zsh

## sh エミュレーションモード
emulate -R sh

## install brew
if ! which brew > /dev/null; then
    echo "[INFO] install brew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
    echo "[INFO] brew is already installed"
fi

## setup zsh
ln -nfs ~/dotfiles/.zshrc ~/.zshrc
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source ~/.zshrc

## make .config dir
mkdir -p ~/.config

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
