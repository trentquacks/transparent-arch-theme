#!/bin/bash
# A script that changes wallpaper based on time!!!

user=$(whoami)
config=/home/$user/.config/hypr
hour=$(date +"%H")

if [ $hour -lt 18 -a $hour -gt 5 ]; then
    # Swaps day and night conf, hyprlock.conf becomes the usable one
    if [ -e "$config/hyprlock_day.conf" ]; then
        mv "$config/hyprlock.conf" "$config/hyprlock_night.conf"
	mv "$config/hyprlock_day.conf" "$config/hyprlock.conf"
    fi
else
    if [ -e "$config/hyprlock_night.conf" ]; then
        mv "$config/hyprlock.conf" "$config/hyprlock_day.conf"
	mv "$config/hyprlock_night.conf" "$config/hyprlock.conf"
    fi
fi

