#!/bin/bash
headphones (){
  pactl set-default-sink "bluez_output.28_9A_4B_FA_32_58.1" &&
  notify-send "Audio source" "Switched to headphones sound"
}

earbuds (){
  pactl set-default-sink "bluez_output.60_3A_AF_EB_16_4A.1" &&
  notify-send "Audio source" "Switched to earbuds sound"
}

speakers (){
  pactl set-default-sink 56 &&
  notify-send "Audio source" "Switched to speaker sound"
}

choosespeakers() { 
  choice=$(printf "Headphones\\nEarbuds\\nSpeakers" | rofi -dmenu -I -no-show-icons -p "Choose output" -config ~/.config/rofi/config_dmenu.rasi)

  case "$choice" in
    Headphones) headphones;;
    Speakers) speakers;;
    Earbuds) earbuds;;
  esac
}

choosespeakers
