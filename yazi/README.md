# Yazi file-manager configuration

This folder houses my configuration for
[**yazi**](https://github.com/sxyazi/yazi), a blazing-fast TUI file manager
written in Rust.

Important files:

* `init.lua`      – entry point that tweaks key-bindings and options.
* `keymap.toml`   – exhaustive mapping file (a timestamped backup is also
  included).
* `plugins/`      – community plugins automatically loaded by yazi.
* `flavors/`      – colour themes matched to the rest of the desktop.
* `theme.toml`    – default theme (Catppuccin Mocha).

Symlink the directory as `~/.config/yazi` to use the configuration.
