------------------------------
--- WINDOWS AND WORKSPACES ---
------------------------------

-- See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
-- See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules


hl.window_rule ({
        name = "supress_event",
        suppress_event = "maximize",
        match = {
                class = ".*"
        }
})


hl.window_rule({
        name = "full_screen_border_color",
        border_color = "rgb(5A6446)",
        match = {
                fullscreen = true
        }
})

------------------------------
--- Set rule based on tags ---
------------------------------

require("conf_dir.window-rule-dir.win-general")
require("conf_dir.window-rule-dir.win-floating")
require("conf_dir.window-rule-dir.win-opaque")
require("conf_dir.window-rule-dir.win-no-screen")

-- Enable or disable group by default

hl.window_rule({
        name = "Terminal_set",
        group = "set",
        animation = "gnomed",
        opacity = 0.9,
        match = {
                tag = "term"
        }
})

hl.window_rule({
        name = "group_set_mail",
        group = "set",
        match = {
                tag = "mail"
        }
})

hl.window_rule({
        name = "group_barred",
        group = "barred",
        match = {
                tag = "noGroup"
        }
})

-- No scren share
hl.window_rule({
        no_screen_share = true,
        match = {
                tag = "noScreen"
        }
})

-- Opaque
hl.window_rule({
        opaque = true,
        match = {
                tag = "Opaque"
        }
})
-- Finance app
hl.window_rule({
        workspace = 2,
        match = {
                tag = "finance"
        }
})

hl.window_rule({
        workspace = "special:magic",
        match = {
                tag = "email"
        }
})

------------------------------
-- Rule for floating window --
------------------------------


-- Float
hl.window_rule({
        float = true,
        match = {
                tag = "Float"
        }
})
-- Floating size
hl.window_rule({
        float = true,
        center = true,
        max_size = {750, 650},
        match = {
                tag = "FSize"
        }
})
