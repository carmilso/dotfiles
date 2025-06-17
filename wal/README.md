# Pywal templates & colour-schemes

This directory contains resources for
[`pywal`](https://github.com/dylanaraps/pywal), the tool that generates colour
schemes from wallpapers.

Hierarchy:

* `wal/.config/wal/colorschemes/` – manually curated light & dark palettes that
  I prefer over the automatically generated ones.
* `wal/.config/wal/templates/`    – template files used by pywal to export the
  colours to different programs (shell, Xresources, etc.).

The folder is meant to be copied to `~/.config/wal` so that pywal can discover
the extra palettes and templates.
