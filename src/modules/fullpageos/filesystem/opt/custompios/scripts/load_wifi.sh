#!/bin/bash

echo "[wifi loader] Starting WiFi configuration import..."

if [ -f /boot/wifi.nmconnection ]; then
    echo "[wifi loader] Found /boot/wifi.nmconnection"

    cp /boot/wifi.nmconnection /etc/NetworkManager/system-connections/wifi.nmconnection
    chmod 600 /etc/NetworkManager/system-connections/wifi.nmconnection
    chown root:root /etc/NetworkManager/system-connections/wifi.nmconnection

    nmcli connection reload
    echo "[wifi loader] Configuration applied."
else
    echo "[wifi loader] No config found, skipping."
fi