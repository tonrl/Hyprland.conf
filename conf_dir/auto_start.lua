-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function()
        hl.exec_cmd("uwsm app -- auto_start.sh")
end)
