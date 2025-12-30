#!/bin/bash

# Configuration paths
CONFIG="$HOME/.config/wofi/config.power"
STYLE="$HOME/.config/wofi/style.widgets.css"

# Entries
entries="Logout\nReboot\nShutdown"

# Launch Wofi
selected=$(echo -e "$entries" | wofi --dmenu --conf "$CONFIG" --style "$STYLE" --cache-file /dev/null | awk '{print tolower($1)}')

case $selected in
  logout)
    loginctl terminate-user $USER ;;
  reboot)
    systemctl reboot ;;
  shutdown)
    systemctl poweroff ;;
esac
