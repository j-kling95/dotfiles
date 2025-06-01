#!/bin/bash

msgID="123456"

case $1 in
  increase)
    pamixer -i 5
    current_volume=$(pamixer --get-volume)
    dunstify -h int:value:$current_volume -t 500 -r $msgID "Volume set to $current_volume%"
    ;;
  decrease)
    pamixer -d 5
    current_volume=$(pamixer --get-volume)
    dunstify -h int:value:$current_volume -t 500 -r $msgID "Volume set to $current_volume%"
    ;;
  *)
    notify-send "Error"
    ;;
  esac
