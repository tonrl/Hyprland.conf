#!/usr/bin/env bash

easyeffects --gapplication-service&

# Network
nm-applet --indicator &
bluetoothctl power off &

# Hypridle
hypridle &

# Cursor
hyprctl setcursor "Banana" 40 &
gsettings set org.gnome.desktop.interface cursor-theme "Banana" &
gsettings set org.gnome.desktop.interface cursor-size 40 &

# Uncomment the following lines if you want to use a different cursor theme
# hyprctl setcursor "Bibata-Modern-Classic" 16 &
# gsettings set org.gnome.desktop.interface cursor-theme "Bibata-Modern-Classic" &
# gsettings set org.gnome.desktop.interface cursor-size 16 &

# GTK theme
gsettings set org.gnome.desktop.interface gtk-theme "deepin-dark" &
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark" &
gsettings set org.gnome.desktop.interface font-name 'JetBrainsMono Nerd Font 10' &

# xdg-desktop-portal related
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &

# Polkit Gnome
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# udiskie
udiskie &
# Start Waybar
# $HOME/.config/hypr/scripts/waybar-re.sh &
startWall.sh &

# Start aa-notify
aa-notify -p -s 1 -w 60 -f /var/log/audit/audit.log &

# Set Default Browser
xdg-settings set default-web-browser firefox.desktop &

# KeePassXC
(sleep 1 && keepassxc) &

# Copyq
# Uncomment the following line if you want to use Copyq
# env QT_QPA_PLATFORM=xcb copyq --start-server &
wl-paste --watch cliphist store &

# Firewall applet
(sleep 1 && firewall-applet) &

# Input method
fcitx5 &

# Activate Linux message
# Uncomment the following line if you want to activate Linux message
# activate-linux -b &

# Uncomment the following line if you want to start Chromium in a special workspace
# [workspace special silent] chromium

