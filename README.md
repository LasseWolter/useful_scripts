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
   - `git clone https://github.com/LasseWolter/useful_scripts.git`
3. Run any command with sudo (e.g. `sudo ls`) so the terminal session can run `sudo` commands because some of the commands in the ansible scripts require elevated priveleges
   - do NOT run the whole ansible command below as `sudo`
4. Run the top-level playbook to install shell tooling, editors, tmux, node, etc:
   ```bash
   ansible-playbook setup_dev_machine.yml
   ```

### Using individual scripts
- Scripts in `random_scripts/` are standalone helpers. Inspect each script to confirm dependencies (e.g., `ffmpeg` for video tools) before running.
- Copy or symlink configuration files (e.g., `tmux/tmux.conf`, `vim/vimrc`) into your home directory to apply them.
- tmux helper scripts such as `tmux/select-project` expect `fzf` and default project directories; tweak the paths to match your environment.

## Contributing
Issues and pull requests are welcome. Feel free to file an issue if something is unclear or a script could be improved.
