#!/bin/bash

# assumes Linux and that all relevant packages are already installed
# TODO: create a file to autoinstall packages
# TODO: make it work on macOS

REPO=$HOME/Developer/configs
CONFIG=$HOME/.config

ln $REPO/dotfiles/zshrc $HOME/.zshrc
chsh -s `which zsh`

mkdir -p $CONFIG/bspwm
mkdir -p $CONFIG/sxhkd
mkdir -p $CONFIG/polybar

ln $REPO/bspwm/bspwmrc $CONFIG/bspwm/bspwmrc
ln $REPO/sxhkd/sxhdkrc $CONFIG/sxhkd/sxhkdrc
ln $REPO/polybar/config $CONFIG/polybar/config

mkdir -p $CONFIG/nvim/autoload
curl -fLo $CONFIG/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln $REPO/dotfiles/vimrc $CONFIG/nvim/init.vim

# install plugins and quit
vim -c PlugInstall -c qall!

