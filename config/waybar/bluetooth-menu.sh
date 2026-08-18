#!/bin/bash

devices=$(bluetoothctl devices Paired)

if [ -z "$devices" ]; then
    zenity --info \
        --title="Bluetooth" \
        --text="Keine gekoppelten Geräte gefunden."
    exit 0
fi

selected=$(
    while read -r _ mac name; do
        if bluetoothctl info "$mac" | grep -q "Connected: yes"; then
            status="Verbunden"
        else
            status="Nicht verbunden"
        fi

        printf '%s\t%s\t%s\n' "$mac" "$name" "$status"
    done <<< "$devices" |
    zenity --list \
        --title="Bluetooth" \
        --text="Bluetooth-Geräte auswählen" \
        --width=420 \
        --height=300 \
        --column="MAC" \
        --column="Gerät" \
        --column="Status" \
        --print-column=1
)

if [ -n "$selected" ]; then
    mac=$(echo "$selected" | awk '{print $1}')

    if bluetoothctl info "$mac" | grep -q "Connected: yes"; then
        bluetoothctl disconnect "$mac"
    else
        bluetoothctl connect "$mac"
    fi
fi
