#!/bin/bash

wallpaper_dir="$HOME/.config/wallpaper"
transition_type="wipe"

wallpaper_images=("$wallpaper_dir"/*.{jpg,jpeg,png})

if [ ${#wallpaper_images[@]} -eq 0 ]; then
    echo "No images found in $wallpaper_dir"
    exit 1
fi

random_wallpaper="${wallpaper_images[$RANDOM % ${#wallpaper_images[@]}]}"

swww img "$random_wallpaper"\
    --transition-bezier .43,1.19,1,.4 \
    --transition-fps=60 \
    --transition-type=$transition_type \
    --transition-duration=0.7 \
    --transition-pos "$( hyprctl cursorpos )"

