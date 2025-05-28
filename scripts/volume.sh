#!/usr/bin/env bash

readonly icon_base="$HOME/.local/share/icons/ePapirus/32x32/"
# volume output
icon_volume_high="$icon_base/panel/audio-on.svg" 
icon_volume="$icon_base/panel/audio-volume-high.svg" 
icon_volume_mid="$icon_base/panel/audio-volume-medium.svg" 
icon_volume_low="$icon_base/panel/audio-volume-low.svg" 
icon_mute="$icon_base/panel/audio-volume-muted.svg"

# Volume input icons
mic_mute="$icon_base/panel/mic-off.svg"
mic_on="$icon_base/panel/mic-on.svg"

# Additional option
swaync_op="-h string:x-canonical-private-synchronous:brightness_notif"
expireTime=1000

function get_volume {
        amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

function is_mute {
        amixer get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

function mic_on_off {
        pactl get-source-mute @DEFAULT_SOURCE@ | grep -Po '(?<=Mute: )(yes|no)' | grep no > /dev/null
}

function send_notification {
        local volume=$(get_volume)
        # Make the bar with the special character ─ (it's not dash -)
        if [ "$volume" -gt 0 ]; then
                bar=$(seq -s "─" $(($volume / 3)) | sed 's/[0-9]//g')"─"
        else
                bar=""
        fi
        # Send the notification
        if [ "$volume" -ge 85 ]; then
                notify-send -a "System" -i "$icon_volume_high" -r 2593 -u low $swaync_op "Volume: ${volume}%" "$bar" -t $expireTime
        elif [ "$volume" -ge 50 ]; then
                notify-send -a "System" -i "$icon_volume" -r 2593 -u low $swaync_op "Volume: ${volume}%" "$bar" -t $expireTime

        elif [ "$volume" -ge 30 ]; then
                notify-send -a "System" -i "$icon_volume_mid" -r 2593 -u low $swaync_op "Volume: ${volume}%" "$bar" -t $expireTime
        elif [ "$volume" -eq 0 ]; then
                notify-send -a "System" -i "$icon_mute" -t $expireTime -r 2593 -u low $swaync_op "Volume: ${volume}%" "Your Speakers are Disabled" 
        else
                notify-send -a "System" -i "$icon_volume_low" -r 2593 -u low $swaync_op "Volume: ${volume}%" "$bar" -t $expireTime

        fi
}

function unmute {
        local volume=$(get_volume)
        if [ "$volume" -eq 0 ]; then
                amixer -D pulse set Master 5% > /dev/null
                send_notification
        else
                send_notification
        fi
}

function volume_down_mute {
        local volume=$(get_volume)
        if [ "$volume" -le 5 ]; then
                amixer -D pulse set Master 1+ off > /dev/null
                amixer -D pulse set Master 5%- > /dev/null
                send_notification
        elif is_mute ; then
                amixer -D pulse set Master on > /dev/null
                amixer -D pulse set Master 5%- > /dev/null
                send_notification
        else
                amixer -D pulse set Master on > /dev/null
                amixer -D pulse set Master 5%- > /dev/null
                send_notification
        fi
}

case $1 in
        up)
                # Set the volume on (if it was muted)
                amixer -D pulse set Master on > /dev/null
                # Up the volume (+ 5%)
                amixer -D pulse set Master 5%+ > /dev/null
                send_notification
                ;;
        down)
                volume_down_mute
                ;;
        mute)
                # Toggle mute
                volume=$(get_volume)
                echo "$volume"
                amixer -D pulse set Master 1+ toggle > /dev/null
                if is_mute ; then
                        notify-send -a "System" -i "$icon_mute" -t $expireTime -r 2593 -u low $swaync_op "Volume: ${volume}%" "Your Speakers are Disabled"
                else
                        unmute
                fi
                ;;
        mic)
                pactl set-source-mute @DEFAULT_SOURCE@ toggle
                if mic_on_off ; then 
                        notify-send -a "System" -i "$mic_on" -t $expireTime -r 2593 -u low $swaync_op "Microphone Enabled" "Your microphone is now turned on"
                else
                        notify-send -a "System" -i "$mic_mute" -t $expireTime -r 2593 -u low $swaync_op "Microphone Muted" "Your microphone is now turned off"
                fi
                ;;

esac
