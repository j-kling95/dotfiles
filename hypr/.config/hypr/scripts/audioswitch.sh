#!/bin/bash
headphones (){
  pactl set-default-sink "bluez_output.28:9A:4B:FA:32:58" &&
  notify-send "Audio source" "Switched to headphones sound"
}

earbuds (){
  pactl set-default-sink "bluez_output.60:3A:AF:EB:16_4A" &&
  notify-send "Audio source" "Switched to earbuds sound"
}

speakers (){
  pactl set-default-sink 56 &&
  notify-send "Audio source" "Switched to speaker sound"
}

choosespeakers() { 
  choice=$(printf "Earbuds\\nHeadphones\\nSpeakers" | rofi -dmenu -I -no-show-icons -p "Choose output" -config ~/.config/rofi/config_dmenu.rasi)

  case "$choice" in
    Headphones) headphones;;
    Speakers) speakers;;
    Earbuds) earbuds;;
  esac
}

choosespeakers
