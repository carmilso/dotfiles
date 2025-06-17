# Carlos' Dotfiles

This repository contains the personal configuration files I use on my Linux machines.  
They are tailored for a Wayland-centric workflow powered by **Hyprland** as the compositor and a collection of lightweight utilities.

> Feel free to copy anything that helps you, but remember to double-check paths and programs – things are set up for _my_ environment and hardware.

---

## Directory overview

| Directory  | Purpose                                                                                                             |
| ---------- | ------------------------------------------------------------------------------------------------------------------- |
| `hypr/`    | Main Hyprland compositor settings (`hyprland.conf`), per-monitor rules, animations and a high-resolution wallpaper. |
| `kitty/`   | Themes and settings for the **kitty** terminal: font stack, clipboard shortcuts, window padding, etc.               |
| `nvim/`    | My full **Neovim** setup powered by Lua; plugins are managed with _lazy.nvim_.                                      |
| `swaync/`  | Configuration for **Sway Notification Center** (`swaync`), the notification daemon used with Hyprland.              |
| `tofi/`    | Config for **tofi**, a fast Wayland launcher (rofi replacement).                                                    |
| `wal/`     | Pywal templates and scripts to propagate colours across applications.                                               |
| `waybar/`  | JSON / CSS files for **waybar**, the status bar shown at the top of the screen.                                     |
| `wlogout/` | Layout and styling for **wlogout**, the graphical logout / reboot menu.                                             |
| `yazi/`    | Configuration, plugins and colour-schemes for **yazi**, a TUI file manager similar to ranger.                       |

---

## Installation

I manage dotfiles with a bare-repo approach (`git --git-dir=$HOME/.cfg --work-tree=$HOME`).

```bash
# Clone into $HOME without overwriting existing files
git clone --bare git@github.com:carlos/dotfiles.git $HOME/.cfg

# Work-tree pointing to $HOME
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Checkout files and hide untracked files from status
config checkout
config config --local status.showUntrackedFiles no
```

Adjust the method to your taste; symlinks, stow or chezmoi work equally well.

### Using GNU Stow (alternative)

If you prefer to keep the dotfiles in a regular clone rather than a bare repo
you can leverage [GNU Stow](https://www.gnu.org/software/stow/) to create the
required symbolic links:

```bash
# from the root of this repository
stow ghostty hypr kitty nvim swaync tofi wal waybar wlogout yazi -t "$HOME"
```

Stow will replicate the directory structure under `~/.config` (and elsewhere)
by means of symlinks, making it trivial to add or remove components later on.

---

## License

All configuration files are released under the MIT license **except** third-party themes or snippets that keep their original licenses (see their respective folders).
