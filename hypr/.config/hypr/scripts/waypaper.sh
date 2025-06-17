#!/bin/bash

wallpaper="$1"

echo "Using wallpaper $wallpaper"
echo "Using wallpaper $wallpaper" >>/tmp/waypaper.log

# wal --cols16 lighten -n -q -i "$default_wallpaper"
# wal --cols16 lighten -i "$default_wallpaper"
wal --cols16 darken -s -n -i "$wallpaper"

killall -e waybar && waybar &

sleep 3
