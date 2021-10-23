#!/bin/bash

old_dir="$PWD"

mkdir -p ~/AppImages
cd ~/AppImages

if [ -f "nvim.appimage" ]; then
  echo "nvim.appimage exists. Would you like to override?  - yes/[no]"
  read answer
fi

if [ $answer == "yes" ]; then
  wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage -O nvim.appimage
  chmod +x nvim.appimage
fi

cd $old_dir
