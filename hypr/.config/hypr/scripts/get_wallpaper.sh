#! /bin/bash

current_wallpaper="$(cat $HOME/.cache/wal/wal)"

echo "\$new_wallpaper=$current_wallpaper" > ~/.config/hypr/scripts/wallpaper

exit
