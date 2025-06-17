# Waybar configuration

JSON, CSS and helper scripts for **waybar**, the slim status bar often paired
with Sway/Hyprland.

Layout overview:

* `config.jsonc`   – primary bar definition with modules for workspaces,
  clock, backlight, network, etc.  A `.bak` file is kept as a safe-guard.
* `colors-*.css`   – colour variables (default vs pywal generated).
* `style.css`      – main stylesheet with Flexbox layout rules.
* `scripts/`       – tiny bash/Lua helpers (backlight, VPN status, …).

Symlink the directory as `~/.config/waybar` and restart waybar to apply.
