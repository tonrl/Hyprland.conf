-- General Settings for Window Rules
-- local terminal_classes = {
--         "foot",
--         "footclient",
--         "Alacritty",
--         "kitty"
-- }
-- for _, class_name in ipairs(terminal_classes) do
--         hl.window_rule({
--                 match = { class = class_name },
--                 tag = "+term"
--         })
-- end

-- cliant, Tag rule
local cliant_rules = {
        ["+term"] = { "foot", "footclient", "Alacritty", "kitty" },
        ["+FILE_OP"] = { "xdg-desktop-portal-gt" },
        ["+noGroup"] = { "firefox", "firefoxnightly", "chromium", "Firefox Beta", "gnucash" },
        ["+email"] = { "org.mozilla.Thunderbird", "eu.betterbird.Betterbird" },
        ["+finance"] = {"gnucash"},
        ["+Opaque"] = {"gnucash"},
        ["+Audio_ctl"] = {"com.saivert.pwvucontrol", "com.github.wwmm.easyeffects", "io.github.kaii_lb.Overskride"},
        ["+NetWork"] = {"nm-connection-editor", "nm-applet"},
        ["+Yubico"] = {"com.yubico.yubioath", "authenticator"},
}

for tag, classes in pairs(cliant_rules) do
        for _, class_name in ipairs(classes) do
                hl.window_rule({
                        match = { class = class_name },
                        tag = tag
                })
        end
end


-- File Opener, Downloads Uploads etc

hl.window_rule({ match = { title = "Open.*" }, tag = "+WebBrowser" })
hl.window_rule({ match = { title = "Select File.*" }, tag = "+WebBrowser" })
hl.window_rule({ match = { title = "Save*" }, tag = "+WebBrowser" })
hl.window_rule({ match = { title = ".*Files.*" }, tag = "+WebBrowser" })
hl.window_rule({ match = { title = ".*Image.*" }, tag = "+WebBrowser" })
hl.window_rule({ match = { title = ".*Manager.*" }, tag = "+WebBrowser" })



-- Swaync
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

