# How to install and configure nvim from scratch

To install nvim with plugins and configurations run the following scripts in this order:
1. `install_nvim.sh` to install nvim as an appimage 
2. `nvim-update-alternatives.sh` to update commands like 'vim' and 'vimdiff' to point to your new nvim installation 
3. `install_coc.sh` to install the coc-nvim plugin
  - also downloads node if it's not installed 
4. `./install_vim_dependencies.sh` to install some other plugin dependencies
  - e.g. a node-server for the markdown extension
5. `./install_vim_plug_cmd.sh` to install vim-plug, a plugin manager for vim
6. `cp vimrc ~/.vimrc` to copy the vimrc with all configs and plugins listed
  - the vimrc uses plug (installed in previous step) to install vim-plugins 
7. run `vim`. This should open vim and install all the plugins listed in the `.vimrc` file you copied to your home-dir in step 6
