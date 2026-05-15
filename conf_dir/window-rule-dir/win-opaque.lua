-- Opacity class based

local window_rules = {
        -- Class-based Opacity Rules
        {
                type = "class",
                tag = "+Opaque",
                targets = {
                        "mpv", "vlc", "org.gnome.Evince", "thunderbird", "virt-manager",
                        "firefox", "Firefox Beta", "firefoxnightly", "chromium",
                        "io.freetubeapp.FreeTube", "imv", "org.gnome.Loupe",
                        "org.inkscape.Inkscape", "org.gnome.Snapshot", "giv.*"
                }
        },

        -- Title-based Opacity Rules
        {
                type = "title",
                tag = "+Opaque",
                targets = {
                        ".*Prime Video.*", ".*Netflix.*", ".*YouTube.*", ".*Instagram.*",
                        ".*libreoffice.*", ".*Hyprland.*", ".*ArchWiki.*",
                        ".*DuckDuckGo.*", ".*GitHub.*"
                }
        }
}

for _, rule in ipairs(window_rules) do
        for _, pattern in ipairs(rule.targets) do
                hl.window_rule({
                        -- Dynamically uses either class = pattern or title = pattern
                        match = { [rule.type] = pattern },
                        tag = rule.tag
                })
        end
end
