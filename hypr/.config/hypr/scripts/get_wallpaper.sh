#! /bin/bash

current_wallpaper=$(waypaper --list | cut -d "\"" -f 8)

echo "\$new_wallpaper=$current_wallpaper" > ~/.config/hypr/scripts/wallpaper

exit
