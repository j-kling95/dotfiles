#!/usr/bin/env bash

FOLDER=~/wallpaper

menu () {
  WALLPAPER="$(for a in $HOME/wallpaper/*; do echo -en "$a\0icon\x1f$a\n" ; done | rofi -dmenu -config ~/.config/rofi/config_wallpapermenu.rasi)"


  case "$WALLPAPER" in
    *.*)
      wal -s --cols16 lighten -i $WALLPAPER && refresh
      ;;
    *)
      exit 0
      ;;
  esac

#  read -p "1=Dark Theme, 2=Light Theme: \n" theme 
#  echo $theme
#  
#  case "$theme" in
#    1)
#      wal -s --cols16 lighten -i $CHOICE && refresh
#      ;;
#    2)
#      wal -s -l --cols16 lighten -i $CHOICE && refresh
#      ;;
#  esac

}

refresh () {
  swww img $WALLPAPER;
  pkill waybar; source $HOME/.config/waybar/venv/bin/activate && hyprctl dispatch exec waybar;
  bash $HOME/.config/dunst/pywal.sh;
#  echo "\$new_wallpaper=$WALLPAPER" > ~/.config/hypr/scripts/wallpaper
  sed -i "1c\$new_wallpaper=$WALLPAPER" ~/.config/hypr/hyprlock.conf 
}

menu
kitty @ close-window
