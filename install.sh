#!/bin/bash

set -eo pipefail

function install_nvim() {
    wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
    chmod u+x nvim.appimage
    ./nvim.appimage --appimage-extract
    curdir=$(pwd)
    ln -s $curdir/squashfs-root/usr/bin/nvim /usr/bin/nvim
}

install_nvim

curl -fLo \
     ~/.config/nvim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pip3 install --user --upgrade neovim
gem install --user-install neovim

cp ./init.vim ~/.config/nvim/init.vim

nvim --headless +PlugUpgrade +PlugClean! +PlugUpdate +qall
