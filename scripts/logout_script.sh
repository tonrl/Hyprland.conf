#!/usr/bin/env bash

WLOGOUTPID=$(pgrep wlogout)

if [[ -z "$WLOGOUTPID" ]]; then
        paplay ~/.local/share/sounds/win-sounds/'Windows XP Logoff Sound.mp3' &
        wlogout 
        if [[ $? -ne 0 ]]; then
                paplay ~/.local/share/sounds/win-sounds/'Windows XP Logon Sound.mp3' 
        fi
fi
