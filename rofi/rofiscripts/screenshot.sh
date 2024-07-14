#!/bin/bash

# Define the options
options="Output\nWindow\nRegion\nActive"

# Display the options in Rofi and capture the selected option
selected=$(echo -e "$options" | rofi -dmenu -p "Take a screenshot:" | tr '[:upper:]' '[:lower:]')

# Define the screenshot directory
screenshot_dir=~/Pictures/Screenshots/hyprshot_captures

# Create the screenshot directory if it doesn't exist
mkdir -p "$screenshot_dir"

# Add a short delay to ensure Rofi menu hides before taking a screenshot
sleep 0.2

# Take the appropriate screenshot based on the selected option
case "$selected" in
    "output")
        hyprshot -m output -o "$screenshot_dir/$(date +%Y-%m-%d-%H-%M-%S).png"
        ;;
    "window")
        hyprshot -m window -o "$screenshot_dir/$(date +%Y-%m-%d-%H-%M-%S).png"
        ;;
    "region")
        hyprshot -m region -o "$screenshot_dir/$(date +%Y-%m-%d-%H-%M-%S).png"
        ;;
    "active")
        hyprshot -m active -o "$screenshot_dir/$(date +%Y-%m-%d-%H-%M-%S).png"
        ;;
    *)
        echo "No valid option selected."
        ;;
esac
