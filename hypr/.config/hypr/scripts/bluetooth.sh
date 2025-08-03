#!/usr/bin/env bash


choice=$(bluetoothctl devices | sed -n '/^Device/p' | cut -f 3- -d " " | awk NF | sort | rofi -I -dmenu -config ~/.config/rofi/config_dmenu.rasi -p "Choose device") 

address=$(bluetoothctl devices | sed -n "/$choice/p" | cut -f 2 -d " ")

connected=$(bluetoothctl info $address | sed -n "/Connected/p" | cut -f 2 -d " ")

case $connected in
  yes)
    bluetoothctl disconnect $address
    ;;
  no)
    bluetoothctl connect $address & 
    sleep 10
    connected=$(bluetoothctl info $address | sed -n "/Connected/p" | cut -f 2 -d " ")
    if [ $connected = "no" ] ; then
      notify-send "Could not connect to device"
      pkill bluetoothctl
    else
      notify-send "Successfully connected"
    fi
    ;;
esac

