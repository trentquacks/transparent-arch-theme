if [[ "$1" == on ]] ; then
	hyprctl keyword decoration:blur:enabled false
	hyprctl keyword decoration:shadow:enabled false
fi

if [[ "$1" == off ]] ; then
	hyprctl keyword decoration:blur:enabled true
	hyprctl keyword decoration:shadow:enabled true
fi
