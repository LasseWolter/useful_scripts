# useful_scripts

A collection of scripts, dotfiles, and playbooks I use to bootstrap development environments across Linux, macOS, and Windows (well, Windows not really, only if I'm forced to)

## Repo structure
- `ansible_playbooks/` – playbooks for setting up shells, vim/nvim, tmux, node, and copying scripts from other folders in this repo
- `create_hotspot_on_linux/` – configuration and notes for running a Linux Wi‑Fi hotspot.
- `linux-setup/` – personal setup notes for Linux desktops.
- `mac_setup/` – macOS-specific tweaks and utility scripts.
- `random_scripts/` – assorted helper scripts (video conversion, display tweaks, etc.).
- `shell_setup/` – shell configuration files (bash/zsh aliases, profiles).
- `tmux/` – tmux configuration and helper scripts for session/project selection.
- `vim/` – vim/neovim configuration files and installation helpers.
- `windows/` – PowerShell one-liners and notes.
- `zen-setup/` – configuration exports and notes for the Zen browser.

## Quick start
### Configure a dev machine with Ansible
1. Install Ansible on your target machine.
   - Linux: `sudo apt install ansible`
   - Mac: `brew install ansible`
   - Windows: Please don't, thx
2. Clone this repository to the machine
   ```bash
   git clone https://github.com/LasseWolter/useful_scripts.git
   ```
4. Run the top-level playbook to install shell tooling, editors, tmux, node, etc (you'll be prompted for your password because some operations require `sudo`):
   ```bash
   ansible-playbook setup_dev_machine.yml --ask-become-pass
   ```

_CONTINUE if on Mac (alternatively install .dmg and use workaround to open described [here]([url](https://github.com/alacritty/alacritty/issues/6500)))_

5. On Mac, you need to manually create an application for alacritty, otherwise, it's only acessible via terminal
   1. Open Script Editor (found in Applications > Utilities).
   2. Paste the following code:
   ```
   do shell script "/Users/<USERNAME>/.cargo/bin/alacritty > /dev/null 2>&1 &"
   ```
    3. Go to File > Export.
    4. Set File Format to Application
    5. Save it to your Applications folder
    6. Right-click your new shortcut and select `Get Info`
    7. Open `/Users/<USERNAME>/.local/share/alacritty` in Finder
    8. Drag and drop the icon file directly onto the small icon in the top-left corner of the "Get Info" window
    9. If using Raycast, to focus alacritty with a hotkey, create another Application using Script Editor (using the above application keeps launching a new instance instead of focussing the open instance):
    ```
    tell application "System Events"
    set frontmost of process "alacritty" to true
    end tell
    ```

### Using individual scripts
- Scripts in `random_scripts/` are standalone helpers. Inspect each script to confirm dependencies (e.g., `ffmpeg` for video tools) before running.
- Copy or symlink configuration files (e.g., `tmux/tmux.conf`, `vim/vimrc`) into your home directory to apply them.
- tmux helper scripts such as `tmux/select-project` expect `fzf` and default project directories; tweak the paths to match your environment.

## Contributing
Issues and pull requests are welcome. Feel free to file an issue if something is unclear or a script could be improved.
