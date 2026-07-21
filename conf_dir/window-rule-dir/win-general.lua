-- General Settings for Window Rules

-- Rule definition
local window_rules = {
        -- Format: { type = "class" or "title", tag = "+TAG", targets = { "app1", "app2" } }
        { type = "class", tag = "+term",     targets = { "foot", "footclient", "Alacritty", "kitty" } },
        { type = "class", tag = "+FILE_OP",  targets = { "xdg-desktop-portal-gt" } },
        { type = "class", tag = "+noGroup",  targets = { "firefox", "firefoxnightly", "chromium", "Firefox Beta", "gnucash" } },
        { type = "class", tag = "+email",    targets = { "org.mozilla.Thunderbird", "eu.betterbird.Betterbird" } },
        { type = "class", tag = "+finance",  targets = { "gnucash" } },
        { type = "class", tag = "+Opaque",   targets = { "gnucash" } },
        { type = "class", tag = "+Audio_ctl",targets = { "com.saivert.pwvucontrol", "com.github.wwmm.easyeffects", "org.kde.easyeffects", "io.github.kaii_lb.Overskride" } },
        { type = "class", tag = "+NetWork",  targets = { "nm-connection-editor", "nm-applet" } },
        { type = "class", tag = "+Yubico",   targets = { "com.yubico.yubioath", "authenticator" } },
        { type = "class", tag = "+Float",   targets = { "org.gnome.Snapshot"} },

        -- Title-based rules
        { type = "title", tag = "+KEEPASSXC",targets = { "passdef - KeePassXC", ".*- KeePassXC" } },
        { type = "title", tag = "+POPUP",    targets = { "KeePassXC - Access Request", "KeePassXC - Browser Access Request" } },
        { type = "title", tag = "+WebBrowser",    targets = { "Open.*", "Select File.*", "Save*", ".*Files.*", ".*Image.*", ".*Manager.*"} },
}

-- Rule
for _, rule in ipairs(window_rules) do
        for _, pattern in ipairs(rule.targets) do

                local match_criteria = {}
                if rule.type == "class" then
                        match_criteria = { class = pattern }
                elseif rule.type == "title" then
                        match_criteria = { title = pattern }
                end

                hl.window_rule({
                        match = match_criteria,
                        tag = rule.tag
                })
        end
end



-- SwayNC
hl.layer_rule({
        match = { namespace = "swaync-control-center" },
        blur = true,
        ignore_alpha = 0.5,
})

hl.layer_rule({
        match = { namespace = "swaync-notification-window" },
        blur = true,
        ignore_alpha = 0.5,
})

