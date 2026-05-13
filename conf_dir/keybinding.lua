-------------
--- Imput ---
-------------
hl.config({
        input = {
                kb_layout  = "us",
                kb_variant = "",
                kb_model   = "",
                kb_options = "",
                kb_rules   = "",

                follow_mouse = 1,
                focus_on_close = 0,

                sensitivity = 1.0, -- -1.0 - 1.0, 0 means no modification.
                accel_profile = "adaptive",

                repeat_rate = 80,
                repeat_delay = 200,


                touchpad = {
                        natural_scroll = false,
                        disable_while_typing = true,
                        drag_lock = 1,
                },
        },
})
hl.gesture({
        fingers = 3,
        direction = "horizontal",
        action = "workspace"
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more

-- Applocations
-- require("conf_dir.applications")
require("conf_dir.start-app")

---------------------------
-- Move focus Up/Down/L/R --
----------------------------

-- Switch Active Window (With Vim key)
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction ="l"}))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r"}))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u"}))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d"}))
--
-- Move window key (Up/ Down)
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.swap({ direction = "u"}))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.swap({ direction = "d"}))
-- hl.binde(mainMod .. " + SHIFT + K", moveive, 0 -50
-- hl.binde(mainMod .. " + SHIFT + J", moveactive, 0 50

-- Move Windows key (Left (H)/ Right (L))

hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.swap({ direction ="l"}))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.swap({ direction = "r"}))


-- Move within groups
hl.bind("CTRL + SHIFT + H", hl.dsp.group.prev())
hl.bind("CTRL + SHIFT + L", hl.dsp.group.next())

-- To switch between windows in a floating workspace:
hl.bind(mainMod .. " + Tab", function()
        hl.dispatch(hl.dsp.window.cycle_next())    -- Change focus to another window
        hl.dispatch(hl.dsp.window.bring_to_top()) -- Bring it to the top
end)

----------------------------------
-- Switch-Move-Active Workspace --
----------------------------------

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 9 do
        hl.bind(mainMod .. " + " .. i,         hl.dsp.focus({ workspace = i }))
        hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end
hl.bind(mainMod .. " + 0",         hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))


--  Move to + - workspace
-- hl.bind("+ CTRL + ALT + H", hl.dsp.focus({ workspace = -1}))
-- hl.bind(mainMod .. " + CTRL + H", hl.dsp.focus({ workspace = m-1}))
-- hl.bind(" + CTRL + ALT + L", hl.dsp.focus({ workspace = "+1"}))
-- hl.bind(mainMod .. "( + CTRL + L", hl.dsp.focus({ workspace = m+1}))

--Scroll through existing workspaces with mainMod + scroll
-- hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = e+1}))
-- hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = e-1}))
----------------------------------
--      Special Workspaces      --
----------------------------------

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + U",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + U", hl.dsp.window.move({ workspace = "special:magic" }))
-- Hide Stuff to special workspace
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.workspace.toggle_special("magic"))


----------------------------------
---           Resize           ---
----------------------------------

-- Switch to a submap called `resize`.
hl.bind("ALT + R", hl.dsp.submap("resize"))

-- Start a submap called "resize".
hl.define_submap("resize", function()

        -- Set repeating binds for resizing the active window.
        -- hl.bind("L", hl.resize({ x = 10, y = 0, relative = true}), { repeating = true })
        -- hl.bind("H", hl.resize({ x = -10, y = 0, relative = true}), { repeating = true })
        -- hl.bind("K", hl.resize({ x = 0, y = 10, relative = true}), { repeating = true })
        -- hl.bind("J", hl.resize({ x = 10, y = -10, relative = true}), { repeating = true })

        -- Use `reset` to go back to the global submap
        hl.bind("escape", hl.dsp.submap("reset"))

end)

----------------------------------
--      Special Workspaces      --
----------------------------------


-------------------------------------
-- Special Keys (Volumes Backlight etc) --
-------------------------------------

-- Reload Config --
hl.bind("XF86Favorites", hl.dsp.exec_cmd("hyprctl reload"))

-- Backlight Up down --
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("backlight.sh up"), {locked = true})
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("backlight.sh down"), {locked = true})

-- Volume Up Down Mute --
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("volume.sh up || pkill -RTMIN+8 waybar"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("volume.sh down || pkill -RTMIN+8 waybar"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("volume.sh mute"))
-- Mic --
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("volume.sh mic"))

-- Audioplay --
hl.bind("XF86NotificationCenter", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86HangupPhone", hl.dsp.exec_cmd("bluetooth.sh"))
hl.bind("XF86PickupPhone", hl.dsp.exec_cmd("swaync-client -t"))

-- WiFi on off --
hl.bind("XF86WLAN", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/wifi.sh"))

-- grayscale --
hl.bind("XF86Display", hl.dsp.exec_cmd("hyprshade toggle ~/.config/hypr/conf_dir/shader.d/grayscale.glsl"))
