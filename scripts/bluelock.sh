#!/bin/bash

export DISPLAY=:0

MAC=40:CB:C0:03:33:D5
THRESHOLD=-15


RSSI=`hcitool rssi $MAC 2>/dev/null| egrep -o "[-]?[0-9]+"`
if [[ $RSSI = "" ]]; then
    # bluetoothctl
bluetoothctl >/dev/null 2>&1 << EOF
connect $MAC
EOF
    # end bluetoothctl
fi


RSSI=`hcitool rssi $MAC 2>/dev/null| egrep -o "[-]?[0-9]+"`
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
exit 0

