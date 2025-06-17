#!/bin/bash

activeWorkspace=$(hyprctl -j activeworkspace | jq '.id')
lastUsedWorkspace=$(hyprctl -j workspaces | jq 'max_by(.id) | .id')

calendarType=${1:-m}

hyprctl dispatch workspace $((lastUsedWorkspace + 1))
hyprctl dispatch -- exec kitty --class="calendar$calendarType" --title=calendar -e "zsh -ic 'cal$calendarType; tput cuu1; read -k 1; hyprctl dispatch workspace $activeWorkspace'"
# hyprctl dispatch -- exec kitty --class=calendar --title=calendar -e "zsh -ic 'calm; read'"
# hyprctl dispatch workspace "$activeWorkspace"
