#!/bin/bash

# Bring the wlan0 interface down
sudo ip link set dev wlan0 down

# Generate a random MAC address
RANDOM_MAC=$(printf '%02X:%02X:%02X:%02X:%02X:%02X\n' $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)))

# Change the MAC address of wlan0 to the random MAC address
sudo ip link set dev wlan0 address "$RANDOM_MAC"

# Bring the wlan0 interface up
sudo ip link set dev wlan0 up
ip addr > ipaddr.txt

# Check if the MAC address change was successful
if [ $? -eq 0 ]; then
    echo "MAC address of wlan0 has been changed to: $RANDOM_MAC"
else
    echo "Failed to change the MAC address of wlan0."
fi
