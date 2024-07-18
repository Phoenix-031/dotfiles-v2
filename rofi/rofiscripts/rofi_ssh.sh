#!/bin/bash

# Path to your SSH config file
SSH_CONFIG="$HOME/.ssh/config"

# Function to extract hostnames from the SSH config file
get_ssh_hosts() {
    grep -E "^Host " "$SSH_CONFIG" | awk '{print $2}'
}

SSH_HOST=$(get_ssh_hosts | rofi -dmenu -p "SSH to:" -i)

if [ -n "$SSH_HOST" ]; then
    kitty -- bash -c "ssh $SSH_HOST; exec bash"
fi