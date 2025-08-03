#!/usr/bin/env bash

chooseoption () {
  CHOICE=$(echo -e "Lock\\nPoweroff\\nReboot" | rofi -I -dmenu -config ~/.config/rofi/config_dmenu.rasi -p "Choose option")

  case $CHOICE in
    Poweroff)
      notify-send "Shutting down in 3 seconds..."
      sleep 3
      systemctl poweroff 
      ;;
    Reboot)
      notify-send "Rebooting in 3 seconds..."
      sleep 3
      systemctl reboot
      ;;
    Lock)
      hyprctl dispatch exec hyprlock
      ;;
    *)
      exit 0
      ;;
  esac
}

chooseoption
