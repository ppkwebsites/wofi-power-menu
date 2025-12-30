# wofi-power-menu
power menu in wofi for hyprland

Minimalist Wofi Power Menu for Hyprland
A sleek, lightweight, and functional power menu built using Wofi for Hyprland. This menu provides options to Log Out, Reboot, and Shut Down with a clean, centered aesthetic that fits any minimalist desktop setup.

Features
Simple UI: Clean design focused on essential power actions [00:15].

Custom Styling: Uses CSS for transparency and centered text alignment [02:40].

Lightweight: Minimal dependencies, relying on standard system commands like reboot and poweroff [05:21].

Prerequisites
Ensure you have the following installed:

wofi

hyprland

yazi (optional, used in the video as a file manager) [00:43]

Installation
1. Configuration Files
Create a folder named wofi in your .config directory:

Bash

mkdir -p ~/.config/wofi
Create two specific files within that folder:

config.power This file handles the alignment and layout. Crucially, set content_align to center to prevent the text from defaulting to the left [02:49].

Plaintext

# Example basic settings
width=400
height=300
location=center
content_align=center
style_widgets.css This file controls the look and feel, including colors and backgrounds [03:16].

CSS

/* Your custom CSS here */
window {
    background-color: rgba(0, 0, 0, 0.8);
}
/* Adjust selection and text colors to your preference */
2. The Power Script
Create a bash script (e.g., power_menu.sh) in your local bin or .config folder. The script uses a case statement to execute commands based on your selection [04:25].

Bash

#!/bin/bash

# Paths to config files [00:04:37]
CONFIG="$HOME/.config/wofi/config.power"
STYLE="$HOME/.config/wofi/style_widgets.css"

entries="Logout\nReboot\nShutdown"

selected=$(echo -e $entries | wofi --conf=$CONFIG --style=$STYLE --dmenu --cache-file /dev/null)

case $selected in
  Logout)
    hyprctl dispatch exit 0 ;;
  Reboot)
    reboot ;;
  Shutdown)
    poweroff ;;
esac
Make the script executable:

Bash

chmod +x ~/.config/wofi/power_menu.sh
Usage
You can trigger the menu by running the script directly or binding it to a key in your hyprland.conf:

Plaintext

bind = $mainMod, X, exec, ~/.config/wofi/power_menu.sh
Credits
Based on the tutorial by Peter Tech. Watch the full video for a deep dive into the styling and implementation details.
