#!/usr/bin/env bash

# Kill any running instances of Waybar
pkill waybar

# Restart Waybar
waybar &

# Optional: Print a message to confirm Waybar was reloaded
notify-send "Waybar Reloaded" "Your Waybar configuration has been reloaded."
