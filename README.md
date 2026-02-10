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

_CONTINUE if on Mac_

5. Install alacritty .dmg file from https://alacritty.org/ and use workaround to open described [here]([url](https://github.com/alacritty/alacritty/issues/6500)))

<details>
   <summary>Alternative workaround to make cargo app function as a native app on Mac</summary>
   <ol>
  <li>Manually create an application for Alacritty
    <ol>
      <li>Open Script Editor (found in Applications &gt; Utilities).</li>
      <li>Paste the following code:
        <pre><code>do shell script "/Users/&lt;USERNAME&gt;/.cargo/bin/alacritty &gt; /dev/null 2&gt;&1 &amp;"</code></pre>
      </li>
      <li>Go to File &gt; Export.</li>
      <li>Set File Format to Application.</li>
      <li>Save it to your Applications folder.</li>
      <li>Right-click your new shortcut and select <code>Get Info</code>.</li>
      <li>Open <code>/Users/&lt;USERNAME&gt;/.local/share/alacritty</code> in Finder.</li>
      <li>Drag and drop the icon file directly onto the small icon in the top-left corner of the "Get Info" window.</li>
      <li>If using Raycast, to focus Alacritty with a hotkey, create another Application using Script Editor (using the above application keeps launching a new instance instead of focusing the open instance):
        <pre><code>tell application "System Events"
    set frontmost of process "alacritty" to true
end tell</code></pre>
      </li>
    </ol>
  </li>
</ol>

</details>

### Using individual scripts
- Scripts in `random_scripts/` are standalone helpers. Inspect each script to confirm dependencies (e.g., `ffmpeg` for video tools) before running.
- Copy or symlink configuration files (e.g., `tmux/tmux.conf`, `vim/vimrc`) into your home directory to apply them.
- tmux helper scripts such as `tmux/select-project` expect `fzf` and default project directories; tweak the paths to match your environment.

## Contributing
Issues and pull requests are welcome. Feel free to file an issue if something is unclear or a script could be improved.
