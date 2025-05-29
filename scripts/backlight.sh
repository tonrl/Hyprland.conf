#!/usr/bin/env bash

readonly icon_base="$HOME/.local/share/icons/ePapirus/32x32/"
high_icon="$icon_base/panel/brightness-high-symbolic.svg"
mid_icon="$icon_base/panel/brightness-symbolic.svg"
low_icon="$icon_base/panel/brightness-low-symbolic.svg" 
off_icon="$icon_base/panel/gpm-brightness-lcd-disabled.svg"
expireTime=1000

swaync_op="-h string:x-canonical-private-synchronous:brightness_notif"

command -v brightnessctl >/dev/null 2>&1 || {
        echo "brightnessctl is required but not installed." >&2
        exit 1
}

function get_brightness {
        brightness=$(brightnessctl get)
        max_brightness=$(brightnessctl max)
        echo $((brightness * 100 / max_brightness))
}

function notification_fn {
        local icon_op="$1"
        notify-send -a "System" -i "${icon_op}" -r 2593 -u low ${swaync_op} "Helligkeit: ${brightness}" "$bar" -t $expireTime
}

function send_notification {

        local brightness="$1"

        if [ "$brightness" -gt 0 ]; then
                bar=$(printf '─%.0s' $(seq 1 "$((brightness / 3))"))
        else
                bar=""
        fi

        if [ "$brightness" -eq 0 ]; then
                notify-send -a "System" -i "${off_icon}" -r 2593 -u low $swaync_op "Helligkeit: ${brightness}" "Backlight off" -t $expireTime
        else
                if [ "$brightness" -ge 75 ]; then
                        icon_op=${high_icon}

                elif [ "$brightness" -ge 50 ]; then
                        icon_op=${mid_icon}

                elif [ "$brightness" -ge 20 ]; then
                        icon_op=${low_icon}

                else
                        icon_op=${off_icon}
                fi  
                notification_fn "$icon_op"
        fi

}

function brightness_up {
        local brightness=$(get_brightness)

        if [ "$brightness" -lt 1 ]; then
                brightnessctl -qe s +1%
        elif [ "$brightness" -lt 10 ]; then
                brightnessctl -q s +1%
        else
                brightnessctl -q s +5%
        fi
        send_notification "$(get_brightness)"
}
function brightness_down {
        local brightness=$(get_brightness)

        if [ "$brightness" -le 1 ]; then
                brightnessctl -qe s 1%-
        elif [ "$brightness" -le 10 ]; then
                brightnessctl -q s 1%-
        else
                brightnessctl -q s 5%-
        fi
        send_notification "$(get_brightness)"
}

case $1 in
        up)
                brightness_up
                ;;
        down)
                brightness_down
                ;;
        *)
                echo "Usage: $0 {up|down}"
                exit 1
                ;;
esac


