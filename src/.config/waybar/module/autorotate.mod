#!/bin/sh

HELPER="$HOME/.config/waybar/module/helper"

case "$1" in
    "get")
         pgrep -x "iio-hyprland" > /dev/null \
             && $HELPER/jsonify "on" \
             || $HELPER/jsonify "off"
         ;;
    "set")
        pkill -x iio-hyprland || iio-hyprland > /dev/null 2>&1
        pkill -RTMIN+7 waybar
        ;;
    *)
        echo "?"
        ;;
esac
