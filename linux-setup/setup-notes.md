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

- make bash completion case insensitive
	- add or uncomment `set completion-ignore-case On` in /etc/inputrc
	- to only change for the user create an `~/.inputrc` file and add it there
	- source: https://askubuntu.com/questions/87061/can-i-make-tab-auto-completion-case-insensitive-in-bash   

- only show current dir in bash prompt 
	- Change the \w (lowercase) to \W (uppercase) in your bashrc
	- source: https://superuser.com/questions/60555/show-only-current-directory-name-not-full-path-on-bash-prompt

- remap Ctrl+n to DOWN and Ctrl+p to UP
	- add Xmodmap file in this folder under `~/.Xmodmap`
	- then add the following in `/usr/share/X11/xkb/symbols/us`  (or whichever keyboard layout you are using)
		```
		key <AC07> {    [   n,  N,  Down    ]   };
		key <AC08> {    [   p,  P,  Up      ]   };
		```
	- run `xmodmap ~/.Xmodmap`

