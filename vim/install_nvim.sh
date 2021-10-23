#!/bin/bash

old_dir="$PWD"

function install_nvim() {
  wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage -O nvim.appimage
  chmod +x nvim.appimage
  mkdir -p ~/.config/nvim/
  cat << EOM > ~/.config/nvim/init.vim
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath=&runtimepath
  source ~/.vimrc 
EOM
}

mkdir -p ~/AppImages
cd ~/AppImages

if [ -f "nvim.appimage" ]; then
  echo "nvim.appimage exists. Would you like to override?"
  echo "Note: This will also create a .config/nvim/init.vim file to use your .vimrc-file"
  echo "Override: yes/[no]"
  read answer; 
else 
  install_nvim
fi

if [[ $answer == "yes" ]]; then
  install_nvim
fi


cd $old_dir
