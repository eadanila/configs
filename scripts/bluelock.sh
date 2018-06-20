#!/bin/bash

export DISPLAY=:0

THRESHOLD=-12
RSSI=`hcitool rssi 40:CB:C0:03:33:D5 2>/dev/null| egrep -o "[-]?[0-9]+"`

if [[ $RSSI = "" ]]; then
    echo "Not connected."
    exit 0
fi

if [[ $RSSI -lt $THRESHOLD ]]; then
    if !(gnome-screensaver-command -q 2>/dev/null | grep "is active"); then
        gnome-screensaver-command -l
    fi
fi

echo "RSSI: $RSSI"


