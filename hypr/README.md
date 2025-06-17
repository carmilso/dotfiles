# Hyprland (and friends) configuration

This directory hosts all of the configuration files related to my Wayland
compositor **Hyprland** as well as its companion utilities (*hypridle*,
*hyprlock* and *hyprpaper*).

Path layout:

```
hypr/.config/hypr/      # Hyprland core settings
      ├─ hyprland.conf  # Main compositor configuration
      ├─ hypridle.conf  # Idle-management (screen blanking / DPMS)
      ├─ hyprlock.conf  # Lock-screen styling and behaviour
      └─ hyprpaper.conf # Wallpaper daemon
```

Notable features:

* Dynamic workspace rules per monitor.
* Smooth animations and rounded corners tuned for 144 Hz screens.
* Built-in support for chevron style borders when a window is floating.
* Automatic wallpaper selection via hyprpaper.

Symlink or copy the `hypr/.config/hypr` folder into `~/.config` and restart
Hyprland to apply the settings.
