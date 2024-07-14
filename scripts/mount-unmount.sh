#!/bin/bash

# Function to generate the unmount command
generate_unmount_command() {
    local device=$1
    echo "udisksctl unmount --block-device /dev/$device"
}

# List plugged-in storage devices
devices=$(lsblk -o NAME,SIZE,TYPE,MOUNTPOINT | grep 'disk\|part' | grep -v 'loop')

# Create an array to store device names and corresponding unmount commands
declare -a device_list

# Iterate through each device
while read -r line; do
    name=$(echo $line | awk '{print $1}')
    size=$(echo $line | awk '{print $2}')
    mountpoint=$(echo $line | awk '{print $4}')

    # Generate the unmount command for mounted devices
    if [ -n "$mountpoint" ]; then
        unmount_command=$(generate_unmount_command $name)
        device_list+=("$name $size")
    fi
done <<< "$devices"

# Use Rofi to display devices and unmount options
selected_device=$(echo "${device_list[@]}" | rofi -dmenu -p "Select a device to unmount:" | awk '{print $1}')

# Unmount the selected device if a valid option is chosen
if [ -n "$selected_device" ]; then
    eval "${device_list[$selected_device-1]}"
fi
