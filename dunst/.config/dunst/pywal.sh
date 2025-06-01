#!/usr/bin/env bash

ln -sf ~/.cache/wal/dunstrc ~/.config/dunst/dunstrc

pkill dunst && dunstify "Theme changed!"
