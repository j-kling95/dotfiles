#!/bin/bash


msgID="12345"

case $1 in
  increase)
    brightnessctl s 5%+
    current_brightness=$(brightnessctl | awk '/%/ {print $4}' | tr -d '()%')
    dunstify -h int:value:$current_brightness -t 500 -r $msgID "Brightness set to $current_brightness%"
    ;;
  decrease)
    brightnessctl s 5%-
    current_brightness=$(brightnessctl | awk '/%/ {print $4}' | tr -d '()%')
    dunstify -h int:value:$current_brightness -t 500 -r $msgID "Brightness set to $current_brightness%"
    ;;
  *)
    notify-send "Error"
    ;;
  esac
