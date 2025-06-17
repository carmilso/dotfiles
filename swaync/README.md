# Sway Notification Center (swaync)

Configuration files for **swaync**, the notification daemon typically paired
with Wayland compositors such as Sway and Hyprland.

Contents:

* `config.json`         – behaviour, timeouts, button actions.
* `style.css`           – look-and-feel, colours and animations.
* `icons/` & `images/`  – custom assets used in the CSS.

Two backup files (`*.bak`) are kept for quick rollback when experimenting with
new layouts.

Install by copying the `swaync` folder to `~/.config` and either restart
`swaync` or send it the `USR1` signal to reload.
