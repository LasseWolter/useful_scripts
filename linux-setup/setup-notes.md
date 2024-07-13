- set EurKey 
	- Display EurKey as option in the settings: https://askubuntu.com/questions/1327789/how-to-automatically-run-one-or-more-lines-of-code-after-booting

- install neovim using app image and move it to /opt/nvim/nvim as described here: 
	- https://github.com/neovim/neovim/blob/master/INSTALL.md#install-from-package

- to remap capslock key to escape:
	- GNOME 
		- run `setxkbmap -option caps:escape` 
		- add this to `.profile` to run it on every login 
		- source: https://askubuntu.com/questions/363346/how-to-permanently-switch-caps-lock-and-esc
	- GNOME with Wayland
		- run `gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"`
		- add this to `.profile` to run it on every login 
		- source: https://superuser.com/questions/1196241/how-to-remap-caps-lock-on-wayland



