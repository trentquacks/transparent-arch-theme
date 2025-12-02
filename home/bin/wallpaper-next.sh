#!/bin/bash

# A script that changes wallpaper based on time (and randomly)!!!
# This is a makeshift i will improve i prmise

# Requires arguments
if [[ $# -eq 0 ]] ; then
    echo "Usage: wallpaper-changer.sh 'any number or \$RANDOM'"
    exit 0
fi

wp_dir=$HOME/Desktop/Wallpaper

day_wallpaper=(
    "$wp_dir/magicday.png"
    "$wp_dir/kita.png"
    "$wp_dir/beach.png"
    "$wp_dir/bocchi.jpg"
    "$wp_dir/laundry.png"
    "$wp_dir/sky.jpg"
)

night_wallpaper=(
    "$wp_dir/magicnight.png"
    "$wp_dir/cozy.jpg"
    "$wp_dir/city.png"
)

hour=$(date +"%H")
current_wallpaper=$(swww query | grep -oP "$wp_dir\S+\.(jpg|png|jpeg|webp)" | head -1)


if [ $hour -lt 18 -a $hour -gt 5 ]; then
    declare -n time_wallpaper=day_wallpaper
else
    declare -n time_wallpaper=night_wallpaper
fi


for i in "${!time_wallpaper[@]}"; do
    if [[ "${time_wallpaper[$i]}" = "$current_wallpaper" ]]; then
        wallpaper_index=${i};
    fi
done


(( wallpaper_index += $1 ))
(( wallpaper_index %= ${#time_wallpaper[@]} ))
selected_wallpaper=${time_wallpaper[wallpaper_index]}

# Update Wallpaper
swww img "$selected_wallpaper" --transition-type outer --transition-pos 0.854,0.977 --transition-step 90 --transition-fps 120 

# Update hyprlock
conf="$HOME/.config/hypr/hyprlock.conf"
sed -i "/^background {/,/^}/{s|^[[:space:]]*path =.*|    path = $selected_wallpaper|}" "$conf"

# Get file depth for info.. (wehe)
file_depth=$(echo $selected_wallpaper | grep -o / | wc -l)
((file_depth += 1))

# Notifier
urwallpaper=$(echo "$selected_wallpaper loaded :3" | cut -d'/' -f $file_depth)
echo $urwallpaper
notify-send "randomized" "$urwallpaper"
