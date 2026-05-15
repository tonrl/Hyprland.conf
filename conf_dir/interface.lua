-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
    general = {
        gaps_in  = 1,
        gaps_out = 1,

        border_size = 2,

        col = {
            active_border   = { colors = {"rgba(BfA9ffee)", "rgba(7857ffee)", "rgba(BfA9ffee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "master",
    },
    decoration = {
            rounding       = 3,
            rounding_power = 10,

            -- Change transparency of focused and unfocused windows
            active_opacity   = 0.9,
            inactive_opacity = 0.9,
            fullscreen_opacity = 1.0,

            shadow = {
                    enabled      = false,
                    range        = 4,
                    render_power = 3,
                    color        = 0xee1a1a1a,
            },

            blur = {
                    enabled   = true,
                    size      = 4,
                    passes    = 1,
                    vibrancy  = 0.1696,
            },
    },
    animations = {
            enabled = true,
            --
            hl.curve("myBezier", {type = "bezier", points =  { {0.10, 0.9}, {0.1, 1.05}}}),
            hl.curve("myBezierIn", {type = "bezier", points =  { {0.68, -0.55}, {0.265, 1.55}}}),
            hl.curve("termIn", {type = "bezier", points =  { {0.755, 0.05}, {0.855, 0.06}}}),
            --
            hl.animation({ leaf = "windows", enabled = true, speed = 1, 5, bezier = 'myBezier'}),
            hl.animation({ leaf = "windowsIn", enabled = true, speed = 1, 1, bezier = "myBezier", style = "gnomed"}),
            hl.animation({ leaf = "windowsOut", enabled = true, speed = 1, 1, bezier = "myBezier", style = "gnomed"}),
            hl.animation({ leaf = "windowsMove", enabled = true, speed = 1, 1, bezier = "myBezier", style = "slide"}),
            --
            hl.animation({ leaf = "windowsOut", enabled = true, speed = 1, 1, bezier = "default", style = "popin 80%"}),

            hl.animation({ leaf = "border", enabled = true, speed = 1, 10, bezier = "default"}),
            hl.animation({ leaf = "borderangle", enabled = true, speed = 5, bezier = "default", style = "once"}),

            hl.animation({ leaf = "fade", enabled = true, speed = 1, 10, bezier = "default"}),
            hl.animation({ leaf = "workspaces", enabled = true, speed = 1, 2, bezier = "default", style = "slidefade 10%"}),
            -- hl.animation({workspaces, 1, 4, myBezier}),
            hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 1, 3, bezier = "myBezier", style = "slidevert"}),
    },
    group = {
            auto_group = true,
            insert_after_current = true,
            drag_into_group = 2,
            merge_groups_on_drag = true,
            merge_floated_into_tiled_on_groupbar = true,
            col = {
                    border_active = { colors = {"rgba(BfA9ffee)", "rgba(7857ffee)", "rgba(BfA9ffee)"}, angle = 45 },
                    border_inactive = { colors = {"rgba(595959aa)"}},
        },
        groupbar = {
                enabled = true,
                stacked = false,
                gradients = false,
                gradient_round_only_edges = true,
                indicator_height = 3,
                height = 2,
                render_titles = false,
                scrolling = true,
                rounding = 1,
                round_only_edges = true,
                col = {
                        active = { colors = {"rgba(fe640bfc)"}},
                        inactive = {colors = {"rgba(dc8a7863)"}},
                },
                gaps_in = 1,
                gaps_out = 1,
                keep_upper_gap = false,
        },

    },

    -- dwindle = {
    --         pseudotile = true, -- Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    --         force_split = 2,
    --         preserve_split = true, -- You probably want this
    -- },
    master = {
            new_on_active = "after",
            orientation = "right",
            special_scale_factor = 0.98,
            allow_small_split = true,
            new_status = "inherit",
            --  mfact = 0.505,
            mfact = 0.6,
            new_on_top = false,
            always_keep_position = false,
    },
    misc = {
            force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
            disable_hyprland_logo = true,
            font_family = "JetBrainsMonoNerdFont",
            -- vfr = true, -- FIX:
            vrr = 2,
            disable_autoreload = true,
            focus_on_activate = true,
            on_focus_under_fullscreen = 1,
            middle_click_paste = false,
            initial_workspace_tracking = false,
            enable_anr_dialog = true,
            anr_missed_pings = 10,
            exit_window_retains_fullscreen = true,
    },
    xwayland = {
            enabled = true,
    },
    -- https://wiki.hypr.land/Configuring/Variables/#render
    render = {
            expand_undersized_textures = true,
    },

    -- https://wiki.hypr.land/Configuring/Variables/#cursor
    cursor = {
            enable_hyprcursor = true,
            invisible = false,
            inactive_timeout = 15,
            warp_on_change_workspace  = 1,
            zoom_factor = 1.0,
            hide_on_key_press = true,
    },

    ecosystem = {
            no_update_news = true,
            no_donation_nag = true,
            enforce_permissions = true,
    },

    experimental = {
            -- xx_color_management_v4 = true
    },

    debug = {
            disable_logs = true,
    },

})


