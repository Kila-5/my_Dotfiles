#!/bin/bash

# Имена ваших устройств — замените на свои
SPEAKERS="alsa_output.pci-0000_00_1f.3.analog-stereo"
HEADPHONES="alsa_output.usb-HP__Inc_HyperX_Virtual_Surround_Sound_00000000-00.analog-stereo"

CURRENT=$(pactl get-default-sink)

if [ "$CURRENT" = "$SPEAKERS" ]; then
    pactl set-default-sink "$HEADPHONES"
    notify-send "Audio" " Headphones"
else
    pactl set-default-sink "$SPEAKERS"
    notify-send "Audio" "  Speakers"
fi
