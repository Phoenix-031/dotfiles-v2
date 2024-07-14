#!/bin/bash

eth_interface="enp8s0"
wifi_interfaces=("wlp7s0" "wlan1")

# Check if Ethernet is connected and has an IP address
if ip a show $eth_interface up | grep -q "state UP"; then
    ip_addr=$(ip -br address show $eth_interface | awk '{print $3}')
    echo "{\"text\":\"$ip_addr  \", \"tooltip\":\"Ethernet connected: $ip_addr\", \"class\":\"ethernet\"}"
else
    # Check each Wi-Fi interface
    for interface in "${wifi_interfaces[@]}"; do
        if ip a show $interface up | grep -q "state UP"; then
            essid=$(iwgetid -r $interface)
            signal=$(grep $interface /proc/net/wireless | awk '{print int($3 * 100 / 70)}')
            icon="󰤯 "
            if [ $signal -ge 80 ]; then
                icon="󰤟 "
            elif [ $signal -ge 60 ]; then
                icon="󰤢 "
            elif [ $signal -ge 40 ]; then
                icon="󰤥 "
            elif [ $signal -ge 20 ]; then
                icon="󰤨 "
            fi
            echo "{\"text\":\"$essid $icon\", \"tooltip\":\"Wi-Fi: $essid ($signal%)\", \"class\":\"wifi\"}"
            exit 0
        fi
    done
    # No network connected
    echo "{\"text\":\"󰤮 \", \"tooltip\":\"No network\", \"class\":\"disconnected\"}"
fi