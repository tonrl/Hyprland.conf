-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function()
        hl.exec_cmd("uwsm app -- auto_start.sh")
end)

-- hl.on("window.open", function()
--         hl.exec_cmd("paplay ~/.local/share/sounds/win-sounds/'Windows XP Critical Stop.mp3'")
-- end)
--
-- hl.on("hyprland.shutdown", function()
--         hl.exec_cmd("paplay ~/.local/share/sounds/win-sounds/'Windows XP Shutdown.mp3' && sleep 2")
-- end)
