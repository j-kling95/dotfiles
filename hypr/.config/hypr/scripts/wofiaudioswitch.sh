#!/bin/bash
headphones (){
  pactl set-default-sink "bluez_output.28_9A_4B_FA_32_58.1" &&
  notify-send "Audio source" "Switched to headphones sound"
}

speakers (){
  pactl set-default-sink 56 &
  notify-send "Audio source" "Switched to speaker sound"
}

choosespeakers() { 
  choice=$(printf "Headphones\\nSpeakers" | rofi -dmenu -I -no-show-icons -p "Choose output")

  case "$choice" in
    Headphones) headphones;;
    Speakers) speakers;;
  esac
}

choosespeakers
