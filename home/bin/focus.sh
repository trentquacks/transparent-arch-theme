#!/bin/bash

CONFIG="$HOME/dotfiles/.config/hypr/hyprland.conf"
KITTY="$HOME/dotfiles/.config/kitty/kitty.conf"

if [[ "$1" == on ]] ; then
	notify-send "Hyprland" "time to focus ig"

	if grep -q "\$dark = .85" "$CONFIG"; then
		sed -i 's/\$dark = .85/\$dark = 1/g' "$CONFIG"
	fi	

	if grep -q "background_opacity .85" "$KITTY"; then
		sed -i 's/background_opacity .85/background_opacity 1/g' "$KITTY"
	fi

	# hyprctl keyword decoration:blur:enabled false
	# hyprctl keyword decoration:shadow:enabled false
	hyprctl keyword animations:enabled false
	hyprctl keyword general:border_size 3
	hyprctl keyword general:col.inactive_border "rgba(255,255,255,.05)"
	# swww img "/home/wuki/Desktop/Wallpaper/Black.png"
	systemctl --user stop wallpaper-changer.timer
	systemctl --user stop wallpaper-changer.service
	killall waybar
	killall swww-daemon
	kitten @ set-background-opacity --all 1
	systemd-inhibit --what=idle:sleep sleep 24h &

fi

if [[ "$1" == off ]] ; then
	notify-send "Hyprland" "a"

	if grep -q "background_opacity 1" "$KITTY"; then
		sed -i 's/background_opacity 1/background_opacity .85/g' "$KITTY"
	fi

	if grep -q "\$dark = 1" "$CONFIG"; then
		sed -i 's/\$dark = 1/\$dark = .85/g' "$CONFIG"
	fi

	hyprctl reload
	killall waybar
	waybar &
	swww-daemon &
	systemctl --user start wallpaper-changer.timer
	systemctl --user start wallpaper-changer.service
	kitten @ set-background-opacity --all 0.85
	pkill -f "sleep 24h"

fi
