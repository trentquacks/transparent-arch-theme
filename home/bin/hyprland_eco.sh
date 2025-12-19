if [[ "$1" == on ]] ; then
	hyprctl keyword decoration:blur:enabled false
	hyprctl keyword decoration:shadow:enabled false
	hyprctl keyword animations:enabled false
	hyprctl keyword monitor eDP-1,1920x1080@60.00hz, 0x0, 1.25
fi

if [[ "$1" == off ]] ; then
	hyprctl keyword decoration:blur:enabled true
	hyprctl keyword decoration:shadow:enabled true
	hyprctl keyword animations:enabled true
	hyprctl keyword monitor eDP-1,1920x1080@165.01hz, 0x0, 1.25
fi
