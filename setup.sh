#!/bin/zsh

## sh エミュレーションモード
emulate -R sh

# setup terminal
## set zsh config
ln -nfs ~/dotfiles/.zshrc ~/.zshrc
source ~/.zshrc

## link git config
ln -nfs ~/dotfiles/.gitconfig ~/.gitconfig
ln -nfs ~/dotfiles/git ~/.config/git

## link idea vim
ln -nfs ~/dotfiles/ideavim/.ideavimrc ~/.ideavimrc

## link tmux config
ln -nfs ~/dotfiles/.tmux.conf ~/.tmux.conf

## link alacritty config
ln -nfs ~/dotfiles/alacritty ~/.config/alacritty

## link neovim config
ln -nfs ~/dotfiles/nvim ~/.config/nvim

## link gitui config
ln -s ~/dotfiles/gitui/key_config.ron ~/Library/Application\ Support/gitui/key_config.ron

## make directory .config
mkdir -p ~/.config

## install brew
if ! which brew > /dev/null; then
    echo "[INFO] install brew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
    echo "[INFO] brew is already installed"
fi

## install tmux
if ! which tmux > /dev/null; then
    echo "[INFO] install tmux"
    brew install tmux
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo "[INFO] tmux is already installed"
fi

## install alacritty
if ! which alacritty > /dev/null; then
    echo "[INFO] install alacritty"
    brew cask install alacritty
else
    echo "[INFO] alacritty is already installed"
fi

# setup editor
## install neovim
if ! which nvim > /dev/null; then
    echo "[INFO] install neovim"
    brew install neovim
else
    echo "[INFO] neovim is already installed"
fi

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

## install rg
if ! which rg > /dev/null; then
    echo "[INFO] install ripgrep"
    brew install ripgrep
else
    echo "[INFO] ripgrep is already installed"
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

## install exa
if ! which exa > /dev/null; then
  echo "[INFO] install exa"
  brew install exa
else
  echo "[INFO] exa is already installed"
fi

## install zoxide
if ! which zoxide > /dev/null; then
  echo "[INFO] install zoxide"
  brew install zoxide
else
  echo "[INFO] zoxide is already installed"
fi

## install git-delta
if ! which delta > /dev/null; then
  echo "[INFO] install git-delta"
  brew install git-delta
else
  echo "[INFO] git-delta is already installed"
fi

## install Github CLI
if ! which gh > /dev/null; then
  echo "[INFO] install Github CLI"
  brew install gh
  gh config set pager delta
else
  echo "[INFO] Github CLI is already installed"
fi

## install gitui
if ! which gitui > /dev/null; then
    echo "[INFO] install gitui"
    brew install gitui
else
    echo "[INFO] gitui is already installed"
fi

## install bat
if ! which bat > /dev/null; then
    echo "[INFO] install bat"
    brew install bat
else
    echo "[INFO] bat is already installed"
fi

## install navi
if ! which navi > /dev/null; then
    echo "[INFO] install navi"
    brew install navi
else
    echo "[INFO] navi is already installed"
fi

## install procs
if ! which procs > /dev/null; then
    echo "[INFO] install procs"
    brew install procs
else
    echo "[INFO] procs is already installed"
fi

## install grex
if ! which grex > /dev/null; then
    echo "[INFO] install grex"
    brew install grex
else
    echo "[INFO] grex is already installed"
fi

## install starship
if ! which starship > /dev/null; then
    echo "[INFO] install starship"
    brew install starship
else
    echo "[INFO] starship is already installed"
fi
