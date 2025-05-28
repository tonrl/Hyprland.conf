#!/usr/bin/env bash

icon_base="$HOME/.local/share/icons/ePapirus/32x32/"
high_icon="$icon_base/panel/brightness-high-symbolic.svg"
mid_icon="$icon_base/panel/brightness-symbolic.svg"
low_icon="$icon_base/panel/brightness-low-symbolic.svg" 
off_icon="$icon_base/panel/gpm-brightness-lcd-disabled.svg"
expireTime=1000

swaync_op="-h string:x-canonical-private-synchronous:brightness_notif"

function get_brightness {
        brightness=$(brightnessctl get)
        max_brightness=$(brightnessctl max)
        echo $((brightness * 100 / max_brightness))
}
function notify_send {
        notify-send -a "System" -i "${high_icon}" -r 2593 -u low $swaync_op "Brightness: ${brightness}" "$bar" -t $expireTime
}

function send_notification {

        brightness=$(get_brightness)
        brightness=${brightness%%.*}

        if [ "$brightness" -gt 0 ]; then
                bar=$(seq -s "─" $(($brightness / 3)) | sed 's/[0-9]//g')"─"
        else
                bar=""
        fi

        if [ "$brightness" -ge 75 ]; then
                notify-send -a "System" -i "${high_icon}" -r 2593 -u low $swaync_op "Brightness: ${brightness}" "$bar" -t $expireTime

        elif [ "$brightness" -ge 50 ]; then
                notify-send -a "System" -i "${mid_icon}" -r 2593 -u low $swaync_op "Brightness: ${brightness}" "$bar" -t $expireTime
        
        elif [ "$brightness" -ge 20 ]; then
                notify-send -a "System" -i "${low_icon}" -r 2593 -u low $swaync_op "Brightness: ${brightness}" "$bar" -t $expireTime

        elif [ "$brightness" -eq 0 ]; then
                notify-send -a "System" -i "${off_icon}" -r 2593 -u low $swaync_op "Brightness: ${brightness}" "Backlight off" -t $expireTime
        else
                notify-send -a "System" -i "${off_icon}" -r 2593 -u low $swaync_op "Brightness: ${brightness}" "$bar" -t $expireTime
        fi  

}

function brightness_up {
        brightness=$(get_brightness)
        brightness=${brightness%%.*}

        if [ "$brightness" -lt 1 ]; then
                brightnessctl -qe s +1%
        elif [ "$brightness" -lt 10 ]; then
                brightnessctl -q s +1%
        else
                brightnessctl -q s +5%
        fi
}
function brightness_down {
        brightness=$(get_brightness)
        brightness=${brightness%%.*}

        if [ "$brightness" -le 1 ]; then
                brightnessctl -qe s 1%-
        elif [ "$brightness" -le 10 ]; then
                brightnessctl -q s 1%-
        else
                brightnessctl -q s 5%-
        fi
}

case $1 in
        up)
                brightness_up
                send_notification
                ;;
        down)
                brightness_down
                send_notification
                ;;
esac


