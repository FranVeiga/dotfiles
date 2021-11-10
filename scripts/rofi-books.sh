#!/bin/bash

zathura "~/books/$(ls ~/books | rofi -dmenu -i -theme "~/.config/polybar/$(cat /tmp/theme)/scripts/rofi/launcher.rasi" -p "Read")"
