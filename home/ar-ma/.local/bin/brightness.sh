#!/bin/bash

case "$1" in
    up)
        brightnessctl -q set 5%+
        ;;
    down)
        brightnessctl -q set 5%-
        ;;
esac

BRIGHT=$(brightnessctl -m | cut -d',' -f4 | tr -d '%')

notify-send "Brightness" "${BRIGHT}%" -h int:value:$BRIGHT -h string:synchronous:brightness -t 1000
