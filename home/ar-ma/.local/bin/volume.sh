#!/bin/bash

case "$1" in
    up)
        pamixer -i 5
        ;;
    down)
        pamixer -d 5
        ;;
    mute)
        pamixer -t
        ;;
esac

VOL=$(pamixer --get-volume)
MUTE=$(pamixer --get-mute)

if [ "$MUTE" = "true" ]; then
    ICON=""
    TEXT="Muted"
else
    if [ "$VOL" -ge 66 ]; then
        ICON=""
    elif [ "$VOL" -ge 33 ]; then
        ICON=""
    else
        ICON=""
    fi
    TEXT="${VOL}%"
fi

notify-send "Volume" "$ICON $TEXT" -h int:value:$VOL -h string:synchronous:volume -t 1000

