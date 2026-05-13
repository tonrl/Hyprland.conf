-----------------------------
---  Flating Window Rule  ---
-----------------------------

hl.window_rule({
        name = "setting_size_for_terminal",
        match = {
                class = "foot",

                float = true,
        },
        max_size = {750, 650},
        center = true,
})

-- XDG popup etc
hl.window_rule({
        name = "XDG_popup_config",
        match = {
                tag = "FILE_OP",
        },
        group = "barred",
        tag = "+Float",
        move = {462, 231},
        size = {787, 600},
        center = true,
})

hl.window_rule({
        name = "XDG_popup_config",
        match = {
                -- tag = "WebBrowser",
        },
        group = "barred",
        -- tag = "+Float",
        move = {462, 231},
        size = {787, 600},
        center = true,
})


hl.window_rule({
        name = "Def_rule_for_window",
        match = {
                tag = "ft_mit",

        },
        group = "barred",
        move = {601, 183},
        size = {650, 450},
        float = true,
})

hl.window_rule({
        name = "Mid_rule_for_window",
        match = {
                tag = "ft_mit_mid",

        },
        group = "barred",
        move = {601, 183},
        size = {750, 550},
        float = true,
})

hl.window_rule({
        name = "Large_rule_for_window",
        match = {
                tag = "ft_mit_lg",
        },
        group = "barred",
        move = {601, 183},
        size = {750, 650},
        float = true,
})

hl.window_rule({
        name = "Popup_rule_for_window",
        match = {
                tag = "POPUP",
        },
        group = "barred",
        move = {601, 183},
        size = {650, 250},
        float = true,
})

--------------------------
---Floating Window Auto---
--------------------------
-- hyprland share picker

hl.window_rule({
        match = {
                class = "hyprland-share-picker",
        },
        tag = "+ft_mit",
})

hl.window_rule({
        match = {
                tag = "NetWork",
        },
        tag = "+ft_mit_lg",
        pin = true,
        opaque = true,
})
-- KeePassXC

hl.window_rule({
        match = {
                tag = "KEEPASSXC",
        },
        float = true,
        group = "barred",
        size = {800, 650},
        move = {601, 183},
})

hl.window_rule({
        match = {
                title = "passdef - KeePassXC",
        },
        tag = "+KEEPASSXC",


})

hl.window_rule({
        match = {
                title = ".*- KeePassXC",
        },
        tag = "+KEEPASSXC",
})

hl.window_rule({
        match = {
                title = "KeePassXC -  Access Request",
        },
        tag = "+POPUP",
})

hl.window_rule({
        match = {
                title = "KeePassXC - Browser Access Request",
        },
        tag = "+POPUP",
})

hl.window_rule({
        match = {
                class = "org.keepassxc.KeePassXC",
        },
        pin = true,
        opaque = true,
        group = "barred",
        animation = "slide",
})

-- Manage Cookies and Site Data popup
hl.window_rule({
        match = {
                title = "Removing Cookies and Site Data",
        },
        float = true,
        size = {500, 300},
        group = "barred",
})


-- Audio Controller (easy easyeffects, pwvucontrol, overskyride)

hl.window_rule({
        match = {
                tag = "Audio_ctl",
        },
        float = true,
        pin = true,
        group = "barred",
        tag = "+ft_mit_mid",



})


-- firewall applet
hl.window_rule({
        match = {
                title = "firewall-applet",
        },
        float = true,
        move = {1600, 57},


})

hl.window_rule({
        match = {
                title = "About Firewall Applet"
        },
        float = true,
        move = {1600, 57},


})

-- windowrule = float on, match:title (firewall-applet)
-- windowrule = move 1600 57, match:title (firewall-applet)
-- windowrule = float on, match:title (About Firewall Applet)

-- Gnome Calculator
hl.window_rule({
        match = {
                class = "org.gnome.Calculator",

        },
        float = true,
        group = "barred",
        size = {360, 616},
        move=  {789, 209},

})

hl.window_rule({
        match = {
                title = ".*YouTube.*",
        },
        idle_inhibit = "focus",


})

hl.window_rule({
        match = {
                tag = "Yubico",
        },
        float = true,
        pin = true,
        group = "barred",
        size = {750, 700},
        move = {580, 209},
})




