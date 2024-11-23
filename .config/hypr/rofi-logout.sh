#!/usr/bin/env bash

# Prompt user for session management options
CHOICE=$(echo -e "Logout\nRestart\nPower Off" | rofi -dmenu -i -p "Session")

case "$CHOICE" in
    Logout)
        hyprctl dispatch exit ;;
    Restart)
        systemctl reboot ;;
    Power_Off)
        systemctl poweroff ;;
    *)
        exit 0 ;;
esac

